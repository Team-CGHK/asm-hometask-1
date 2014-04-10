section .text

extern WriteConsoleA
extern GetStdHandle

;; int greet() ______________________________________________________________________________________________
global greet

	greet:

		;; here we prepare an arg for GetStdHandle call ;;
		mov rcx, [STD_OUTPUT_HANDLE]   ; rcx = *STD_OUTPUT_HANDLE, which is const to tell that we wand STDOUT
		call GetStdHandle   ; rax = GetStdHandle(STD_OUTPUT_HANDLE);

		;; here we prepare args for function call ;;
		mov rcx, rax        ; rcx = arg0, which is StdHandle. it is used by the core as a target to write to;
		mov rdx, msg		; rdx = arg1, which is message's address in memory;
		mov r8, msg_size    ; r8  = arg2, which is message's length;
		sub rsp, 8          ; allocate long at stack to pass its address as arg3
		mov r9, rsp         ; r9  = arg3, which is an address to put the number of bytes written;
		push 0              ; push  arg4, which is reserved argument, it has no use;
		call WriteConsoleA  ; rax = WriteConsoleA(arg0, arg1, arg2, arg3, arg4);
							; but we don't need its return value, it's just 0 or 1

		add esp, 8          ; pop arg3 from stack;
		pop rax             ; rax = %that long, whose address we passed as arg3%;
		ret

;; __________________________________________________________________________________________________________

section .data
	msg       DB   "Hello, world!", 10, 0     ; null-terminated C-string
	msg_size  EQU  $ - msg               
	STD_OUTPUT_HANDLE DD -11


;; x64 windows calling conventions:
;; args: RCX,   RDX,   R8,    R9,    [rsp], [rsp+8], ... -- if arg is integer, struct of address
;;       XMM0L, XMM1L, XMM2L, XMM3L, [rsp], [rsp+8], ... -- if arg is floating point number
;;       ^ first 4 args in regs      ^ others in stack
;; 
;; return value is stored RAX
;;
;; if return value doesn't fit 64 bits than the caller allocates memory for it and passes the address
;; as arg0 (RCX), then the callee places return value there and returns exactly the same address in RAX

; fucnction called: rcx = arg0, rdx = arg1;
; push rcx
; push rdx
; use rcx rdx
; pop rdx
; pop rcx
; ret