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
	.file	"game.c"
	.text
	.align	2
	.global	interruptHandler
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L27
	ldrh	r1, [r3, #2]
	tst	r1, #1
	push	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	beq	.L2
	ldr	r3, .L27+4
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L4
	ldr	r2, [r3, #28]
	ldr	r1, [r3, #20]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #28]
	ble	.L4
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L24
	ldr	r0, .L27+8
	ldr	r1, .L27+12
	ldr	r0, [r0]
	str	r2, [r3, #12]
	str	r2, [r0, #20]
	strh	r2, [r1, #2]	@ movhi
.L4:
	ldr	r3, .L27+16
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L25
.L8:
	ldr	r2, .L27
	ldrh	r3, [r2, #2]
	orr	r3, r3, #1
	strh	r3, [r2, #2]	@ movhi
.L2:
	ldr	r3, .L27
	ldrh	r3, [r3, #2]
	tst	r3, #32
	beq	.L11
	ldr	r0, .L27+20
	ldr	r3, [r0]
	ldr	r1, .L27+24
	add	r3, r3, #1
	smull	r2, r1, r3, r1
	asr	r2, r3, #31
	add	r1, r1, r3
	rsb	r2, r2, r1, asr #5
	rsb	r2, r2, r2, lsl #4
	sub	r3, r3, r2, lsl #2
	str	r3, [r0]
.L11:
	mov	r1, #1
	ldr	r3, .L27
	ldrh	r3, [r3, #2]
	tst	r3, #64
	ldrne	r2, .L27+28
	ldrne	r3, [r2]
	addne	r3, r3, #1
	strne	r3, [r2]
	ldr	r3, .L27
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L25:
	ldr	r2, [r3, #28]
	ldr	r1, [r3, #20]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #28]
	ble	.L8
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L26
	ldr	r0, .L27+8
	ldr	r1, .L27+12
	ldr	r0, [r0]
	str	r2, [r3, #12]
	str	r2, [r0, #32]
	strh	r2, [r1, #6]	@ movhi
	b	.L8
.L24:
	ldm	r3, {r0, r1}
	ldr	r3, .L27+32
	mov	lr, pc
	bx	r3
	b	.L4
.L26:
	ldm	r3, {r0, r1}
	ldr	r3, .L27+36
	mov	lr, pc
	bx	r3
	b	.L8
.L28:
	.align	2
.L27:
	.word	67109376
	.word	soundA
	.word	dma
	.word	67109120
	.word	soundB
	.word	seconds
	.word	-2004318071
	.word	minutes
	.word	playSoundA
	.word	playSoundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	initDirections
	.syntax unified
	.arm
	.fpu softvfp
	.type	initDirections, %function
initDirections:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r0, #0
	mov	r1, #181
	mvn	r2, #180
	mvn	lr, #254
	mov	ip, #255
	ldr	r3, .L31
	ldr	r3, [r3]
	strh	lr, [r3, #14]	@ movhi
	strh	lr, [r3, #150]	@ movhi
	strh	lr, [r3, #198]	@ movhi
	strh	lr, [r3, #222]	@ movhi
	strh	r0, [r3, #6]	@ movhi
	strh	r0, [r3, #30]	@ movhi
	strh	r0, [r3, #78]	@ movhi
	strh	r0, [r3, #86]	@ movhi
	strh	r0, [r3, #134]	@ movhi
	strh	r0, [r3, #158]	@ movhi
	strh	r0, [r3, #206]	@ movhi
	strh	r0, [r3, #214]	@ movhi
	strh	ip, [r3, #22]	@ movhi
	strh	ip, [r3, #70]	@ movhi
	strh	ip, [r3, #94]	@ movhi
	strh	ip, [r3, #142]	@ movhi
	strh	r1, [r3, #38]	@ movhi
	strh	r1, [r3, #54]	@ movhi
	strh	r1, [r3, #62]	@ movhi
	strh	r1, [r3, #102]	@ movhi
	strh	r1, [r3, #110]	@ movhi
	strh	r1, [r3, #126]	@ movhi
	strh	r1, [r3, #174]	@ movhi
	strh	r1, [r3, #246]	@ movhi
	strh	r2, [r3, #46]	@ movhi
	strh	r2, [r3, #118]	@ movhi
	strh	r2, [r3, #166]	@ movhi
	strh	r2, [r3, #182]	@ movhi
	strh	r2, [r3, #190]	@ movhi
	strh	r2, [r3, #230]	@ movhi
	strh	r2, [r3, #238]	@ movhi
	strh	r2, [r3, #254]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L32:
	.align	2
.L31:
	.word	.LANCHOR0
	.size	initDirections, .-initDirections
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	ldr	ip, .L35
	ldr	r0, .L35+4
	ldr	r1, .L35+8
	ldr	r2, .L35+12
	push	{r4, lr}
	str	r3, [ip]
	str	r3, [r0]
	str	r3, [r1]
	ldr	lr, .L35+16
	ldr	ip, .L35+20
	ldr	r0, .L35+24
	ldr	r1, .L35+28
	str	r3, [r2]
	ldr	r2, .L35+32
	str	r3, [lr]
	str	r3, [ip]
	str	r3, [r0]
	str	r3, [r1]
	ldr	lr, .L35+36
	ldr	ip, .L35+40
	ldr	r0, .L35+44
	ldr	r1, .L35+48
	str	r3, [r2]
	ldr	r2, .L35+52
	str	r3, [lr]
	str	r3, [ip]
	ldr	lr, .L35+56
	ldr	ip, .L35+60
	str	r3, [r0]
	str	r3, [r1]
	ldr	r0, .L35+64
	ldr	r1, .L35+68
	str	r3, [r2]
	ldr	r2, .L35+72
	str	r3, [lr]
	str	r3, [ip]
	str	r3, [r0]
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	ldr	r3, .L35+76
	mov	lr, pc
	bx	r3
	bl	initDirections
	ldr	r3, .L35+80
	mov	lr, pc
	bx	r3
	ldr	r3, .L35+84
	mov	lr, pc
	bx	r3
	ldr	r4, .L35+88
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L35+92
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	hOff
	.word	vOff
	.word	seconds
	.word	minutes
	.word	pistolUnlocked
	.word	rifleUnlocked
	.word	pistolAmmo
	.word	pistolStockPile
	.word	rifleAmmo
	.word	rifleStockPile
	.word	pistolFound
	.word	rifleFound
	.word	pistolActive
	.word	rifleActive
	.word	pistolAmmoSpawned
	.word	rifleAmmoSpawned
	.word	activeBosses
	.word	activeZombies
	.word	initPlayer
	.word	initZombies
	.word	initBullets
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.size	initGame, .-initGame
	.global	__aeabi_idivmod
	.align	2
	.global	timedEvents
	.syntax unified
	.arm
	.fpu softvfp
	.type	timedEvents, %function
timedEvents:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L57
	ldr	r6, .L57+4
	ldr	r7, [r4]
	ldr	r1, [r6, #4]
	mov	r0, r7
	ldr	r5, .L57+8
	mov	lr, pc
	bx	r5
	subs	r8, r1, #0
	bne	.L38
	ldr	r3, .L57+12
	ldr	r3, [r3]
	cmp	r3, #9
	ble	.L55
.L38:
	add	r3, r7, r7, lsl #4
	ldr	r2, .L57+16
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	ldr	r1, .L57+20
	sub	r2, r2, r3
	cmp	r2, r1
	movcs	r2, #1
	ldrcs	r3, .L57+24
	strcs	r2, [r3]
.L39:
	cmp	r7, #19
	ble	.L37
	ldr	r3, .L57+28
	ldr	r0, .L57+32
	ldr	r3, [r3]
	ldr	r2, [r0]
	sub	r3, r3, r2
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r2, .L57+36
	ldr	r1, .L57+40
	ldr	ip, .L57+44
	ldr	r2, [r2]
	ldr	lr, [r1]
	ldr	ip, [ip]
	sub	r2, r2, lr
	lsl	r3, r3, #16
	lsl	r2, r2, #16
	cmp	ip, #0
	lsr	r3, r3, #16
	asr	r2, r2, #16
	beq	.L56
	ldr	ip, .L57+48
	ldr	lr, .L57+52
	orr	r2, r2, #16896
	strh	r2, [ip]	@ movhi
	strh	r3, [ip, #2]	@ movhi
	strh	lr, [ip, #4]	@ movhi
.L43:
	cmp	r7, #39
	ble	.L37
	ldr	r3, .L57+56
	ldr	r2, [r0]
	ldr	r3, [r3]
	sub	r3, r3, r2
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r2, .L57+60
	ldr	ip, .L57+64
	ldr	r0, [r1]
	ldr	r2, [r2]
	ldr	r1, [ip]
	sub	r2, r2, r0
	lsl	r3, r3, #16
	lsl	r2, r2, #16
	cmp	r1, #0
	lsr	r3, r3, #16
	asr	r2, r2, #16
	bne	.L45
	mov	r0, #1
	ldr	r1, .L57+68
	orr	r2, r2, #16384
	strh	r2, [r1]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	ldr	r2, .L57+72
	ldr	r3, .L57+76
	strh	r2, [r1, #4]	@ movhi
	str	r0, [r3]
.L46:
	ldr	r0, [r4]
	cmp	r0, #9
	ble	.L37
	mov	r2, #125
	ldr	r3, .L57+80
	ldr	r1, [r6, #4]
	str	r2, [r3]
	mov	lr, pc
	bx	r5
	cmp	r1, #0
	bne	.L47
	ldr	r3, .L57+84
	ldr	r3, [r3]
	cmp	r3, #4
	bgt	.L37
	ldr	r3, .L57+88
	ldr	r2, [r3]
	cmp	r2, #0
	strne	r1, [r3]
.L37:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L56:
	mov	lr, #1
	ldr	ip, .L57+48
	orr	r2, r2, #16384
	strh	r2, [ip]	@ movhi
	strh	r3, [ip, #2]	@ movhi
	ldr	r2, .L57+52
	ldr	r3, .L57+92
	strh	r2, [ip, #4]	@ movhi
	str	lr, [r3]
	b	.L43
.L55:
	ldr	r9, .L57+24
	ldr	r3, [r9]
	cmp	r3, #0
	beq	.L38
	ldr	r3, .L57+96
	mov	lr, pc
	bx	r3
	str	r8, [r9]
	ldr	r7, [r4]
	b	.L39
.L45:
	ldr	r1, .L57+68
	ldr	r0, .L57+72
	orr	r2, r2, #16896
	strh	r2, [r1]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	strh	r0, [r1, #4]	@ movhi
	b	.L46
.L47:
	mov	r2, #1
	ldr	r3, .L57+88
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	str	r2, [r3]
	bx	lr
.L58:
	.align	2
.L57:
	.word	seconds
	.word	.LANCHOR0
	.word	__aeabi_idivmod
	.word	activeZombies
	.word	143165576
	.word	286331153
	.word	zombieNotSpawned
	.word	pistolCol
	.word	hOff
	.word	pistolRow
	.word	vOff
	.word	pistolFound
	.word	shadowOAM+440
	.word	25387
	.word	rifleCol
	.word	rifleRow
	.word	rifleFound
	.word	shadowOAM+448
	.word	29487
	.word	rifleActive
	.word	zombieStartHealth
	.word	activeBosses
	.word	bossNotSpawned
	.word	pistolActive
	.word	spawnZombie
	.size	timedEvents, .-timedEvents
	.align	2
	.global	equipPistol
	.syntax unified
	.arm
	.fpu softvfp
	.type	equipPistol, %function
equipPistol:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #16
	mov	r3, #32
	push	{r4, lr}
	ldr	r0, .L68
	ldr	r1, .L68+4
	ldr	ip, [r0]
	ldr	r1, [r1]
	sub	sp, sp, #16
	stm	sp, {r1, ip}
	ldr	r0, .L68+8
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	add	r2, r0, #16
	ldr	r1, [r0]
	ldm	r2, {r2, r3}
	ldr	r0, [r0, #4]
	ldr	r4, .L68+12
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L59
	ldr	r3, .L68+16
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L59
	mov	r1, #0
	mov	lr, #1
	mov	r0, #12
	mov	r2, #72
	str	r1, [r3]
	ldr	ip, .L68+20
	ldr	r1, .L68+24
	ldr	r3, .L68+28
	str	lr, [ip]
	str	r0, [r1]
	str	r2, [r3]
.L59:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L69:
	.align	2
.L68:
	.word	pistolRow
	.word	pistolCol
	.word	player
	.word	collision
	.word	pistolActive
	.word	pistolFound
	.word	pistolAmmo
	.word	pistolStockPile
	.size	equipPistol, .-equipPistol
	.align	2
	.global	equipRifle
	.syntax unified
	.arm
	.fpu softvfp
	.type	equipRifle, %function
equipRifle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #16
	mov	r3, #32
	push	{r4, lr}
	ldr	r0, .L79
	ldr	r1, .L79+4
	ldr	ip, [r0]
	ldr	r1, [r1]
	sub	sp, sp, #16
	stm	sp, {r1, ip}
	ldr	r0, .L79+8
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	add	r2, r0, #16
	ldr	r1, [r0]
	ldm	r2, {r2, r3}
	ldr	r0, [r0, #4]
	ldr	r4, .L79+12
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L70
	ldr	r3, .L79+16
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L70
	mov	r1, #0
	mov	lr, #1
	mov	r0, #30
	mov	r2, #72
	str	r1, [r3]
	ldr	ip, .L79+20
	ldr	r1, .L79+24
	ldr	r3, .L79+28
	str	lr, [ip]
	str	r0, [r1]
	str	r2, [r3]
.L70:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L80:
	.align	2
.L79:
	.word	rifleRow
	.word	rifleCol
	.word	player
	.word	collision
	.word	rifleActive
	.word	rifleFound
	.word	rifleAmmo
	.word	rifleStockPile
	.size	equipRifle, .-equipRifle
	.align	2
	.global	pistolAmmoSpawn
	.syntax unified
	.arm
	.fpu softvfp
	.type	pistolAmmoSpawn, %function
pistolAmmoSpawn:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L88
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L82
	ldr	r2, .L88+4
	ldr	r3, [r2]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r2]
	beq	.L87
.L81:
	pop	{r4, r5, r6, lr}
	bx	lr
.L82:
	ldr	r3, .L88+8
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L81
	ldr	r3, .L88+12
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r3, .L88+16
	smull	ip, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	rsb	r2, r3, r3, lsl #5
	add	r3, r3, r2, lsl #2
	sub	r0, r0, r3, lsl #2
	ldr	r3, .L88+4
	add	r0, r0, #250
	str	r1, [r4]
	str	r0, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L87:
	ldr	r5, .L88+12
	str	r3, [r4]
	mov	lr, pc
	bx	r5
	ldr	r3, .L88+20
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #6
	rsb	r2, r3, r3, lsl #5
	rsb	r3, r3, r2, lsl #2
	ldr	r2, .L88+24
	sub	r0, r0, r3, lsl #2
	str	r0, [r2]
	mov	lr, pc
	bx	r5
	mov	r1, #1
	ldr	r3, .L88+28
	smull	ip, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #2
	rsb	r2, r3, r3, lsl #4
	add	r3, r3, r2, lsl #3
	ldr	ip, .L88+32
	ldr	r2, .L88+8
	sub	r0, r0, r3, lsl r1
	str	r0, [ip]
	str	r1, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L89:
	.align	2
.L88:
	.word	pistolTimerActive
	.word	pistolRandTimer
	.word	pistolAmmoSpawned
	.word	rand
	.word	274877907
	.word	558694933
	.word	pistolAmmoCol
	.word	70991195
	.word	pistolAmmoRow
	.size	pistolAmmoSpawn, .-pistolAmmoSpawn
	.align	2
	.global	shadowPistolAmmo
	.syntax unified
	.arm
	.fpu softvfp
	.type	shadowPistolAmmo, %function
shadowPistolAmmo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L94
	ldr	ip, .L94+4
	ldr	r2, .L94+8
	ldr	r0, .L94+12
	ldr	r3, [r3]
	ldr	ip, [ip]
	ldr	r1, .L94+16
	ldr	r0, [r0]
	ldr	r2, [r2]
	ldr	r1, [r1]
	sub	r3, r3, ip
	sub	r2, r2, r0
	lsl	r3, r3, #16
	cmp	r1, #0
	lsr	r3, r3, #16
	ldr	r1, .L94+20
	ldr	r0, .L94+24
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	orreq	r3, r3, #512
	strh	r3, [r1]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	strh	r0, [r1, #4]	@ movhi
	bx	lr
.L95:
	.align	2
.L94:
	.word	pistolAmmoRow
	.word	vOff
	.word	pistolAmmoCol
	.word	hOff
	.word	pistolAmmoSpawned
	.word	shadowOAM+496
	.word	-31833
	.size	shadowPistolAmmo, .-shadowPistolAmmo
	.align	2
	.global	pistolAmmoCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	pistolAmmoCollision, %function
pistolAmmoCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L105
	ldr	r3, [r4]
	cmp	r3, #0
	sub	sp, sp, #20
	bne	.L104
.L96:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L104:
	mov	r3, #8
	ldr	r1, .L105+4
	ldr	r2, .L105+8
	ldr	r1, [r1]
	ldr	r2, [r2]
	ldr	r0, .L105+12
	str	r2, [sp]
	str	r1, [sp, #4]
	str	r3, [sp, #12]
	str	r3, [sp, #8]
	add	r2, r0, #16
	ldr	r1, [r0]
	ldm	r2, {r2, r3}
	ldr	r0, [r0, #4]
	ldr	r5, .L105+16
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L96
	mov	r1, #0
	ldr	r2, .L105+20
	ldr	r3, [r2]
	add	r3, r3, #24
	str	r3, [r2]
	str	r1, [r4]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L106:
	.align	2
.L105:
	.word	pistolAmmoSpawned
	.word	pistolAmmoRow
	.word	pistolAmmoCol
	.word	player
	.word	collision
	.word	pistolStockPile
	.size	pistolAmmoCollision, .-pistolAmmoCollision
	.align	2
	.global	rifleAmmoSpawn
	.syntax unified
	.arm
	.fpu softvfp
	.type	rifleAmmoSpawn, %function
rifleAmmoSpawn:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L114
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L108
	ldr	r2, .L114+4
	ldr	r3, [r2]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r2]
	beq	.L113
.L107:
	pop	{r4, r5, r6, lr}
	bx	lr
.L108:
	ldr	r3, .L114+8
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L107
	ldr	r3, .L114+12
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r3, .L114+16
	smull	ip, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	rsb	r2, r3, r3, lsl #5
	add	r3, r3, r2, lsl #2
	sub	r0, r0, r3, lsl #2
	ldr	r3, .L114+4
	add	r0, r0, #250
	str	r1, [r4]
	str	r0, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L113:
	ldr	r5, .L114+12
	str	r3, [r4]
	mov	lr, pc
	bx	r5
	ldr	r2, .L114+20
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #8
	rsb	r3, r3, r3, lsl #4
	ldr	r2, .L114+24
	sub	r0, r0, r3, lsl #5
	str	r0, [r2]
	mov	lr, pc
	bx	r5
	mov	ip, #230
	ldr	r3, .L114+28
	smull	r1, r2, r3, r0
	mov	r1, #1
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #6
	mul	r3, ip, r3
	ldr	r2, .L114+8
	ldr	ip, .L114+32
	sub	r0, r0, r3
	str	r0, [ip]
	str	r1, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L115:
	.align	2
.L114:
	.word	rifleTimerActive
	.word	rifleRandTimer
	.word	rifleAmmoSpawned
	.word	rand
	.word	274877907
	.word	-2004318071
	.word	rifleAmmoCol
	.word	1195121335
	.word	rifleAmmoRow
	.size	rifleAmmoSpawn, .-rifleAmmoSpawn
	.align	2
	.global	shadowRifleAmmo
	.syntax unified
	.arm
	.fpu softvfp
	.type	shadowRifleAmmo, %function
shadowRifleAmmo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L120
	ldr	ip, .L120+4
	ldr	r3, .L120+8
	ldr	r0, .L120+12
	ldr	r2, [r2]
	ldr	r0, [r0]
	ldr	ip, [ip]
	ldr	r3, [r3]
	ldr	r1, .L120+16
	sub	r3, r3, r0
	ldr	r1, [r1]
	sub	r2, r2, ip
	lsl	r2, r2, #16
	lsl	r3, r3, #16
	cmp	r1, #0
	lsr	r2, r2, #16
	ldr	r1, .L120+20
	lsr	r3, r3, #16
	ldr	r0, .L120+24
	orreq	r2, r2, #512
	orreq	r3, r3, #16384
	strh	r2, [r1]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	strh	r0, [r1, #4]	@ movhi
	bx	lr
.L121:
	.align	2
.L120:
	.word	rifleAmmoRow
	.word	vOff
	.word	rifleAmmoCol
	.word	hOff
	.word	rifleAmmoSpawned
	.word	shadowOAM+496
	.word	-31833
	.size	shadowRifleAmmo, .-shadowRifleAmmo
	.align	2
	.global	rifleAmmoCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	rifleAmmoCollision, %function
rifleAmmoCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L131
	ldr	r3, [r4]
	cmp	r3, #0
	sub	sp, sp, #20
	bne	.L130
.L122:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L130:
	mov	r3, #8
	ldr	r1, .L131+4
	ldr	r2, .L131+8
	ldr	r1, [r1]
	ldr	r2, [r2]
	ldr	r0, .L131+12
	str	r2, [sp]
	str	r1, [sp, #4]
	str	r3, [sp, #12]
	str	r3, [sp, #8]
	add	r2, r0, #16
	ldr	r1, [r0]
	ldm	r2, {r2, r3}
	ldr	r0, [r0, #4]
	ldr	r5, .L131+16
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L122
	mov	r1, #0
	ldr	r2, .L131+20
	ldr	r3, [r2]
	add	r3, r3, #60
	str	r3, [r2]
	str	r1, [r4]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L132:
	.align	2
.L131:
	.word	rifleAmmoSpawned
	.word	rifleAmmoRow
	.word	rifleAmmoCol
	.word	player
	.word	collision
	.word	rifleStockPile
	.size	rifleAmmoCollision, .-rifleAmmoCollision
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L146
	mov	lr, pc
	bx	r3
	ldr	r3, .L146+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L146+8
	mov	lr, pc
	bx	r3
	bl	timedEvents
	bl	equipPistol
	bl	equipRifle
	ldr	r3, .L146+12
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L144
	ldr	r3, .L146+16
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L145
.L135:
	bl	pistolAmmoCollision
	bl	rifleAmmoCollision
	ldr	r3, .L146+20
	ldr	r3, [r3, #56]
	cmp	r3, #0
	movle	r2, #1
	mov	r0, #67108864
	ldrle	r3, .L146+24
	strle	r2, [r3]
	ldr	r3, .L146+28
	ldr	r3, [r3]
	lsl	r2, r3, #16
	lsr	r2, r2, #16
	strh	r2, [r0, #16]	@ movhi
	ldr	r2, .L146+32
	ldr	r1, [r2]
	add	r3, r3, r3, lsr #31
	add	r2, r1, r1, lsr #31
	asr	r3, r3, #1
	asr	r2, r2, #1
	lsl	r3, r3, #16
	lsl	r1, r1, #16
	lsl	r2, r2, #16
	lsr	r3, r3, #16
	lsr	r1, r1, #16
	lsr	r2, r2, #16
	strh	r1, [r0, #18]	@ movhi
	pop	{r4, lr}
	strh	r3, [r0, #20]	@ movhi
	strh	r2, [r0, #22]	@ movhi
	bx	lr
.L144:
	bl	pistolAmmoSpawn
	ldr	r3, .L146+16
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L135
.L145:
	bl	rifleAmmoSpawn
	b	.L135
.L147:
	.align	2
.L146:
	.word	updatePlayer
	.word	updateZombies
	.word	updateBullets
	.word	pistolFound
	.word	rifleFound
	.word	player
	.word	.LANCHOR1
	.word	hOff
	.word	vOff
	.size	updateGame, .-updateGame
	.align	2
	.global	showScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	showScore, %function
showScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	lr, #230
	ldr	r2, .L152
	mov	r4, #2
	mov	r1, r2
	mov	r0, r2
	mov	r6, #225
	mov	r3, #220
	mov	ip, r2
	mov	r5, #215
	strh	lr, [r2, #2]	@ movhi
	ldr	lr, .L152+4
	strh	lr, [r2, #4]	@ movhi
	ldr	lr, .L152+8
	strh	r4, [r2]	@ movhi
	strh	lr, [r1, #8]!	@ movhi
	strh	r6, [r1, #2]	@ movhi
	strh	lr, [r0, #16]!	@ movhi
	strh	r3, [r0, #2]	@ movhi
	ldr	r3, .L152+12
	ldr	r3, [r3, #4]
	strh	lr, [ip, #24]!	@ movhi
	cmp	r3, #99
	strh	r5, [ip, #2]	@ movhi
	bgt	.L149
	ldr	r0, .L152+16
	smull	ip, r0, r3, r0
	asr	r3, r3, #31
	rsb	r3, r3, r0, asr r4
	lsl	r3, r3, #5
	add	r3, r3, #31
	orr	r3, r3, #16384
	strh	r4, [r1]	@ movhi
	strh	r3, [r2, #12]	@ movhi
.L148:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L149:
	cmp	r3, #1000
	bge	.L148
	ldr	ip, .L152+16
	smull	lr, ip, r3, ip
	ldr	r5, .L152+20
	asr	lr, r3, #31
	rsb	ip, lr, ip, asr #2
	umull	r6, r5, ip, r5
	ldr	r6, .L152+24
	smull	r7, r3, r6, r3
	lsr	r5, r5, #3
	add	r5, r5, r5, lsl #2
	rsb	lr, lr, r3, asr #5
	sub	r3, ip, r5, lsl #1
	lsl	r3, r3, #5
	lsl	ip, lr, #5
	add	ip, ip, #31
	add	r3, r3, #31
	orr	ip, ip, #16384
	orr	r3, r3, #16384
	strh	r4, [r1]	@ movhi
	strh	r3, [r2, #12]	@ movhi
	strh	r4, [r0]	@ movhi
	strh	ip, [r2, #20]	@ movhi
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L153:
	.align	2
.L152:
	.word	shadowOAM+368
	.word	16415
	.word	514
	.word	.LANCHOR1
	.word	1717986919
	.word	-858993459
	.word	1374389535
	.size	showScore, .-showScore
	.align	2
	.global	endScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	endScore, %function
endScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r2, .L158
	mov	r7, #230
	mov	lr, #612
	mov	r1, r2
	mov	r4, #100
	mov	r0, r2
	mov	r6, #225
	mov	r3, #220
	mov	ip, r2
	mov	r5, #215
	strh	r7, [r2, #2]	@ movhi
	ldr	r7, .L158+4
	strh	r4, [r2]	@ movhi
	strh	r7, [r2, #4]	@ movhi
	strh	lr, [r1, #8]!	@ movhi
	strh	r6, [r1, #2]	@ movhi
	strh	lr, [r0, #16]!	@ movhi
	strh	r3, [r0, #2]	@ movhi
	ldr	r3, .L158+8
	ldr	r3, [r3, #4]
	strh	lr, [ip, #24]!	@ movhi
	cmp	r3, #99
	strh	r5, [ip, #2]	@ movhi
	bgt	.L155
	ldr	r0, .L158+12
	smull	ip, r0, r3, r0
	asr	r3, r3, #31
	rsb	r3, r3, r0, asr #2
	lsl	r3, r3, #5
	add	r3, r3, #31
	orr	r3, r3, #16384
	strh	r4, [r1]	@ movhi
	strh	r3, [r2, #12]	@ movhi
.L154:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L155:
	cmp	r3, #1000
	bge	.L154
	ldr	ip, .L158+12
	smull	lr, ip, r3, ip
	ldr	r5, .L158+16
	asr	lr, r3, #31
	rsb	ip, lr, ip, asr #2
	umull	r6, r5, ip, r5
	ldr	r6, .L158+20
	smull	r7, r3, r6, r3
	lsr	r5, r5, #3
	add	r5, r5, r5, lsl #2
	rsb	lr, lr, r3, asr #5
	sub	r3, ip, r5, lsl #1
	lsl	r3, r3, #5
	lsl	ip, lr, #5
	add	ip, ip, #31
	add	r3, r3, #31
	orr	ip, ip, #16384
	orr	r3, r3, #16384
	strh	r4, [r1]	@ movhi
	strh	r3, [r2, #12]	@ movhi
	strh	r4, [r0]	@ movhi
	strh	ip, [r2, #20]	@ movhi
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L159:
	.align	2
.L158:
	.word	shadowOAM+368
	.word	16415
	.word	.LANCHOR1
	.word	1717986919
	.word	-858993459
	.word	1374389535
	.size	endScore, .-endScore
	.align	2
	.global	showHealth
	.syntax unified
	.arm
	.fpu softvfp
	.type	showHealth, %function
showHealth:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L165
	ldr	r3, [r3, #56]
	cmp	r3, #100
	push	{r4, r5, r6, r7, r8, r9, lr}
	beq	.L164
	ldr	r2, .L165+4
	mov	lr, #4
	mov	ip, r2
	mov	r8, #516
	mov	r7, #55
	mov	r0, r2
	mov	r5, #60
	mov	r4, #65
	ldr	r1, .L165+8
	smull	r9, r6, r1, r3
	asr	r1, r3, #31
	rsb	r1, r1, r6, asr #2
	lsl	r6, r1, #5
	add	r1, r1, r1, lsl #2
	sub	r3, r3, r1, lsl #1
	ldr	r1, .L165+12
	strh	r8, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	strh	r7, [r2, #2]	@ movhi
	add	r6, r6, #31
	strh	lr, [ip, #8]!	@ movhi
	orr	r1, r6, #16384
	lsl	r3, r3, #5
	strh	r5, [ip, #2]	@ movhi
	add	r3, r3, #31
	strh	r1, [r2, #12]	@ movhi
	strh	lr, [r0, #16]!	@ movhi
	orr	r3, r3, #16384
	strh	r4, [r0, #2]	@ movhi
	strh	r3, [r2, #20]	@ movhi
.L162:
	mov	r0, #16384
	ldr	r3, .L165+16
	ldr	r1, .L165+20
	ldr	r2, .L165+24
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L164:
	ldr	r3, .L165+4
	mov	r4, #55
	mov	r0, r3
	mov	r1, #4
	mov	lr, #60
	mov	r2, r3
	mov	ip, #65
	strh	r4, [r3, #2]	@ movhi
	ldr	r4, .L165+12
	strh	r1, [r3]	@ movhi
	strh	r4, [r3, #4]	@ movhi
	strh	r1, [r0, #8]!	@ movhi
	strh	lr, [r0, #2]	@ movhi
	ldr	r0, .L165+28
	strh	r0, [r3, #12]	@ movhi
	strh	r1, [r2, #16]!	@ movhi
	strh	ip, [r2, #2]	@ movhi
	strh	r0, [r3, #20]	@ movhi
	b	.L162
.L166:
	.align	2
.L165:
	.word	player
	.word	shadowOAM+400
	.word	1717986919
	.word	16447
	.word	shadowOAM+424
	.word	-32747
	.word	17255
	.word	16415
	.size	showHealth, .-showHealth
	.align	2
	.global	showGun
	.syntax unified
	.arm
	.fpu softvfp
	.type	showGun, %function
showGun:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L173
	ldr	r3, [r3]
	cmp	r3, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bne	.L168
	ldr	r3, .L173+4
	mov	lr, #652
	mov	r9, r3
	mov	r10, #50
	ldr	r2, .L173+8
	ldr	r4, .L173+12
	ldr	fp, [r2]
	smull	r2, ip, r4, fp
	ldr	r2, .L173+16
	ldr	r2, [r2]
	smull	r1, r4, r2, r4
	ldr	r1, .L173+20
	smull	r0, r1, r2, r1
	asr	r0, fp, #31
	rsb	r0, r0, ip, asr #2
	add	ip, r0, r0, lsl #2
	sub	ip, fp, ip, lsl #1
	ldr	fp, .L173+24
	strh	fp, [r3]	@ movhi
	ldr	fp, .L173+28
	strh	fp, [r3, #2]	@ movhi
	ldr	fp, .L173+32
	lsl	r0, r0, #5
	strh	fp, [r3, #4]	@ movhi
	mov	r8, r3
	strh	lr, [r9, #24]!	@ movhi
	add	r0, r0, #31
	orr	r0, r0, #16384
	strh	r10, [r9, #2]	@ movhi
	strh	r0, [r3, #28]	@ movhi
	mov	r0, #55	@ movhi
	strh	lr, [r8, #32]!	@ movhi
	mov	r7, r3
	strh	r0, [r8, #2]	@ movhi
	asr	r0, r2, #31
	rsb	r4, r0, r4, asr #2
	rsb	r1, r0, r1, asr #5
	mov	r0, #65	@ movhi
	lsl	ip, ip, #5
	add	ip, ip, #31
	orr	ip, ip, #16384
	lsl	r1, r1, #5
	strh	ip, [r3, #36]	@ movhi
	add	r1, r1, #31
	strh	lr, [r7, #40]!	@ movhi
	mov	r6, r3
	orr	r1, r1, #16384
	strh	r0, [r7, #2]	@ movhi
	strh	r1, [r3, #44]	@ movhi
	add	r1, r4, r4, lsl #2
	sub	r2, r2, r1, lsl #1
	mov	r1, #70	@ movhi
	strh	lr, [r6, #48]!	@ movhi
	mov	r5, r3
	strh	r1, [r6, #2]	@ movhi
	mov	r1, #75	@ movhi
	lsl	r4, r4, #5
	add	r4, r4, #31
	orr	r4, r4, #16384
	lsl	r2, r2, #5
	strh	r4, [r3, #52]	@ movhi
	add	r2, r2, #31
	strh	lr, [r5, #56]!	@ movhi
	orr	r2, r2, #16384
	strh	r1, [r5, #2]	@ movhi
	strh	r2, [r3, #60]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L168:
	cmp	r3, #1
	beq	.L172
	ldr	r1, .L173+36
	ldr	r2, .L173+12
	ldr	r10, [r1]
	smull	r1, r0, r2, r10
	ldr	r1, .L173+40
	ldr	fp, [r1]
	smull	r1, ip, r2, fp
	asr	r1, r10, #31
	rsb	r0, r1, r0, asr #2
	smull	r4, r8, r2, r0
	mov	r4, r8
	ldr	r8, .L173+20
	smull	r2, r8, r10, r8
	asr	r2, fp, #31
	rsb	r2, r2, ip, asr #2
	add	ip, r2, r2, lsl #2
	ldr	r3, .L173+4
	sub	ip, fp, ip, lsl #1
	ldr	fp, .L173+24
	strh	fp, [r3]	@ movhi
	ldr	fp, .L173+28
	mov	lr, #140
	strh	fp, [r3, #2]	@ movhi
	mov	r9, r3
	ldr	fp, .L173+44
	strh	fp, [r3, #4]	@ movhi
	mov	fp, #50	@ movhi
	lsl	r2, r2, #5
	strh	lr, [r9, #24]!	@ movhi
	mov	r7, r3
	add	r2, r2, #31
	orr	r2, r2, #16384
	strh	fp, [r9, #2]	@ movhi
	strh	r2, [r3, #28]	@ movhi
	mov	r2, #55	@ movhi
	strh	lr, [r7, #32]!	@ movhi
	mov	r6, r3
	strh	r2, [r7, #2]	@ movhi
	mov	r2, #65	@ movhi
	lsl	ip, ip, #5
	rsb	r1, r1, r8, asr #5
	add	ip, ip, #31
	orr	ip, ip, #16384
	lsl	r1, r1, #5
	strh	ip, [r3, #36]	@ movhi
	mov	r5, r3
	strh	lr, [r6, #40]!	@ movhi
	add	r1, r1, #31
	orr	r1, r1, #16384
	strh	r2, [r6, #2]	@ movhi
	strh	r1, [r3, #44]	@ movhi
	mov	r1, #70	@ movhi
	strh	lr, [r5, #48]!	@ movhi
	mov	ip, r3
	strh	r1, [r5, #2]	@ movhi
	mov	r1, #75	@ movhi
	asr	r2, r0, #31
	rsb	r2, r2, r4, asr #2
	add	r2, r2, r2, lsl #2
	sub	r2, r0, r2, lsl #1
	lsl	r2, r2, #5
	add	r0, r0, r0, lsl #2
	sub	r0, r10, r0, lsl #1
	add	r2, r2, #31
	orr	r2, r2, #16384
	lsl	r0, r0, #5
	strh	r2, [r3, #52]	@ movhi
	add	r0, r0, #31
	strh	lr, [ip, #56]!	@ movhi
	orr	r2, r0, #16384
	strh	r1, [ip, #2]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strh	r2, [r3, #60]	@ movhi
	bx	lr
.L172:
	ldr	r1, .L173+16
	ldr	r2, .L173+12
	ldr	r10, [r1]
	smull	r1, r0, r2, r10
	ldr	r1, .L173+8
	ldr	fp, [r1]
	smull	r1, ip, r2, fp
	asr	r1, r10, #31
	rsb	r0, r1, r0, asr #2
	smull	r4, r8, r2, r0
	mov	r4, r8
	ldr	r8, .L173+20
	smull	r2, r8, r10, r8
	asr	r2, fp, #31
	rsb	r2, r2, ip, asr #2
	add	ip, r2, r2, lsl #2
	ldr	r3, .L173+4
	sub	ip, fp, ip, lsl #1
	ldr	fp, .L173+24
	strh	fp, [r3]	@ movhi
	ldr	fp, .L173+28
	mov	lr, #140
	strh	fp, [r3, #2]	@ movhi
	mov	r9, r3
	ldr	fp, .L173+48
	strh	fp, [r3, #4]	@ movhi
	mov	fp, #50	@ movhi
	lsl	r2, r2, #5
	strh	lr, [r9, #24]!	@ movhi
	mov	r7, r3
	add	r2, r2, #31
	orr	r2, r2, #16384
	strh	fp, [r9, #2]	@ movhi
	strh	r2, [r3, #28]	@ movhi
	mov	r2, #55	@ movhi
	strh	lr, [r7, #32]!	@ movhi
	mov	r6, r3
	strh	r2, [r7, #2]	@ movhi
	mov	r2, #65	@ movhi
	lsl	ip, ip, #5
	add	ip, ip, #31
	orr	ip, ip, #16384
	strh	ip, [r3, #36]	@ movhi
	strh	lr, [r6, #40]!	@ movhi
	rsb	r1, r1, r8, asr #5
	strh	r2, [r6, #2]	@ movhi
	asr	r2, r0, #31
	rsb	r2, r2, r4, asr #2
	lsl	r1, r1, #5
	mov	r5, r3
	add	r1, r1, #31
	add	r2, r2, r2, lsl #2
	orr	r1, r1, #16384
	sub	r2, r0, r2, lsl #1
	add	r0, r0, r0, lsl #2
	strh	r1, [r3, #44]	@ movhi
	sub	r1, r10, r0, lsl #1
	mov	r0, #70	@ movhi
	strh	lr, [r5, #48]!	@ movhi
	lsl	r2, r2, #5
	strh	r0, [r5, #2]	@ movhi
	add	r2, r2, #31
	mov	r0, r3
	lsl	r1, r1, #5
	orr	r2, r2, #16384
	add	r1, r1, #31
	strh	r2, [r3, #52]	@ movhi
	orr	r2, r1, #16384
	mov	r1, #75	@ movhi
	strh	lr, [r0, #56]!	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strh	r1, [r0, #2]	@ movhi
	strh	r2, [r3, #60]	@ movhi
	bx	lr
.L174:
	.align	2
.L173:
	.word	weapon
	.word	shadowOAM+432
	.word	pistolAmmo
	.word	1717986919
	.word	pistolStockPile
	.word	1374389535
	.word	16519
	.word	-32758
	.word	21287
	.word	rifleStockPile
	.word	rifleAmmo
	.word	29487
	.word	25387
	.size	showGun, .-showGun
	.align	2
	.global	userInterface
	.syntax unified
	.arm
	.fpu softvfp
	.type	userInterface, %function
userInterface:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	showScore
	bl	showHealth
	pop	{r4, lr}
	b	showGun
	.size	userInterface, .-userInterface
	.align	2
	.global	shadowGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	shadowGame, %function
shadowGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L179
	mov	lr, pc
	bx	r3
	ldr	r3, .L179+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L179+8
	mov	lr, pc
	bx	r3
	bl	showScore
	bl	showHealth
	bl	showGun
	bl	shadowPistolAmmo
	pop	{r4, lr}
	b	shadowRifleAmmo
.L180:
	.align	2
.L179:
	.word	shadowPlayer
	.word	shadowZombies
	.word	shadowBullets
	.size	shadowGame, .-shadowGame
	.align	2
	.global	setupInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #0
	mov	r1, #49152
	push	{r4, lr}
	mov	lr, #67108864
	mov	r4, #1
	ldr	r3, .L183
	ldrh	r2, [r3]
	orr	r2, r2, #96
	strh	r2, [r3]	@ movhi
	ldr	r2, .L183+4
	strh	r0, [r2, #10]	@ movhi
	strh	r1, [r2, #8]	@ movhi
	ldrh	ip, [r3]
	ldrh	r1, [lr, #4]
	ldrh	r0, [r2, #10]
	orr	ip, ip, r4
	strh	r4, [r3, #8]	@ movhi
	strh	ip, [r3]	@ movhi
	ldr	r3, .L183+8
	ldr	ip, .L183+12
	orr	r0, r0, #195
	orr	r1, r1, #8
	strh	r0, [r2, #10]	@ movhi
	strh	r1, [lr, #4]	@ movhi
	str	ip, [r3, #4092]
	pop	{r4, lr}
	bx	lr
.L184:
	.align	2
.L183:
	.word	67109376
	.word	67109120
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.align	2
	.global	enableTimerInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	enableTimerInterrupts, %function
enableTimerInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #0
	mov	r2, #49152
	ldr	r3, .L186
	ldr	r0, .L186+4
	strh	r1, [r3, #10]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldrh	r2, [r0]
	ldrh	r1, [r3, #10]
	orr	r2, r2, #96
	orr	r1, r1, #195
	strh	r1, [r3, #10]	@ movhi
	strh	r2, [r0]	@ movhi
	bx	lr
.L187:
	.align	2
.L186:
	.word	67109120
	.word	67109376
	.size	enableTimerInterrupts, .-enableTimerInterrupts
	.global	buffer
	.global	check
	.comm	bossStartHealth,4,4
	.comm	zombieStartHealth,4,4
	.comm	rifleAmmoRow,4,4
	.comm	rifleAmmoCol,4,4
	.comm	pistolAmmoRow,4,4
	.comm	pistolAmmoCol,4,4
	.comm	rifleAmmoSpawned,4,4
	.comm	pistolAmmoSpawned,4,4
	.comm	rifleTimerActive,4,4
	.comm	pistolTimerActive,4,4
	.comm	rifleRandTimer,4,4
	.comm	pistolRandTimer,4,4
	.comm	rifleUnlocked,4,4
	.comm	pistolUnlocked,4,4
	.comm	minutes,4,4
	.comm	seconds,4,4
	.global	lost
	.global	score
	.global	zombieDamage
	.global	rifleDamage
	.global	pistolDamage
	.global	knifeDamage
	.global	SHADOW_OAM_AFF
	.comm	soundB,32,4
	.comm	soundA,32,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	SHADOW_OAM_AFF, %object
	.size	SHADOW_OAM_AFF, 4
SHADOW_OAM_AFF:
	.word	shadowOAM
	.type	buffer, %object
	.size	buffer, 4
buffer:
	.word	15
	.type	check, %object
	.size	check, 4
check:
	.word	1
	.type	zombieDamage, %object
	.size	zombieDamage, 4
zombieDamage:
	.word	5
	.type	rifleDamage, %object
	.size	rifleDamage, 4
rifleDamage:
	.word	20
	.type	pistolDamage, %object
	.size	pistolDamage, 4
pistolDamage:
	.word	15
	.type	knifeDamage, %object
	.size	knifeDamage, 4
knifeDamage:
	.word	50
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	lost, %object
	.size	lost, 4
lost:
	.space	4
	.type	score, %object
	.size	score, 4
score:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
