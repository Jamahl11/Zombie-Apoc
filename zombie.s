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
	.file	"zombie.c"
	.text
	.align	2
	.global	initZombies
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initZombies, %function
initZombies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, #25
	ldr	r5, .L8
	ldr	r7, .L8+4
	ldr	r6, .L8+8
	sub	sp, sp, #76
	add	r8, r5, #680
.L2:
	mov	r2, #44
	mov	r1, #0
	add	r0, sp, #28
	mov	lr, pc
	bx	r7
	mov	r0, #1
	mov	r1, #122
	mov	r2, #68
	mov	r3, #16
	mov	lr, #11
	mov	ip, #20
	mov	r4, #100
	str	r1, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	add	r1, sp, #4
	mov	r0, r5
	add	r5, r5, r2
	str	r9, [sp, #4]
	str	r3, [sp, #20]
	str	r3, [sp, #24]
	str	r3, [sp, #40]
	str	lr, [sp, #32]
	str	r4, [sp, #48]
	str	ip, [sp, #64]
	mov	lr, pc
	bx	r6
	cmp	r5, r8
	bne	.L2
	mov	r5, #0
	ldr	r3, .L8+12
	ldr	r8, .L8+16
	ldr	r9, [r3]
.L3:
	mov	r2, #44
	mov	r1, #0
	add	r0, sp, #28
	mov	lr, pc
	bx	r7
	cmp	r9, r5
	mov	r3, #1
	movle	r0, #0
	movgt	r0, #1
	mov	r2, #32
	mov	r1, #150
	mov	lr, #5
	mov	ip, #20
	mov	fp, #122
	mov	r10, #13
	str	r2, [sp, #20]
	str	r2, [sp, #24]
	str	r1, [sp, #48]
	str	r0, [sp, #56]
	add	r5, r5, r3
	mov	r0, r8
	mov	r2, #68
	add	r1, sp, #4
	stmib	sp, {r4, fp}
	str	r3, [sp, #12]
	str	r3, [sp, #16]
	str	r3, [sp, #52]
	str	r10, [sp, #32]
	str	lr, [sp, #40]
	str	ip, [sp, #64]
	mov	lr, pc
	bx	r6
	cmp	r5, #5
	add	r8, r8, #68
	bne	.L3
	mov	r3, #0
	ldr	r2, .L8+20
	ldr	r1, .L8+12
	str	r3, [r2]
	str	r3, [r1]
	add	sp, sp, #76
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	zombies
	.word	memset
	.word	memcpy
	.word	activeBosses
	.word	bosses
	.word	activeZombies
	.size	initZombies, .-initZombies
	.align	2
	.global	orientateZombie
	.syntax unified
	.arm
	.fpu softvfp
	.type	orientateZombie, %function
orientateZombie:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L22
	ldr	r1, [r0]
	ldm	r3, {r2, ip}
	str	lr, [sp, #-4]!
	ldr	r3, [r0, #4]
	sub	lr, r1, r2
	cmp	lr, #0
	sub	lr, r3, ip
	blt	.L20
	cmp	r1, r2
	beq	.L21
	cmp	lr, #0
	movlt	r3, #512
	strhlt	r3, [r0, #56]	@ movhi
	blt	.L10
	cmp	ip, r3
	moveq	r3, #0
	movne	r3, #3584
	strh	r3, [r0, #56]	@ movhi
.L10:
	ldr	lr, [sp], #4
	bx	lr
.L21:
	cmp	lr, #0
	movlt	r3, #1024
	movge	r3, #3072
	ldr	lr, [sp], #4
	strh	r3, [r0, #56]	@ movhi
	bx	lr
.L20:
	cmp	lr, #0
	movlt	r3, #1536
	strhlt	r3, [r0, #56]	@ movhi
	blt	.L10
	cmp	ip, r3
	moveq	r3, #2048
	movne	r3, #2560
	ldr	lr, [sp], #4
	strh	r3, [r0, #56]	@ movhi
	bx	lr
.L23:
	.align	2
.L22:
	.word	player
	.size	orientateZombie, .-orientateZombie
	.global	__aeabi_idivmod
	.align	2
	.global	moveZombies
	.syntax unified
	.arm
	.fpu softvfp
	.type	moveZombies, %function
moveZombies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, [r0, #40]
	cmp	r1, #0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	beq	.L25
	ldr	r0, [r0, #24]
	add	r6, r0, #1
.L26:
	ldr	r5, .L44
	ldr	r1, [r4, #60]
	mov	lr, pc
	bx	r5
	cmp	r1, #0
	bne	.L36
	add	r0, r4, #32
	ldm	r0, {r0, r1}
	add	r0, r0, #1
	mov	lr, pc
	bx	r5
	str	r1, [r4, #32]
.L36:
	str	r6, [r4, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L25:
	ldr	lr, .L44+4
	ldr	ip, [r0]
	ldr	r3, [r0, #20]
	ldr	r2, [lr]
	add	r3, ip, r3
	sub	r3, r3, r2
	cmp	r3, #0
	ldr	r5, [lr, #4]
	ldr	r3, [r0, #4]
	blt	.L41
	ldr	r6, [lr, #20]
	add	r2, r2, r6
	sub	r2, ip, r2
	cmp	r2, #0
	ble	.L30
	ldr	r2, [r0, #8]
	sub	lr, r3, r5
	ldr	r0, [r0, #24]
	cmp	lr, #0
	sub	ip, ip, r2
	add	r6, r0, #1
	blt	.L42
	cmp	r3, r5
	streq	ip, [r4]
	strheq	r1, [r4, #56]	@ movhi
	beq	.L26
	mov	r1, #3584
.L40:
	ldr	r2, [r4, #12]
	sub	r3, r3, r2
	str	ip, [r4]
	str	r3, [r4, #4]
	strh	r1, [r4, #56]	@ movhi
	b	.L26
.L41:
	sub	r1, r3, r5
	ldr	r0, [r0, #24]
	ldr	r2, [r4, #8]
	cmp	r1, #0
	movlt	r1, #1536
	add	r6, r0, #1
	add	ip, ip, r2
	blt	.L39
	cmp	r3, r5
	moveq	r3, #2048
	movne	r1, #2560
	streq	ip, [r4]
	strheq	r3, [r4, #56]	@ movhi
	bne	.L40
	b	.L26
.L30:
	ldr	r2, [r0, #16]
	add	r2, r3, r2
	sub	r2, r2, r5
	cmp	r2, #0
	blt	.L43
	ldr	r2, [lr, #16]
	add	r5, r5, r2
	sub	r5, r3, r5
	cmp	r5, #0
	ble	.L34
	mov	r2, #3072
	ldr	r1, [r0, #12]
	ldr	r0, [r0, #24]
	sub	r3, r3, r1
	str	r3, [r4, #4]
	strh	r2, [r4, #56]	@ movhi
	add	r6, r0, #1
	b	.L26
.L42:
	mov	r1, #512
.L39:
	ldr	r2, [r4, #12]
	add	r3, r2, r3
	str	ip, [r4]
	str	r3, [r4, #4]
	strh	r1, [r4, #56]	@ movhi
	b	.L26
.L43:
	mov	r1, #1024
	ldr	r2, [r0, #12]
	ldr	r0, [r0, #24]
	add	r3, r2, r3
	str	r3, [r4, #4]
	strh	r1, [r4, #56]	@ movhi
	add	r6, r0, #1
	b	.L26
.L34:
	bl	orientateZombie
	ldr	r3, [r0, #48]
	cmp	r3, #0
	mov	r2, #1
	movne	r3, #5
	mov	r0, r2
	mov	r6, #2
	str	r3, [r4, #32]
	str	r2, [r4, #40]
	b	.L26
.L45:
	.align	2
.L44:
	.word	__aeabi_idivmod
	.word	player
	.size	moveZombies, .-moveZombies
	.align	2
	.global	shadowZombies
	.syntax unified
	.arm
	.fpu softvfp
	.type	shadowZombies, %function
shadowZombies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L56
	mov	r0, ip
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r7, .L56+4
	ldr	r6, .L56+8
	ldr	r1, .L56+12
	ldrh	r5, [r7]
	ldrh	r4, [r6]
	add	lr, r1, #680
.L49:
	add	r2, r1, #28
	ldr	r3, [r1, #4]
	ldr	r8, [r1]
	ldm	r2, {r2, r9}
	ldrh	r10, [r1, #56]
	add	r2, r2, r9, lsl #5
	sub	r3, r3, r4
	ldr	r9, [r1, #52]
	sub	r8, r8, r5
	orr	r3, r3, r10
	lsl	r8, r8, #16
	cmp	r9, #0
	asr	r8, r8, #16
	orr	r3, r3, #16384
	lsl	r2, r2, #17
	orr	r9, r8, #256
	lsl	r3, r3, #16
	orreq	r8, r8, #512
	orr	r2, r2, #268435456
	add	r1, r1, #68
	strhne	r9, [r0, #8]	@ movhi
	strheq	r8, [r0, #8]	@ movhi
	lsr	r3, r3, #16
	lsr	r2, r2, #16
	cmp	lr, r1
	strh	r3, [r0, #10]	@ movhi
	strh	r2, [r0, #12]	@ movhi
	add	r0, r0, #8
	bne	.L49
	ldr	r0, .L56+16
	ldrh	r5, [r7]
	ldrh	r6, [r6]
	ldr	r4, .L56+20
	add	lr, r0, #340
.L52:
	add	r2, r0, #28
	ldr	r3, [r0, #4]
	ldr	r1, [r0]
	ldm	r2, {r2, r7}
	ldrh	r8, [r0, #56]
	add	r2, r2, r7, lsl #6
	sub	r3, r3, r6
	ldr	r7, [r0, #52]
	sub	r1, r1, r5
	orr	r3, r3, r8
	lsl	r1, r1, #16
	cmp	r7, #0
	asr	r1, r1, #16
	orr	r3, r3, r4
	lsl	r2, r2, #17
	orr	r7, r1, #256
	lsl	r3, r3, #16
	orreq	r1, r1, #512
	orr	r2, r2, #536870912
	add	r0, r0, #68
	strhne	r7, [ip, #88]	@ movhi
	strheq	r1, [ip, #88]	@ movhi
	lsr	r3, r3, #16
	lsr	r2, r2, #16
	cmp	lr, r0
	strh	r3, [ip, #90]	@ movhi
	strh	r2, [ip, #92]	@ movhi
	add	ip, ip, #8
	bne	.L52
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	shadowOAM
	.word	vOff
	.word	hOff
	.word	zombies
	.word	bosses
	.word	-32768
	.size	shadowZombies, .-shadowZombies
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_d2iz
	.align	2
	.global	checkProximity
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkProximity, %function
checkProximity:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, .L60
	ldr	r2, [r0, #16]
	ldr	r3, [r5, #16]
	mov	r4, r0
	ldr	r1, [r5, #4]
	ldr	r0, [r0, #4]
	add	r2, r2, r2, lsr #31
	add	r3, r3, r3, lsr #31
	add	r0, r0, r2, asr #1
	add	r3, r1, r3, asr #1
	ldr	r8, .L60+4
	sub	r0, r3, r0
	mov	lr, pc
	bx	r8
	ldr	r3, [r5, #20]
	mov	r7, r1
	ldr	r1, [r4, #20]
	mov	r6, r0
	ldr	r2, [r5]
	ldr	r0, [r4]
	add	r1, r1, r1, lsr #31
	add	r3, r3, r3, lsr #31
	add	r3, r2, r3, asr #1
	add	r0, r0, r1, asr #1
	sub	r0, r3, r0
	mov	lr, pc
	bx	r8
	mov	r5, r1
	mov	r4, r0
	mov	r2, r6
	mov	r3, r7
	ldr	r8, .L60+8
	mov	r0, r6
	mov	r1, r7
	mov	lr, pc
	bx	r8
	mov	r7, r5
	ldr	r5, .L60+12
	mov	lr, pc
	bx	r5
	mov	r6, r4
	mov	r3, r7
	mov	r4, r0
	mov	r2, r6
	mov	r0, r6
	mov	r1, r7
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r5
	ldr	r3, .L60+16
	add	r0, r4, r0
	cmp	r0, r3
	movgt	r0, #0
	movle	r0, #1
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L61:
	.align	2
.L60:
	.word	player
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_d2iz
	.word	325
	.size	checkProximity, .-checkProximity
	.align	2
	.global	zombieMelee
	.syntax unified
	.arm
	.fpu softvfp
	.type	zombieMelee, %function
zombieMelee:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #40]
	cmp	r2, #0
	bxeq	lr
	ldr	r1, [r0, #48]
	cmp	r1, #0
	mov	r3, r0
	ldr	r2, [r0, #32]
	bne	.L65
	push	{r4, lr}
	mov	r4, #5
	mov	lr, #12
	mov	ip, #9
	cmp	r2, r4
	str	r4, [r0, #60]
	str	lr, [r0, #28]
	str	ip, [r0, #36]
	beq	.L75
	cmp	r2, #8
	bne	.L62
	mov	ip, #11
	mov	r0, #16
	mov	r2, #20
	str	r1, [r3, #32]
	str	r1, [r3, #40]
	str	ip, [r3, #28]
	str	r0, [r3, #36]
	str	r2, [r3, #60]
.L62:
	pop	{r4, lr}
	bx	lr
.L65:
	mov	r0, #9
	mov	r1, #10
	cmp	r2, #8
	str	r0, [r3, #36]
	str	r1, [r3, #60]
	bxne	lr
	mov	r2, #0
	mov	r0, #5
	mov	r1, #20
	str	r0, [r3, #36]
	str	r2, [r3, #32]
	str	r2, [r3, #40]
	str	r1, [r3, #60]
	bx	lr
.L75:
	bl	checkProximity
	cmp	r0, #0
	beq	.L62
	mov	r0, #1
	mov	r1, #150
	ldr	r3, .L76
	ldr	ip, .L76+4
	ldr	r2, [r3, #56]
	ldr	ip, [ip]
	sub	r2, r2, ip
	str	r2, [r3, #56]
	str	r0, [r3, #60]
	str	r1, [r3, #64]
	b	.L62
.L77:
	.align	2
.L76:
	.word	player
	.word	zombieDamage
	.size	zombieMelee, .-zombieMelee
	.align	2
	.global	updateZombies
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateZombies, %function
updateZombies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L94
	add	r5, r4, #680
	b	.L80
.L79:
	add	r4, r4, #68
	cmp	r4, r5
	beq	.L92
.L80:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L79
	mov	r0, r4
	bl	moveZombies
	mov	r0, r4
	add	r4, r4, #68
	bl	zombieMelee
	cmp	r4, r5
	bne	.L80
.L92:
	ldr	r4, .L94+4
	add	r5, r4, #340
.L82:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L93
.L81:
	add	r4, r4, #68
	cmp	r5, r4
	bne	.L82
	pop	{r4, r5, r6, lr}
	bx	lr
.L93:
	mov	r0, r4
	bl	moveZombies
	mov	r0, r4
	bl	zombieMelee
	b	.L81
.L95:
	.align	2
.L94:
	.word	zombies
	.word	bosses
	.size	updateZombies, .-updateZombies
	.align	2
	.global	checkColumns
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkColumns, %function
checkColumns:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L101
	ldr	r2, [r0, #4]
	ldr	r3, [r1, #4]
	cmp	r3, r2
	blt	.L97
	ldr	ip, [r0, #16]
	add	ip, r2, ip
	cmp	r3, ip
	ble	.L99
.L97:
	ldr	r1, [r1, #16]
	add	r3, r3, r1
	cmp	r2, r3
	bgt	.L100
	ldr	r0, [r0, #16]
	add	r0, r2, r0
	cmp	r3, r0
	movgt	r0, #0
	movle	r0, #1
	bx	lr
.L100:
	mov	r0, #0
	bx	lr
.L99:
	mov	r0, #1
	bx	lr
.L102:
	.align	2
.L101:
	.word	player
	.size	checkColumns, .-checkColumns
	.align	2
	.global	checkRows
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkRows, %function
checkRows:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L108
	ldr	r2, [r0]
	ldr	r3, [r1]
	cmp	r3, r2
	blt	.L104
	ldr	ip, [r0, #20]
	add	ip, r2, ip
	cmp	r3, ip
	ble	.L106
.L104:
	ldr	r1, [r1, #20]
	add	r3, r3, r1
	cmp	r2, r3
	bgt	.L107
	ldr	r0, [r0, #20]
	add	r0, r2, r0
	cmp	r3, r0
	movgt	r0, #0
	movle	r0, #1
	bx	lr
.L107:
	mov	r0, #0
	bx	lr
.L106:
	mov	r0, #1
	bx	lr
.L109:
	.align	2
.L108:
	.word	player
	.size	checkRows, .-checkRows
	.align	2
	.global	zombieOrientate
	.syntax unified
	.arm
	.fpu softvfp
	.type	zombieOrientate, %function
zombieOrientate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L119
	mov	r4, r0
	mov	lr, pc
	bx	r5
	ldr	r3, .L119+4
	rsbs	r2, r0, #0
	ldr	r1, [r3]
	and	r2, r2, #3
	and	r3, r0, #3
	rsbpl	r3, r2, #0
	str	r1, [r4, #44]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L110
.L113:
	.word	.L116
	.word	.L115
	.word	.L114
	.word	.L112
.L116:
	ldr	r3, .L119+8
	ldr	r3, [r3]
.L118:
	str	r3, [r4]
	mov	lr, pc
	bx	r5
	ldr	r2, .L119+12
	smull	r3, r2, r0, r2
	ldr	r1, .L119+16
	add	r2, r2, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, lsl #4
	ldr	r2, [r1]
	sub	r0, r0, r3, lsl #4
	add	r0, r0, r2
	str	r0, [r4, #4]
.L110:
	pop	{r4, r5, r6, lr}
	bx	lr
.L112:
	mov	lr, pc
	bx	r5
	ldr	r3, .L119+20
	smull	r1, r2, r3, r0
	ldr	ip, .L119+8
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #6
	ldr	r1, .L119+16
	ldr	r2, [ip]
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #5
	ldr	r3, [r1]
	add	r0, r0, r2
	stm	r4, {r0, r3}
	pop	{r4, r5, r6, lr}
	bx	lr
.L115:
	ldr	r3, .L119+8
	ldr	r3, [r3]
	add	r3, r3, #160
	b	.L118
.L114:
	mov	lr, pc
	bx	r5
	ldr	r3, .L119+20
	smull	r1, r2, r3, r0
	ldr	ip, .L119+16
	asr	r3, r0, #31
	ldr	r1, .L119+8
	rsb	r3, r3, r2, asr #6
	ldr	r1, [r1]
	ldr	r2, [ip]
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #5
	add	r0, r0, r1
	add	r3, r2, #240
	stm	r4, {r0, r3}
	pop	{r4, r5, r6, lr}
	bx	lr
.L120:
	.align	2
.L119:
	.word	rand
	.word	.LANCHOR0
	.word	vOff
	.word	-2004318071
	.word	hOff
	.word	1717986919
	.size	zombieOrientate, .-zombieOrientate
	.align	2
	.global	spawnZombie
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnZombie, %function
spawnZombie:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L131
	mov	r0, #0
	mov	r3, r1
	b	.L124
.L122:
	add	r0, r0, #1
	cmp	r0, #10
	add	r3, r3, #68
	bxeq	lr
.L124:
	ldr	r2, [r3, #52]
	cmp	r2, #0
	bne	.L122
	mov	r2, #1
	ldr	r3, .L131+4
	add	r0, r0, r0, lsl #4
	ldr	r3, [r3]
	add	r0, r1, r0, lsl #2
	push	{r4, lr}
	str	r2, [r0, #52]
	str	r3, [r0, #44]
	bl	zombieOrientate
	ldr	r2, .L131+8
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L132:
	.align	2
.L131:
	.word	zombies
	.word	.LANCHOR0
	.word	activeZombies
	.size	spawnZombie, .-spawnZombie
	.align	2
	.global	spawnBossZombie
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnBossZombie, %function
spawnBossZombie:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L144
	mov	r3, r1
	ldr	r2, [r3, #52]
	cmp	r2, #0
	mov	r0, #0
	beq	.L143
.L134:
	add	r0, r0, #1
	cmp	r0, #5
	add	r3, r3, #68
	bxeq	lr
	ldr	r2, [r3, #52]
	cmp	r2, #0
	bne	.L134
.L143:
	mov	r2, #1
	ldr	r3, .L144+4
	add	r0, r0, r0, lsl #4
	ldr	r3, [r3, #4]
	add	r0, r1, r0, lsl #2
	push	{r4, lr}
	str	r2, [r0, #52]
	str	r3, [r0, #44]
	bl	zombieOrientate
	ldr	r2, .L144+8
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L145:
	.align	2
.L144:
	.word	bosses
	.word	.LANCHOR0
	.word	activeBosses
	.size	spawnBossZombie, .-spawnBossZombie
	.align	2
	.global	zombieBlood
	.syntax unified
	.arm
	.fpu softvfp
	.type	zombieBlood, %function
zombieBlood:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0]
	cmp	r3, #224
	push	{r4, lr}
	bgt	.L147
	ldr	r2, [r0, #4]
	cmp	r2, #240
	bgt	.L148
	add	r1, r3, #7
	cmp	r3, #0
	movlt	r3, r1
	add	r1, r2, #7
	cmp	r2, #0
	movlt	r2, r1
	mov	ip, #1
	asr	r3, r3, #3
	lsl	r3, r3, #5
	asr	r0, r2, #3
	add	r1, r0, ip
	add	r4, r3, #32
	ldr	lr, .L154
	add	r2, r3, r2, asr #3
	add	r0, r4, r0
	add	r3, r3, r1
	add	r1, r1, r4
	lsl	r2, r2, ip
	lsl	r3, r3, ip
	lsl	r0, r0, ip
	lsl	r1, r1, ip
	strh	ip, [lr, r2]	@ movhi
	strh	ip, [lr, r3]	@ movhi
	strh	ip, [lr, r0]	@ movhi
	strh	ip, [lr, r1]	@ movhi
.L146:
	pop	{r4, lr}
	bx	lr
.L147:
	cmp	r3, #255
	ble	.L146
	ldr	r2, [r0, #4]
	sub	r3, r3, #256
	asr	r3, r3, #3
	lsl	r3, r3, #5
	cmp	r2, #240
	add	ip, r3, #32
	ble	.L153
	subs	r1, r2, #256
	submi	r2, r2, #249
	movpl	r2, r1
	ldr	lr, .L154+4
	asr	r0, r2, #3
	add	r1, r0, #1
	add	r2, r3, r2, asr #3
.L152:
	ldr	r4, .L154+8
	add	r3, r1, r3
	add	r0, r0, ip
	add	r1, r1, ip
	lsl	r2, r2, #1
	lsl	r3, r3, #1
	lsl	r1, r1, #1
	lsl	r0, r0, #1
	strh	r4, [lr, r2]	@ movhi
	strh	r4, [lr, r3]	@ movhi
	strh	r4, [lr, r0]	@ movhi
	strh	r4, [lr, r1]	@ movhi
	pop	{r4, lr}
	bx	lr
.L148:
	cmp	r2, #280
	blt	.L146
	add	r1, r3, #7
	cmp	r3, #0
	movlt	r3, r1
	mov	ip, #105
	sub	r2, r2, #256
	asr	r3, r3, #3
	lsl	r3, r3, #5
	asr	r0, r2, #3
	add	r4, r3, #32
	add	r1, r0, #1
	ldr	lr, .L154+12
	add	r2, r3, r2, asr #3
	add	r0, r4, r0
	add	r3, r3, r1
	add	r1, r1, r4
	lsl	r2, r2, #1
	lsl	r3, r3, #1
	lsl	r0, r0, #1
	lsl	r1, r1, #1
	strh	ip, [lr, r2]	@ movhi
	strh	ip, [lr, r3]	@ movhi
	strh	ip, [lr, r0]	@ movhi
	strh	ip, [lr, r1]	@ movhi
	pop	{r4, lr}
	bx	lr
.L153:
	add	r1, r2, #7
	cmp	r2, #0
	movlt	r2, r1
	asr	r0, r2, #3
	ldr	lr, .L154+16
	add	r1, r0, #1
	add	r2, r3, r2, asr #3
	b	.L152
.L155:
	.align	2
.L154:
	.word	100718592
	.word	100724736
	.word	787
	.word	100720640
	.word	100722688
	.size	zombieBlood, .-zombieBlood
	.align	2
	.global	decrementZombieHealth
	.syntax unified
	.arm
	.fpu softvfp
	.type	decrementZombieHealth, %function
decrementZombieHealth:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #64]
	cmp	r2, #2
	push	{r4, lr}
	ldr	r3, [r0, #44]
	mov	r4, r0
	beq	.L164
	cmp	r2, #1
	ldreq	r2, .L167
	ldreq	r2, [r2]
	subne	r3, r3, #10
	subeq	r3, r3, r2
	cmp	r3, #0
	str	r3, [r0, #44]
	ble	.L165
.L156:
	pop	{r4, lr}
	bx	lr
.L164:
	ldr	r2, .L167+4
	ldr	r2, [r2]
	sub	r3, r3, r2
	cmp	r3, #0
	str	r3, [r0, #44]
	bgt	.L156
.L165:
	mov	r3, #0
	mov	r0, r4
	str	r3, [r4, #52]
	bl	zombieBlood
	ldr	r3, [r4, #48]
	cmp	r3, #0
	beq	.L166
	ldr	r1, .L167+8
	ldr	r3, [r1]
	ldr	r2, .L167+12
	sub	r3, r3, #1
	str	r3, [r1]
	ldr	r3, [r2]
.L162:
	add	r3, r3, #10
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L166:
	ldr	r0, .L167+16
	ldr	r2, .L167+12
	ldr	r1, [r0]
	ldr	r3, [r2]
	sub	r1, r1, #1
	str	r1, [r0]
	add	r3, r3, #20
	b	.L162
.L168:
	.align	2
.L167:
	.word	pistolDamage
	.word	rifleDamage
	.word	activeBosses
	.word	score
	.word	activeZombies
	.size	decrementZombieHealth, .-decrementZombieHealth
	.align	2
	.global	decrementPlayerHealth
	.syntax unified
	.arm
	.fpu softvfp
	.type	decrementPlayerHealth, %function
decrementPlayerHealth:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #48]
	ldr	r2, .L172
	ldr	r1, .L172+4
	cmp	r3, #0
	ldr	r1, [r1]
	ldr	r3, [r2, #56]
	subne	r3, r3, r1, lsl #1
	subeq	r3, r3, r1
	str	r3, [r2, #56]
	bx	lr
.L173:
	.align	2
.L172:
	.word	player
	.word	zombieDamage
	.size	decrementPlayerHealth, .-decrementPlayerHealth
	.align	2
	.global	proximityHelper
	.syntax unified
	.arm
	.fpu softvfp
	.type	proximityHelper, %function
proximityHelper:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, .L176
	ldr	r2, [r0, #16]
	ldr	r3, [r5, #16]
	mov	r4, r0
	ldr	r1, [r5, #4]
	ldr	r0, [r0, #4]
	add	r2, r2, r2, lsr #31
	add	r3, r3, r3, lsr #31
	add	r0, r0, r2, asr #1
	add	r3, r1, r3, asr #1
	ldr	r8, .L176+4
	sub	r0, r3, r0
	mov	lr, pc
	bx	r8
	ldr	r3, [r5, #20]
	mov	r7, r1
	ldr	r1, [r4, #20]
	mov	r6, r0
	ldr	r2, [r5]
	ldr	r0, [r4]
	add	r1, r1, r1, lsr #31
	add	r3, r3, r3, lsr #31
	add	r3, r2, r3, asr #1
	add	r0, r0, r1, asr #1
	sub	r0, r3, r0
	mov	lr, pc
	bx	r8
	mov	r5, r1
	mov	r4, r0
	mov	r2, r6
	mov	r3, r7
	ldr	r8, .L176+8
	mov	r0, r6
	mov	r1, r7
	mov	lr, pc
	bx	r8
	mov	r7, r5
	ldr	r5, .L176+12
	mov	lr, pc
	bx	r5
	mov	r6, r4
	mov	r3, r7
	mov	r4, r0
	mov	r2, r6
	mov	r0, r6
	mov	r1, r7
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r5
	add	r0, r4, r0
	cmp	r0, #400
	movgt	r0, #0
	movle	r0, #1
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L177:
	.align	2
.L176:
	.word	player
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_d2iz
	.size	proximityHelper, .-proximityHelper
	.align	2
	.global	destroyZombies
	.syntax unified
	.arm
	.fpu softvfp
	.type	destroyZombies, %function
destroyZombies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L181
	add	r1, r3, #680
.L179:
	str	r2, [r3, #52]
	add	r3, r3, #68
	cmp	r1, r3
	bne	.L179
	ldr	r3, .L181+4
	str	r2, [r3, #52]
	str	r2, [r3, #120]
	str	r2, [r3, #188]
	str	r2, [r3, #256]
	str	r2, [r3, #324]
	bx	lr
.L182:
	.align	2
.L181:
	.word	zombies
	.word	bosses
	.size	destroyZombies, .-destroyZombies
	.comm	bosses,340,4
	.comm	zombies,680,4
	.global	bossStartHealth
	.global	zombieStarthealth
	.global	bossNotSpawned
	.global	zombieNotSpawned
	.comm	activeBosses,4,4
	.comm	activeZombies,4,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	zombieStarthealth, %object
	.size	zombieStarthealth, 4
zombieStarthealth:
	.word	100
	.type	bossStartHealth, %object
	.size	bossStartHealth, 4
bossStartHealth:
	.word	200
	.type	bossNotSpawned, %object
	.size	bossNotSpawned, 4
bossNotSpawned:
	.word	1
	.type	zombieNotSpawned, %object
	.size	zombieNotSpawned, 4
zombieNotSpawned:
	.word	1
	.ident	"GCC: (devkitARM release 53) 9.1.0"
