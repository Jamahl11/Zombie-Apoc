	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, lr}
	mov	r4, #67108864
	ldr	r2, .L4
	ldr	r1, .L4+4
	str	r3, [r2]
	ldr	ip, .L4+8
	ldr	r0, .L4+12
	ldr	r2, .L4+16
	str	r3, [r1]
	ldr	r1, .L4+20
	str	r3, [ip]
	str	r3, [r0]
	str	r3, [r2]
	strh	r3, [r4, #18]	@ movhi
	ldr	r2, .L4+24
	strh	r3, [r4, #16]	@ movhi
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	mov	r3, #5120
	mov	r2, #7936
	strh	r3, [r4]	@ movhi
	mov	r0, #3
	strh	r2, [r4, #12]	@ movhi
	mov	r3, #256
	ldr	r4, .L4+28
	mov	r2, #83886080
	ldr	r1, .L4+32
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L4+36
	ldr	r1, .L4+40
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+44
	ldr	r1, .L4+48
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	state
	.word	lost
	.word	score
	.word	pistolUnlocked
	.word	rifleUnlocked
	.word	seed
	.word	initGame
	.word	DMANow
	.word	startPal
	.word	9584
	.word	startTiles
	.word	100726784
	.word	startMap
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #4608
	mov	r0, #7936
	mov	r1, #0
	push	{r4, lr}
	strh	r2, [r3]	@ movhi
	strh	r0, [r3, #10]	@ movhi
	ldr	r2, .L8
	ldr	r0, .L8+4
	ldrh	ip, [r2, #48]
	ldr	r2, .L8+8
	ldr	r3, .L8+12
	strh	ip, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+20
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L8+24
	ldr	r3, .L8+28
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	setupSounds
	.word	setupInterrupts
	.word	introMusic_length
	.word	introMusic_data
	.word	playSoundA
	.size	initialize, .-initialize
	.align	2
	.global	goToInstruct
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstruct, %function
goToInstruct:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	ldr	r2, .L12
	push	{r4, lr}
	ldr	r3, .L12+4
	ldr	r4, .L12+8
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L12+12
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r3, #5120
	mov	r1, #7936
	strh	r3, [r2]	@ movhi
	mov	r0, #3
	strh	r1, [r2, #12]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L12+16
	mov	lr, pc
	bx	r4
	mov	r3, #2416
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L12+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L12+24
	ldr	r1, .L12+28
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	state
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	instructionsPal
	.word	instructionsTiles
	.word	100726784
	.word	instructionsMap
	.size	goToInstruct, .-goToInstruct
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r0, #56064
	mov	r2, #4864
	ldr	r1, .L16
	push	{r4, lr}
	strh	r2, [r3]	@ movhi
	strh	r0, [r3, #8]	@ movhi
	ldr	r2, .L16+4
	strh	r1, [r3, #10]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r3, .L16+8
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L16+12
	ldr	r3, .L16+16
	ldr	r4, .L16+20
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L16+24
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L16+28
	ldr	r1, .L16+32
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L16+36
	ldr	r1, .L16+40
	mov	lr, pc
	bx	r4
	mov	r3, #2464
	mov	r0, #3
	ldr	r2, .L16+44
	ldr	r1, .L16+48
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L16+52
	ldr	r1, .L16+56
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L16+60
	ldr	r1, .L16+64
	mov	lr, pc
	bx	r4
	ldr	r2, .L16+68
	mov	r3, #16384
	mov	r0, #3
	ldr	r1, .L16+72
	mov	lr, pc
	bx	r4
	ldr	r3, .L16+76
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L16+80
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
	.word	-10488
	.word	stopSound
	.word	gameMusic_length
	.word	gameMusic_data
	.word	playSoundA
	.word	DMANow
	.word	bottomBgPal
	.word	14688
	.word	topBgTiles
	.word	100718592
	.word	topBgMap
	.word	100696064
	.word	bottomBgTiles
	.word	100710400
	.word	bottomBgMap
	.word	83886592
	.word	playerSpriteSheetPal
	.word	100728832
	.word	playerSpriteSheetTiles
	.word	hideSprites
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L34
	ldr	r5, .L34+4
	ldr	r2, [r4]
	ldrh	r3, [r5]
	add	r2, r2, #1
	tst	r3, #4
	str	r2, [r4]
	beq	.L19
	ldr	r2, .L34+8
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L32
.L19:
	tst	r3, #8
	beq	.L20
	ldr	r2, .L34+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L33
.L20:
	tst	r3, #1
	beq	.L18
	ldr	r3, .L34+8
	ldrh	r3, [r3]
	tst	r3, #1
	moveq	r2, #1
	ldreq	r3, .L34+12
	streq	r2, [r3]
.L18:
	pop	{r4, r5, r6, lr}
	bx	lr
.L33:
	bl	goToInstruct
	ldrh	r3, [r5]
	b	.L20
.L32:
	bl	goToGame
	ldr	r3, .L34+16
	ldr	r0, [r4]
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	b	.L19
.L35:
	.align	2
.L34:
	.word	seed
	.word	oldButtons
	.word	buttons
	.word	.LANCHOR0
	.word	srand
	.size	start, .-start
	.align	2
	.global	instruct
	.syntax unified
	.arm
	.fpu softvfp
	.type	instruct, %function
instruct:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L41
	ldrh	r3, [r3]
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L41+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	goToGame
.L42:
	.align	2
.L41:
	.word	oldButtons
	.word	buttons
	.size	instruct, .-instruct
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #3
	ldr	r2, .L45
	ldr	r3, .L45+4
	ldr	r5, .L45+8
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	mov	r0, r4
	mov	r2, #117440512
	ldr	r1, .L45+12
	mov	r3, #512
	mov	lr, pc
	bx	r5
	ldr	r3, .L45+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L45+20
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L45+24
	ldr	r3, .L45+28
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r1, #5120
	mov	r2, #7936
	strh	r1, [r3]	@ movhi
	mov	r0, r4
	strh	r2, [r3, #12]	@ movhi
	ldr	r1, .L45+32
	mov	r3, #256
	mov	r2, #83886080
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #2960
	mov	r2, #100663296
	ldr	r1, .L45+36
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #1024
	ldr	r2, .L45+40
	ldr	r1, .L45+44
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L46:
	.align	2
.L45:
	.word	state
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	stopSound
	.word	introMusic_length
	.word	introMusic_data
	.word	playSoundA
	.word	pausePal
	.word	pauseTiles
	.word	100726784
	.word	pauseMap
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L59
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L48
	ldr	r2, .L59+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L57
.L48:
	tst	r3, #8
	beq	.L47
	ldr	r3, .L59+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L58
.L47:
	pop	{r4, lr}
	bx	lr
.L58:
	pop	{r4, lr}
	b	goToStart
.L57:
	bl	goToGame
	ldrh	r3, [r4]
	b	.L48
.L60:
	.align	2
.L59:
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	lr, #4
	ldr	ip, .L63
	ldr	r4, .L63+4
	mov	r0, #3
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L63+8
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #7936
	mov	r2, #5120
	strh	r2, [r3]	@ movhi
	strh	r1, [r3, #12]	@ movhi
	ldr	r2, .L63+12
	mov	lr, pc
	bx	r2
	ldr	r3, .L63+16
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L63+20
	ldr	r3, .L63+24
	mov	lr, pc
	bx	r3
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L63+28
	ldr	r1, .L63+32
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L63+36
	ldr	r1, .L63+40
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L63+44
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L63+48
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L64:
	.align	2
.L63:
	.word	state
	.word	DMANow
	.word	losePal
	.word	stopSound
	.word	introMusic_length
	.word	introMusic_data
	.word	playSoundA
	.word	8736
	.word	loseTiles
	.word	100726784
	.word	loseMap
	.word	hideSprites
	.word	shadowOAM
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L74
	mov	lr, pc
	bx	r3
	ldr	r3, .L74+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L74+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L74+12
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L74+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L74+20
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L66
	ldr	r3, .L74+24
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L72
.L66:
	ldr	r3, .L74+28
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L73
	pop	{r4, lr}
	bx	lr
.L73:
	mov	r3, #67108864
	mov	r2, #7936
	pop	{r4, lr}
	strh	r2, [r3, #10]	@ movhi
	b	goToLose
.L72:
	bl	goToPause
	b	.L66
.L75:
	.align	2
.L74:
	.word	updateGame
	.word	shadowGame
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	lost
	.size	game, .-game
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L83
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L83+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L76
	ldr	r3, .L83+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L82
.L76:
	pop	{r4, lr}
	bx	lr
.L82:
	pop	{r4, lr}
	b	goToStart
.L84:
	.align	2
.L83:
	.word	showScore
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L100
	ldr	r6, .L100+4
	ldr	fp, .L100+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L100+12
	mov	lr, pc
	bx	r3
	ldr	r5, .L100+16
	ldr	r1, [r6]
	ldrh	r0, [fp]
	ldr	r10, .L100+20
	ldr	r9, .L100+24
	ldr	r8, .L100+28
	ldr	r7, .L100+32
	ldr	r4, .L100+36
.L87:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r1, #4
	ldrls	pc, [pc, r1, asl #2]
	b	.L95
.L89:
	.word	.L93
	.word	.L92
	.word	.L91
	.word	.L90
	.word	.L88
.L88:
	mov	lr, pc
	bx	r7
	ldr	r1, [r6]
	ldrh	r0, [fp]
	b	.L87
.L90:
	mov	lr, pc
	bx	r8
	ldr	r1, [r6]
	ldrh	r0, [fp]
	b	.L87
.L91:
	mov	lr, pc
	bx	r9
	ldr	r1, [r6]
	ldrh	r0, [fp]
	b	.L87
.L92:
	tst	r0, #4
	beq	.L95
	tst	r3, #4
	beq	.L99
.L95:
	mov	r0, r3
	b	.L87
.L93:
	mov	lr, pc
	bx	r10
	ldr	r1, [r6]
	ldrh	r0, [fp]
	b	.L87
.L99:
	ldr	r3, .L100+40
	mov	lr, pc
	bx	r3
	ldr	r1, [r6]
	ldrh	r0, [fp]
	b	.L87
.L101:
	.align	2
.L100:
	.word	initialize
	.word	state
	.word	buttons
	.word	mgba_open
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	lose
	.word	67109120
	.word	goToGame
	.size	main, .-main
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	seed,4,4
	.comm	state,4,4
	.global	cheat
	.comm	soundB,32,4
	.comm	soundA,32,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	cheat, %object
	.size	cheat, 4
cheat:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
