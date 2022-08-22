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
	.file	"player.c"
	.text
	.align	2
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	lr, #1
	mov	r0, #0
	mov	ip, #16
	mov	r6, #15
	mov	r5, #100
	mov	r4, #150
	ldr	r3, .L4
	ldr	r2, [r3, #16]
	ldr	r7, .L4+4
	add	r1, r2, r2, lsr #31
	asr	r1, r1, lr
	ldr	r2, [r7]
	rsb	r1, r1, #80
	add	r1, r1, r2
	ldr	r2, [r3, #20]
	str	r1, [r3]
	ldr	r1, .L4+8
	add	r2, r2, r2, lsr #31
	asr	r2, r2, lr
	ldr	r1, [r1]
	rsb	r2, r2, #120
	add	r2, r2, r1
	str	r6, [r3, #44]
	str	r5, [r3, #56]
	str	r4, [r3, #64]
	str	lr, [r3, #8]
	str	lr, [r3, #12]
	str	r2, [r3, #4]
	str	ip, [r3, #20]
	str	ip, [r3, #16]
	str	ip, [r3, #40]
	str	r0, [r3, #24]
	str	r0, [r3, #36]
	str	r0, [r3, #28]
	str	r0, [r3, #48]
	str	r0, [r3, #52]
	str	r0, [r3, #60]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.word	vOff
	.word	hOff
	.size	initPlayer, .-initPlayer
	.align	2
	.global	shadowPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	shadowPlayer, %function
shadowPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L8
	ldr	r2, .L8+4
	ldr	r3, [r0, #4]
	ldr	r2, [r2]
	ldr	ip, .L8+8
	ldr	r1, .L8+12
	push	{r4, lr}
	sub	r3, r3, r2
	ldrh	r4, [ip]
	ldr	lr, [r1]
	ldr	ip, [r0, #36]
	ldr	r1, [r0]
	ldr	r2, [r0, #28]
	orr	r3, r3, r4
	ldr	r0, .L8+16
	sub	r1, r1, lr
	add	r2, r2, ip, lsl #5
	orr	r3, r3, #16384
	orr	r1, r1, #256
	lsl	r2, r2, #1
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	player
	.word	hOff
	.word	direction
	.word	vOff
	.word	shadowOAM
	.size	shadowPlayer, .-shadowPlayer
	.global	__aeabi_idivmod
	.align	2
	.global	playerState
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerState, %function
playerState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L35
	ldr	r3, [r4, #48]
	cmp	r3, #1
	beq	.L11
	ldr	r3, [r4, #52]
	cmp	r3, #1
	beq	.L11
	ldr	r3, .L35+4
	ldrh	r1, [r3, #48]
	ldr	r2, .L35+8
	tst	r1, #64
	ldr	r2, [r2]
	beq	.L12
	ldrh	r1, [r3, #48]
	tst	r1, #16
	bne	.L34
.L12:
	cmp	r2, #0
	bne	.L14
	mov	r2, #1
	mov	r3, #16
	str	r2, [r4, #28]
	str	r3, [r4, #40]
.L11:
	ldr	r3, .L35+12
	ldr	r5, [r4, #24]
	ldr	r1, [r3]
	mov	r0, r5
	ldr	r6, .L35+16
	mov	lr, pc
	bx	r6
	cmp	r1, #0
	bne	.L17
	add	r0, r4, #36
	ldm	r0, {r0, r1}
	add	r0, r0, #1
	mov	lr, pc
	bx	r6
	str	r1, [r4, #36]
.L17:
	add	r5, r5, #1
	str	r5, [r4, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L14:
	cmp	r2, #1
	moveq	r3, #5
	streq	r3, [r4, #28]
	streq	r3, [r4, #40]
	beq	.L11
.L15:
	mov	r2, #7
	mov	r3, #5
	str	r2, [r4, #28]
	str	r3, [r4, #40]
	b	.L11
.L34:
	ldrh	r1, [r3, #48]
	tst	r1, #128
	beq	.L12
	ldrh	r3, [r3, #48]
	tst	r3, #32
	beq	.L12
	cmp	r2, #0
	moveq	r3, #12
	streq	r2, [r4, #28]
	streq	r3, [r4, #40]
	beq	.L11
.L16:
	cmp	r2, #1
	bne	.L15
	mov	r2, #3
	mov	r3, #6
	str	r2, [r4, #28]
	str	r3, [r4, #40]
	b	.L11
.L36:
	.align	2
.L35:
	.word	player
	.word	67109120
	.word	weapon
	.word	.LANCHOR0
	.word	__aeabi_idivmod
	.size	playerState, .-playerState
	.align	2
	.global	reloadLogic
	.syntax unified
	.arm
	.fpu softvfp
	.type	reloadLogic, %function
reloadLogic:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L48
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L47
	ldr	r0, .L48+4
	ldr	r2, [r0]
	ldr	r1, .L48+8
	cmp	r2, #0
	ldr	r3, [r1]
	bne	.L43
	cmp	r3, #30
	bgt	.L44
.L46:
	str	r3, [r0]
	str	r2, [r1]
	bx	lr
.L43:
	rsb	ip, r2, #30
	cmp	ip, r3
	bge	.L45
	mov	r2, #30
	sub	r3, r3, ip
	str	r3, [r1]
	str	r2, [r0]
	bx	lr
.L45:
	mov	ip, #0
	add	r3, r2, r3
	str	r3, [r0]
	str	ip, [r1]
	bx	lr
.L47:
	ldr	r0, .L48+12
	ldr	r2, [r0]
	ldr	r1, .L48+16
	cmp	r2, #0
	ldr	r3, [r1]
	bne	.L39
	cmp	r3, #12
	ble	.L46
	mov	r2, #12
	sub	r3, r3, #12
	str	r3, [r1]
	str	r2, [r0]
	bx	lr
.L39:
	rsb	ip, r2, #12
	cmp	ip, r3
	bge	.L45
	mov	r2, #12
	sub	r3, r3, ip
	str	r3, [r1]
	str	r2, [r0]
	bx	lr
.L44:
	mov	r2, #30
	sub	r3, r3, #30
	str	r3, [r1]
	str	r2, [r0]
	bx	lr
.L49:
	.align	2
.L48:
	.word	weapon
	.word	rifleAmmo
	.word	rifleStockPile
	.word	pistolAmmo
	.word	pistolStockPile
	.size	reloadLogic, .-reloadLogic
	.align	2
	.global	playerReload
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerReload, %function
playerReload:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L61
	ldr	r3, [r3]
	cmp	r3, #1
	str	lr, [sp, #-4]!
	beq	.L59
	cmp	r3, #2
	beq	.L60
.L50:
	ldr	lr, [sp], #4
	bx	lr
.L60:
	ldr	r3, .L61+4
	ldr	r2, [r3, #48]
	cmp	r2, #0
	beq	.L50
	mov	ip, #20
	mov	r1, #10
	mov	r2, #7
	ldr	lr, [r3, #36]
	ldr	r0, .L61+8
	cmp	lr, #6
	str	ip, [r0]
	str	r1, [r3, #28]
	str	r2, [r3, #40]
	bne	.L50
	mov	r1, #0
	mov	r0, #5
	ldr	lr, [sp], #4
	str	r2, [r3, #28]
	str	r0, [r3, #40]
	str	r1, [r3, #36]
	str	r1, [r3, #48]
	b	reloadLogic
.L59:
	ldr	r3, .L61+4
	ldr	r2, [r3, #48]
	cmp	r2, #0
	beq	.L50
	mov	ip, #10
	mov	r1, #6
	mov	r0, #11
	ldr	lr, [r3, #36]
	ldr	r2, .L61+8
	cmp	lr, ip
	str	ip, [r2]
	str	r1, [r3, #28]
	str	r0, [r3, #40]
	bne	.L50
	mov	lr, #3
	mov	r0, #0
	mov	ip, #20
	str	lr, [r3, #28]
	ldr	lr, [sp], #4
	str	r1, [r3, #40]
	str	r0, [r3, #36]
	str	r0, [r3, #48]
	str	ip, [r2]
	b	reloadLogic
.L62:
	.align	2
.L61:
	.word	weapon
	.word	player
	.word	.LANCHOR0
	.size	playerReload, .-playerReload
	.align	2
	.global	changeWeapon
	.syntax unified
	.arm
	.fpu softvfp
	.type	changeWeapon, %function
changeWeapon:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L79
	ldr	r2, [r3]
	cmp	r2, #0
	push	{r4, lr}
	bne	.L64
	ldr	r1, .L79+4
	ldr	r1, [r1]
	cmp	r1, #0
	bne	.L77
	ldr	r2, .L79+8
	ldr	r2, [r2]
	cmp	r2, #0
	bne	.L68
.L63:
	pop	{r4, lr}
	bx	lr
.L64:
	cmp	r2, #1
	beq	.L78
	cmp	r2, #2
	bne	.L63
.L69:
	mov	r1, #0
	mov	r0, #12
	ldr	r2, .L79+12
	str	r1, [r3]
	str	r1, [r2, #28]
	str	r1, [r2, #36]
	str	r0, [r2, #40]
	pop	{r4, lr}
	bx	lr
.L77:
	mov	lr, #1
	mov	r0, #3
	mov	ip, #6
	str	lr, [r3]
	ldr	r1, .L79+16
	ldr	r3, .L79+12
	ldr	r4, .L79+20
	str	r0, [r3, #28]
	ldr	r1, [r1]
	ldr	r0, .L79+24
	str	r2, [r3, #36]
	str	ip, [r3, #40]
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L78:
	ldr	r2, .L79+8
	ldr	r2, [r2]
	cmp	r2, #0
	beq	.L69
.L68:
	mov	lr, #5
	mov	r2, #0
	mov	r4, #7
	mov	ip, #2
	ldr	r0, .L79+12
	ldr	r1, .L79+28
	str	r4, [r0, #28]
	str	lr, [r0, #40]
	str	r2, [r0, #36]
	ldr	r4, .L79+20
	ldr	r1, [r1]
	ldr	r0, .L79+32
	str	ip, [r3]
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L80:
	.align	2
.L79:
	.word	weapon
	.word	pistolFound
	.word	rifleFound
	.word	player
	.word	pistolClick_length
	.word	playSoundB
	.word	pistolClick_data
	.word	rifleClick_length
	.word	rifleClick_data
	.size	changeWeapon, .-changeWeapon
	.align	2
	.global	playerCheckMeleeSuccess
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerCheckMeleeSuccess, %function
playerCheckMeleeSuccess:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L101
	ldr	r6, .L101+4
	ldr	r7, .L101+8
	add	r5, r4, #680
	b	.L85
.L83:
	add	r4, r4, #68
	cmp	r4, r5
	beq	.L99
.L85:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L83
	mov	r0, r4
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L83
	mov	r0, r4
	add	r4, r4, #68
	mov	lr, pc
	bx	r7
	cmp	r4, r5
	bne	.L85
.L99:
	ldr	r4, .L101+12
	ldr	r6, .L101+4
	ldr	r7, .L101+8
	add	r5, r4, #340
.L89:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L100
.L87:
	add	r4, r4, #68
	cmp	r5, r4
	bne	.L89
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L100:
	mov	r0, r4
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L87
	mov	r0, r4
	mov	lr, pc
	bx	r7
	b	.L87
.L102:
	.align	2
.L101:
	.word	zombies
	.word	proximityHelper
	.word	decrementZombieHealth
	.word	bosses
	.size	playerCheckMeleeSuccess, .-playerCheckMeleeSuccess
	.align	2
	.global	playerMelee
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerMelee, %function
playerMelee:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L125
	ldr	r3, [r3]
	cmp	r3, #1
	push	{r4, r5, r6, lr}
	beq	.L120
	cmp	r3, #2
	beq	.L121
	cmp	r3, #0
	bne	.L103
	ldr	r4, .L125+4
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L103
	mov	r0, #5
	mov	r1, #2
	mov	r2, #15
	ldr	r3, [r4, #36]
	ldr	r5, .L125+8
	cmp	r3, #8
	str	r0, [r5]
	str	r1, [r4, #28]
	str	r2, [r4, #40]
	beq	.L122
.L111:
	cmp	r3, #14
	bne	.L103
	mov	r3, #0
	mov	r1, #12
	mov	r2, #20
	str	r3, [r4, #28]
	str	r3, [r4, #36]
	str	r3, [r4, #52]
	str	r1, [r4, #40]
	str	r2, [r5]
.L103:
	pop	{r4, r5, r6, lr}
	bx	lr
.L121:
	ldr	r4, .L125+4
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L103
	mov	r0, #5
	mov	r1, #8
	mov	r2, #12
	ldr	r3, [r4, #36]
	ldr	r5, .L125+8
	cmp	r3, #7
	str	r0, [r5]
	str	r1, [r4, #28]
	str	r2, [r4, #40]
	beq	.L123
.L110:
	cmp	r3, #11
	bne	.L103
	mov	r0, #7
	mov	r1, #5
	b	.L119
.L120:
	ldr	r4, .L125+4
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L103
	mov	r1, #4
	mov	r0, #5
	mov	r2, #9
	ldr	r3, [r4, #36]
	ldr	r5, .L125+8
	cmp	r3, r1
	str	r0, [r5]
	str	r1, [r4, #28]
	str	r2, [r4, #40]
	beq	.L124
.L107:
	cmp	r3, #8
	moveq	r0, #3
	moveq	r1, #6
	bne	.L103
.L119:
	mov	r3, #0
	mov	r2, #20
	str	r0, [r4, #28]
	str	r1, [r4, #40]
	str	r3, [r4, #36]
	str	r3, [r4, #52]
	str	r2, [r5]
	pop	{r4, r5, r6, lr}
	bx	lr
.L122:
	bl	playerCheckMeleeSuccess
	ldr	r3, [r4, #36]
	b	.L111
.L124:
	bl	playerCheckMeleeSuccess
	ldr	r3, [r4, #36]
	b	.L107
.L123:
	bl	playerCheckMeleeSuccess
	ldr	r3, [r4, #36]
	b	.L110
.L126:
	.align	2
.L125:
	.word	weapon
	.word	player
	.word	.LANCHOR0
	.size	playerMelee, .-playerMelee
	.align	2
	.global	healthRegen
	.syntax unified
	.arm
	.fpu softvfp
	.type	healthRegen, %function
healthRegen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L133
	ldr	r2, [r3, #56]
	cmp	r2, #99
	bxgt	lr
	ldr	r1, [r3, #60]
	cmp	r1, #0
	ldr	r1, [r3, #64]
	addeq	r2, r2, #1
	subne	r1, r1, #1
	streq	r2, [r3, #56]
	strne	r1, [r3, #64]
	cmp	r1, #0
	moveq	r2, #150
	streq	r1, [r3, #60]
	streq	r2, [r3, #64]
	bx	lr
.L134:
	.align	2
.L133:
	.word	player
	.size	healthRegen, .-healthRegen
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	fp, #8
	mov	r7, #0
	mov	r6, #100
	mov	r10, #5
	mov	r5, #2
	ldr	r4, .L139
	add	r9, r4, #1072
	sub	sp, sp, #44
	add	r9, r9, fp
.L136:
	mov	ip, r4
	mov	r8, #0
	str	r7, [sp, #20]
	str	r7, [sp, #32]
	str	r5, [sp, #24]
	str	r5, [sp, #28]
	str	r6, [sp, #4]
	str	r6, [sp, #8]
	str	fp, [sp, #12]
	str	r10, [sp, #16]
	add	lr, sp, #4
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	add	r4, r4, #36
	cmp	r4, r9
	str	r8, [ip]
	bne	.L136
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L140:
	.align	2
.L139:
	.word	bullets
	.size	initBullets, .-initBullets
	.align	2
	.global	moveBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	moveBullets, %function
moveBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0]
	ldr	ip, [r0, #24]
	ldr	r2, [r0, #4]
	ldr	r1, [r0, #20]
	add	r3, r3, ip
	add	r2, r2, r1
	cmp	r3, #0
	str	r3, [r0]
	str	r2, [r0, #4]
	blt	.L142
	ldr	r1, [r0, #8]
	add	r3, r3, r1
	cmp	r3, #159
	movle	r3, #0
	movgt	r3, #1
	orrs	r3, r3, r2, lsr #31
	beq	.L144
.L142:
	mov	r3, #0
	str	r3, [r0, #16]
	bx	lr
.L144:
	ldr	r3, [r0, #12]
	add	r2, r2, r3
	cmp	r2, #239
	bxle	lr
	b	.L142
	.size	moveBullets, .-moveBullets
	.align	2
	.global	orientateBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	orientateBullets, %function
orientateBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, #1
	ldr	r3, .L176
	ldrh	lr, [r3]
	ldr	r1, .L176+4
	ldr	r3, .L176+8
	ldr	r6, .L176+12
	ldr	ip, .L176+16
	cmp	lr, #0
	ldr	r5, [r3]
	str	r4, [r0, #16]
	ldr	r2, [r1, #4]
	ldr	r3, [r1]
	ldr	r6, [r6]
	ldr	ip, [ip]
	bne	.L146
	mvn	r1, #9
	cmp	r5, #2
	str	lr, [r0, #28]
	str	lr, [r0, #20]
	str	r1, [r0, #24]
	subne	r3, r3, #8
	addne	r2, r2, #8
	beq	.L168
.L163:
	sub	ip, r3, ip
	sub	r2, r2, r6
	str	ip, [r0]
	str	r2, [r0, #4]
.L165:
	str	r4, [r0, #32]
.L145:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L146:
	cmp	lr, #512
	beq	.L169
	cmp	lr, #1024
	beq	.L170
	cmp	lr, #1536
	beq	.L171
	cmp	lr, #2048
	beq	.L172
	cmp	lr, #2560
	beq	.L173
	cmp	lr, #3072
	beq	.L174
	mvn	r1, #9
	mov	lr, #3584
	cmp	r5, #2
	str	lr, [r0, #28]
	str	r1, [r0, #20]
	str	r1, [r0, #24]
	subne	r3, r3, #5
	bne	.L163
	sub	r2, r2, #1
.L167:
	sub	r3, r3, #6
	sub	r2, r2, r6
	sub	ip, r3, ip
	str	r2, [r0, #4]
	str	ip, [r0]
	b	.L164
.L168:
	sub	r3, r3, #6
	add	r2, r2, #9
	sub	r2, r2, r6
	sub	ip, r3, ip
	str	r5, [r0, #32]
	str	ip, [r0]
	str	r2, [r0, #4]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L171:
	mov	r1, #10
	cmp	r5, #2
	addeq	r2, r2, #8
	addne	r2, r2, #10
	add	r3, r3, #14
	sub	r3, r3, ip
	subeq	r2, r2, r6
	subne	r2, r2, r6
	str	lr, [r0, #28]
	str	r1, [r0, #20]
	str	r1, [r0, #24]
	streq	r2, [r0, #4]
	streq	r3, [r0]
	streq	r5, [r0, #32]
	strne	r2, [r0, #4]
	strne	r3, [r0]
	strne	r4, [r0, #32]
	b	.L145
.L169:
	mov	r8, #10
	mvn	r7, #9
	ldr	r1, [r1, #16]
	add	r2, r2, r1
	sub	r2, r2, #2
	sub	r2, r2, r6
	sub	r3, r3, ip
	cmp	r5, #2
	str	lr, [r0, #28]
	str	r8, [r0, #20]
	str	r7, [r0, #24]
	str	r2, [r0, #4]
	str	r3, [r0]
	bne	.L165
.L164:
	str	r5, [r0, #32]
	b	.L145
.L170:
	mov	r8, #10
	mov	r7, #0
	ldr	r1, [r1, #16]
	cmp	r5, #2
	add	r2, r2, r1
	addeq	r3, r3, #9
	addne	r3, r3, #8
	sub	r2, r2, r6
	subeq	ip, r3, ip
	subne	ip, r3, ip
	str	lr, [r0, #28]
	str	r8, [r0, #20]
	str	r7, [r0, #24]
	streq	r5, [r0, #32]
	strne	r4, [r0, #32]
	streq	ip, [r0]
	streq	r2, [r0, #4]
	strne	ip, [r0]
	strne	r2, [r0, #4]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L174:
	mvn	r7, #9
	mov	r1, #0
	sub	r3, r3, #1
	cmp	r5, #2
	str	lr, [r0, #28]
	str	r7, [r0, #20]
	str	r1, [r0, #24]
	sub	ip, r3, ip
	subne	r2, r2, #8
	beq	.L175
.L166:
	sub	r2, r2, r6
	str	r2, [r0, #4]
	str	ip, [r0]
	str	r4, [r0, #32]
	b	.L145
.L172:
	mov	r8, #0
	mov	r7, #10
	ldr	r1, [r1, #20]
	cmp	r5, #2
	add	r3, r3, r1
	str	lr, [r0, #28]
	str	r8, [r0, #20]
	str	r7, [r0, #24]
	sub	ip, r3, ip
	bne	.L166
	sub	r2, r2, #1
	sub	r2, r2, r6
	str	r2, [r0, #4]
	str	ip, [r0]
	str	r5, [r0, #32]
	b	.L145
.L173:
	mvn	r8, #9
	mov	r7, #10
	ldr	r1, [r1, #20]
	cmp	r5, #2
	str	lr, [r0, #28]
	str	r8, [r0, #20]
	str	r7, [r0, #24]
	add	r3, r3, r1
	subeq	r2, r2, #9
	beq	.L167
	sub	r2, r2, #8
	sub	r3, r3, #5
	sub	r2, r2, r6
	sub	ip, r3, ip
	str	r2, [r0, #4]
	str	ip, [r0]
	str	r4, [r0, #32]
	b	.L145
.L175:
	sub	r2, r2, #5
	sub	r2, r2, r6
	str	r2, [r0, #4]
	str	ip, [r0]
	str	r5, [r0, #32]
	b	.L145
.L177:
	.align	2
.L176:
	.word	direction
	.word	player
	.word	weapon
	.word	hOff
	.word	vOff
	.size	orientateBullets, .-orientateBullets
	.align	2
	.global	playerShoot
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerShoot, %function
playerShoot:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L186
	mov	r3, #0
	mov	r2, r0
	push	{r4, lr}
	b	.L181
.L179:
	add	r3, r3, #1
	cmp	r3, #30
	add	r2, r2, #36
	beq	.L180
.L181:
	ldr	r1, [r2, #16]
	cmp	r1, #0
	bne	.L179
	add	r3, r3, r3, lsl #3
	add	r0, r0, r3, lsl #2
	bl	orientateBullets
.L180:
	ldr	r3, .L186+4
	ldr	r3, [r3]
	cmp	r3, #1
	ldreq	r2, .L186+8
	ldrne	r2, .L186+12
	ldr	r3, [r2]
	sub	r3, r3, #1
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L187:
	.align	2
.L186:
	.word	bullets
	.word	weapon
	.word	pistolAmmo
	.word	rifleAmmo
	.size	playerShoot, .-playerShoot
	.align	2
	.global	shadowBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	shadowBullets, %function
shadowBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L194
	push	{r4, lr}
	add	ip, r3, #1072
	ldr	r2, .L194+4
	ldr	r4, .L194+8
	add	ip, ip, #8
.L191:
	ldr	r1, [r3, #16]
	cmp	r1, #0
	ldrsh	r1, [r3]
	ldrne	lr, [r3, #28]
	orr	r0, r1, #256
	ldrne	r1, [r3, #4]
	orreq	r1, r1, #512
	orrne	r1, r1, lr
	add	r3, r3, #36
	strhne	r0, [r2, #128]	@ movhi
	strhne	r4, [r2, #132]	@ movhi
	strhne	r1, [r2, #130]	@ movhi
	strheq	r1, [r2, #128]	@ movhi
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L191
	pop	{r4, lr}
	bx	lr
.L195:
	.align	2
.L194:
	.word	bullets
	.word	shadowOAM
	.word	12318
	.size	shadowBullets, .-shadowBullets
	.align	2
	.global	bulletCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	bulletCollision, %function
bulletCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, .L224
	add	r8, r5, #1072
	ldr	r10, .L224+4
	ldr	r9, .L224+8
	ldr	r7, .L224+12
	sub	sp, sp, #20
	add	r8, r8, #8
	b	.L206
.L197:
	add	r5, r5, #36
	cmp	r5, r8
	beq	.L221
.L206:
	ldr	r3, [r5, #16]
	cmp	r3, #0
	beq	.L197
	ldr	r4, .L224+16
	mov	fp, #0
	add	r6, r4, #680
	b	.L201
.L199:
	add	r4, r4, #68
	cmp	r4, r6
	beq	.L222
.L201:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L199
	mov	r3, #4
	ldr	ip, [r4]
	ldr	r0, [r10]
	ldr	lr, [r4, #4]
	ldr	r2, [r9]
	sub	ip, ip, r0
	sub	r2, lr, r2
	ldr	lr, [r4, #20]
	str	ip, [sp, #4]
	ldr	r1, [r5]
	ldr	ip, [r4, #16]
	ldr	r0, [r5, #4]
	str	r2, [sp]
	str	lr, [sp, #12]
	mov	r2, r3
	str	ip, [sp, #8]
	add	r1, r1, #2
	add	r0, r0, #2
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L199
	ldr	r3, [r5, #32]
	mov	r0, r4
	str	r3, [r4, #64]
	str	fp, [r5, #16]
	ldr	r3, .L224+20
	add	r4, r4, #68
	mov	lr, pc
	bx	r3
	cmp	r4, r6
	bne	.L201
.L222:
	ldr	r4, .L224+24
	ldr	r3, [r4, #52]
	cmp	r3, #0
	add	r6, r4, #340
	bne	.L223
.L203:
	add	r4, r4, #68
	cmp	r4, r6
	beq	.L197
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L203
.L223:
	mov	r3, #4
	ldr	ip, [r4, #16]
	ldr	fp, [r4, #20]
	ldr	lr, [r4]
	str	fp, [sp, #12]
	str	ip, [sp, #8]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	ldr	ip, [r4, #4]
	mov	r2, r3
	stm	sp, {ip, lr}
	add	r1, r1, #2
	add	r0, r0, #2
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L203
	mov	r2, #0
	ldr	r3, [r5, #32]
	mov	r0, r4
	str	r3, [r4, #64]
	str	r2, [r5, #16]
	ldr	r3, .L224+20
	mov	lr, pc
	bx	r3
	b	.L203
.L221:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L225:
	.align	2
.L224:
	.word	bullets
	.word	vOff
	.word	hOff
	.word	collision
	.word	zombies
	.word	decrementZombieHealth
	.word	bosses
	.size	bulletCollision, .-bulletCollision
	.align	2
	.global	updateBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullets, %function
updateBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L235
	push	{r4, lr}
	add	r4, r0, #1072
	add	r4, r4, #8
	b	.L228
.L227:
	add	r0, r0, #36
	cmp	r0, r4
	beq	.L234
.L228:
	ldr	r3, [r0, #16]
	cmp	r3, #0
	beq	.L227
	bl	moveBullets
	add	r0, r0, #36
	cmp	r0, r4
	bne	.L228
.L234:
	pop	{r4, lr}
	b	bulletCollision
.L236:
	.align	2
.L235:
	.word	bullets
	.size	updateBullets, .-updateBullets
	.align	2
	.global	playerCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerCollision, %function
playerCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r3, .L354
	ldrh	r2, [r3, #48]
	tst	r2, #64
	sub	sp, sp, #20
	bne	.L238
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L238
	ldr	r4, .L354+4
	ldr	r5, .L354+8
	ldr	r7, .L354+12
	add	r6, r4, #680
	b	.L240
.L243:
	add	r4, r4, #68
	cmp	r6, r4
	beq	.L340
.L240:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L243
	add	ip, r4, #16
	ldm	ip, {ip, lr}
	add	r2, r5, #16
	sub	lr, lr, #4
	ldm	r2, {r2, r3}
	str	lr, [sp, #12]
	sub	ip, ip, #4
	ldr	lr, [r4]
	str	ip, [sp, #8]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	ldr	ip, [r4, #4]
	sub	r3, r3, #8
	stm	sp, {ip, lr}
	sub	r2, r2, #8
	sub	r1, r1, #1
	add	r0, r0, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L243
.L242:
	mov	r0, #0
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L238:
	ldr	r3, .L354
	ldrh	r2, [r3, #48]
	tst	r2, #128
	bne	.L249
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L249
	ldr	r4, .L354+4
	ldr	r5, .L354+8
	ldr	r7, .L354+12
	add	r6, r4, #680
	b	.L251
.L342:
	add	r4, r4, #68
	cmp	r6, r4
	beq	.L341
.L251:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L342
	add	ip, r4, #16
	ldm	ip, {ip, lr}
	add	r2, r5, #16
	sub	lr, lr, #4
	ldm	r2, {r2, r3}
	str	lr, [sp, #12]
	sub	ip, ip, #4
	ldr	lr, [r4]
	str	ip, [sp, #8]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	ldr	ip, [r4, #4]
	sub	r3, r3, #8
	stm	sp, {ip, lr}
	sub	r2, r2, #8
	add	r1, r1, #1
	add	r0, r0, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L242
	add	r4, r4, #68
	cmp	r6, r4
	bne	.L251
.L341:
	ldr	r4, .L354+16
	ldr	r5, .L354+8
	ldr	r7, .L354+12
	add	r6, r4, #340
.L255:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L254
.L256:
	add	r4, r4, #68
	cmp	r6, r4
	bne	.L255
.L246:
	mov	r0, #1
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L249:
	ldr	r3, .L354
	ldrh	r2, [r3, #48]
	tst	r2, #128
	beq	.L343
.L257:
	ldr	r3, .L354
	ldrh	r2, [r3, #48]
	tst	r2, #64
	bne	.L265
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L265
	ldr	r4, .L354+4
	ldr	r5, .L354+8
	ldr	r7, .L354+12
	add	r6, r4, #680
	b	.L267
.L269:
	add	r4, r4, #68
	cmp	r4, r6
	beq	.L344
.L267:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L269
	add	ip, r4, #16
	ldm	ip, {ip, lr}
	add	r2, r5, #16
	sub	lr, lr, #4
	ldm	r2, {r2, r3}
	str	lr, [sp, #12]
	sub	ip, ip, #4
	ldr	lr, [r4]
	str	ip, [sp, #8]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	ldr	ip, [r4, #4]
	sub	r3, r3, #4
	stm	sp, {ip, lr}
	sub	r2, r2, #4
	sub	r1, r1, #1
	sub	r0, r0, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L269
	b	.L242
.L343:
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L257
	ldr	r4, .L354+4
	ldr	r5, .L354+8
	ldr	r7, .L354+12
	add	r6, r4, #680
	b	.L259
.L346:
	add	r4, r4, #68
	cmp	r6, r4
	beq	.L345
.L259:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L346
	add	ip, r4, #16
	ldm	ip, {ip, lr}
	add	r2, r5, #16
	sub	lr, lr, #4
	ldm	r2, {r2, r3}
	str	lr, [sp, #12]
	sub	ip, ip, #4
	ldr	lr, [r4]
	str	ip, [sp, #8]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	ldr	ip, [r4, #4]
	sub	r3, r3, #8
	stm	sp, {ip, lr}
	sub	r2, r2, #8
	add	r1, r1, #1
	sub	r0, r0, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L242
	add	r4, r4, #68
	cmp	r6, r4
	bne	.L259
.L345:
	ldr	r4, .L354+16
	ldr	r3, [r4, #52]
	cmp	r3, #0
	ldr	r5, .L354+8
	ldr	r7, .L354+12
	add	r6, r4, #340
	bne	.L262
.L264:
	add	r4, r4, #68
	cmp	r6, r4
	beq	.L246
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L264
.L262:
	add	ip, r4, #16
	ldm	ip, {ip, lr}
	add	r2, r5, #16
	sub	lr, lr, #4
	ldm	r2, {r2, r3}
	str	lr, [sp, #12]
	sub	ip, ip, #4
	ldr	lr, [r4]
	str	ip, [sp, #8]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	ldr	ip, [r4, #4]
	sub	r3, r3, #8
	stm	sp, {ip, lr}
	sub	r2, r2, #8
	add	r1, r1, #1
	sub	r0, r0, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L264
	b	.L242
.L265:
	ldr	r3, .L354
	ldrh	r2, [r3, #48]
	tst	r2, #64
	beq	.L347
	ldrh	r2, [r3, #48]
	tst	r2, #16
	bne	.L281
	ldr	r4, .L354+4
	ldr	r5, .L354+8
	ldr	r7, .L354+12
	add	r6, r4, #680
	b	.L283
.L285:
	add	r4, r4, #68
	cmp	r4, r6
	beq	.L348
.L283:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L285
	add	r1, r4, #16
	ldm	r1, {r1, ip}
	add	r2, r5, #16
	sub	ip, ip, #4
	ldm	r2, {r2, r3}
	str	ip, [sp, #12]
	sub	r1, r1, #4
	ldr	ip, [r4]
	str	r1, [sp, #8]
	ldr	r0, [r5, #4]
	ldr	r1, [r4, #4]
	sub	r3, r3, #8
	stm	sp, {r1, ip}
	sub	r2, r2, #8
	ldr	r1, [r5]
	add	r0, r0, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L285
	b	.L242
.L340:
	ldr	r4, .L354+16
	ldr	r3, [r4, #52]
	cmp	r3, #0
	ldr	r5, .L354+8
	ldr	r7, .L354+12
	add	r6, r4, #340
	bne	.L244
.L247:
	add	r4, r4, #68
	cmp	r6, r4
	beq	.L246
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L247
.L244:
	add	ip, r4, #16
	ldm	ip, {ip, lr}
	add	r2, r5, #16
	sub	lr, lr, #4
	ldm	r2, {r2, r3}
	str	lr, [sp, #12]
	sub	ip, ip, #4
	ldr	lr, [r4]
	str	ip, [sp, #8]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	ldr	ip, [r4, #4]
	sub	r3, r3, #8
	stm	sp, {ip, lr}
	sub	r2, r2, #8
	sub	r1, r1, #1
	add	r0, r0, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L247
	b	.L242
.L347:
	ldr	r4, .L354+4
	ldr	r5, .L354+8
	ldr	r7, .L354+12
	add	r6, r4, #680
	b	.L275
.L350:
	add	r4, r4, #68
	cmp	r4, r6
	beq	.L349
.L275:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L350
	add	r0, r4, #16
	ldm	r0, {r0, ip}
	add	r2, r5, #16
	sub	ip, ip, #4
	ldm	r2, {r2, r3}
	str	ip, [sp, #12]
	sub	r0, r0, #4
	ldr	ip, [r4]
	str	r0, [sp, #8]
	ldr	r1, [r5]
	ldr	r0, [r4, #4]
	sub	r3, r3, #8
	stm	sp, {r0, ip}
	sub	r2, r2, #8
	ldr	r0, [r5, #4]
	sub	r1, r1, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L242
	add	r4, r4, #68
	cmp	r4, r6
	bne	.L275
.L349:
	ldr	r4, .L354+16
	ldr	r3, [r4, #52]
	cmp	r3, #0
	ldr	r5, .L354+8
	ldr	r7, .L354+12
	add	r6, r4, #340
	bne	.L278
.L280:
	add	r4, r4, #68
	cmp	r4, r6
	beq	.L246
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L280
.L278:
	add	r0, r4, #16
	ldm	r0, {r0, ip}
	add	r2, r5, #16
	sub	ip, ip, #4
	ldm	r2, {r2, r3}
	str	ip, [sp, #12]
	sub	r0, r0, #4
	ldr	ip, [r4]
	str	r0, [sp, #8]
	ldr	r1, [r5]
	ldr	r0, [r4, #4]
	sub	r3, r3, #8
	stm	sp, {r0, ip}
	sub	r2, r2, #8
	ldr	r0, [r5, #4]
	sub	r1, r1, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L280
	b	.L242
.L254:
	add	ip, r4, #16
	ldm	ip, {ip, lr}
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	str	lr, [sp, #12]
	ldr	lr, [r4]
	str	ip, [sp, #8]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	ldr	ip, [r4, #4]
	sub	r3, r3, #8
	stm	sp, {ip, lr}
	sub	r2, r2, #8
	add	r1, r1, #1
	add	r0, r0, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L256
	b	.L242
.L344:
	ldr	r4, .L354+16
	ldr	r3, [r4, #52]
	cmp	r3, #0
	ldr	r5, .L354+8
	ldr	r7, .L354+12
	add	r6, r4, #340
	bne	.L270
.L272:
	add	r4, r4, #68
	cmp	r4, r6
	beq	.L246
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L272
.L270:
	add	ip, r4, #16
	ldm	ip, {ip, lr}
	add	r2, r5, #16
	sub	lr, lr, #4
	ldm	r2, {r2, r3}
	str	lr, [sp, #12]
	sub	ip, ip, #4
	ldr	lr, [r4]
	str	ip, [sp, #8]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	ldr	ip, [r4, #4]
	sub	r3, r3, #4
	stm	sp, {ip, lr}
	sub	r2, r2, #4
	sub	r1, r1, #1
	sub	r0, r0, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L272
	b	.L242
.L281:
	ldrh	r2, [r3, #48]
	tst	r2, #128
	beq	.L351
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L246
	ldr	r4, .L354+4
	ldr	r5, .L354+8
	ldr	r7, .L354+12
	add	r6, r4, #680
	b	.L298
.L300:
	add	r4, r4, #68
	cmp	r4, r6
	beq	.L352
.L298:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L300
	add	r1, r4, #16
	ldm	r1, {r1, ip}
	add	r2, r5, #16
	sub	ip, ip, #4
	ldm	r2, {r2, r3}
	str	ip, [sp, #12]
	sub	r1, r1, #4
	ldr	ip, [r4]
	str	r1, [sp, #8]
	ldr	r0, [r5, #4]
	ldr	r1, [r4, #4]
	sub	r3, r3, #4
	stm	sp, {r1, ip}
	sub	r2, r2, #4
	ldr	r1, [r5]
	sub	r0, r0, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L300
	b	.L242
.L348:
	ldr	r4, .L354+16
	ldr	r3, [r4, #52]
	cmp	r3, #0
	ldr	r5, .L354+8
	ldr	r7, .L354+12
	add	r6, r4, #340
	bne	.L286
.L288:
	add	r4, r4, #68
	cmp	r4, r6
	beq	.L246
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L288
.L286:
	add	r1, r4, #16
	ldm	r1, {r1, ip}
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	str	ip, [sp, #12]
	ldr	ip, [r4]
	str	r1, [sp, #8]
	ldr	r0, [r5, #4]
	ldr	r1, [r4, #4]
	sub	r3, r3, #8
	stm	sp, {r1, ip}
	sub	r2, r2, #8
	ldr	r1, [r5]
	add	r0, r0, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L288
	b	.L242
.L351:
	ldr	r4, .L354+4
	ldr	r5, .L354+8
	ldr	r7, .L354+12
	add	r6, r4, #680
	b	.L291
.L293:
	add	r4, r4, #68
	cmp	r4, r6
	beq	.L353
.L291:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L293
	add	r0, r4, #16
	ldm	r0, {r0, ip}
	add	r2, r5, #16
	sub	ip, ip, #4
	ldm	r2, {r2, r3}
	str	ip, [sp, #12]
	sub	r0, r0, #4
	ldr	ip, [r4]
	str	r0, [sp, #8]
	ldr	r1, [r5]
	ldr	r0, [r4, #4]
	sub	r3, r3, #8
	stm	sp, {r0, ip}
	sub	r2, r2, #8
	ldr	r0, [r5, #4]
	add	r1, r1, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L293
	b	.L242
.L353:
	ldr	r4, .L354+16
	ldr	r5, .L354+8
	ldr	r7, .L354+12
	add	r6, r4, #340
.L295:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L294
.L296:
	add	r4, r4, #68
	cmp	r4, r6
	bne	.L295
	b	.L246
.L294:
	add	r0, r4, #16
	ldm	r0, {r0, ip}
	add	r2, r5, #16
	sub	ip, ip, #4
	ldm	r2, {r2, r3}
	str	ip, [sp, #12]
	sub	r0, r0, #4
	ldr	ip, [r4]
	str	r0, [sp, #8]
	ldr	r1, [r5]
	ldr	r0, [r4, #4]
	sub	r3, r3, #8
	stm	sp, {r0, ip}
	sub	r2, r2, #8
	ldr	r0, [r5, #4]
	add	r1, r1, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L296
	b	.L242
.L352:
	ldr	r4, .L354+16
	ldr	r5, .L354+8
	ldr	r7, .L354+12
	add	r6, r4, #340
.L302:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L301
.L303:
	add	r4, r4, #68
	cmp	r4, r6
	bne	.L302
	b	.L246
.L301:
	add	r1, r4, #16
	ldm	r1, {r1, ip}
	add	r2, r5, #16
	sub	ip, ip, #4
	ldm	r2, {r2, r3}
	str	ip, [sp, #12]
	sub	r1, r1, #4
	ldr	ip, [r4]
	str	r1, [sp, #8]
	ldr	r0, [r5, #4]
	ldr	r1, [r4, #4]
	sub	r3, r3, #4
	stm	sp, {r1, ip}
	sub	r2, r2, #4
	ldr	r1, [r5]
	sub	r0, r0, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L303
	b	.L242
.L355:
	.align	2
.L354:
	.word	67109120
	.word	zombies
	.word	player
	.word	collision
	.word	bosses
	.size	playerCollision, .-playerCollision
	.align	2
	.global	screenOffset
	.syntax unified
	.arm
	.fpu softvfp
	.type	screenOffset, %function
screenOffset:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L362
	ldrh	r3, [r3, #48]
	tst	r3, #64
	bne	.L357
	ldr	r1, .L362+4
	ldr	r3, [r1]
	cmp	r3, #0
	ble	.L357
	ldr	r0, .L362+8
	ldr	r2, [r0]
	sub	r2, r2, r3
	cmp	r2, #80
	ldrle	r2, [r0, #8]
	suble	r3, r3, r2
	strle	r3, [r1]
.L357:
	ldr	r3, .L362
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L358
	ldr	r2, .L362+4
	ldr	r3, [r2]
	cmp	r3, #352
	blt	.L361
.L358:
	ldr	r3, .L362
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L359
	ldr	r1, .L362+12
	ldr	r3, [r1]
	cmp	r3, #0
	ble	.L359
	ldr	r0, .L362+8
	ldr	r2, [r0, #4]
	sub	r2, r2, r3
	cmp	r2, #120
	ldrle	r2, [r0, #12]
	suble	r3, r3, r2
	strle	r3, [r1]
.L359:
	ldr	r3, .L362
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bxne	lr
	ldr	r2, .L362+12
	ldr	r3, [r2]
	cmp	r3, #272
	bxge	lr
	ldr	r0, .L362+8
	ldr	r1, [r0, #4]
	sub	r1, r1, r3
	cmp	r1, #119
	ldrgt	r1, [r0, #12]
	addgt	r3, r1, r3
	strgt	r3, [r2]
	bx	lr
.L361:
	ldr	r0, .L362+8
	ldr	r1, [r0]
	sub	r1, r1, r3
	cmp	r1, #79
	ldrgt	r1, [r0, #8]
	addgt	r3, r1, r3
	strgt	r3, [r2]
	b	.L358
.L363:
	.align	2
.L362:
	.word	67109120
	.word	vOff
	.word	player
	.word	hOff
	.size	screenOffset, .-screenOffset
	.align	2
	.global	movePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	movePlayer, %function
movePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L432
	ldrh	r2, [r3, #48]
	tst	r2, #64
	sub	sp, sp, #16
	bne	.L365
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L425
.L365:
	ldr	r3, .L432
	ldrh	r2, [r3, #48]
	tst	r2, #128
	bne	.L370
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L426
.L370:
	ldr	r3, .L432
	ldrh	r2, [r3, #48]
	tst	r2, #64
	bne	.L374
	ldrh	r3, [r3, #48]
	tst	r3, #32
	beq	.L427
.L374:
	ldr	r3, .L432
	ldrh	r2, [r3, #48]
	tst	r2, #128
	beq	.L428
.L378:
	ldr	r2, .L432
	ldrh	r3, [r2, #48]
	ands	r6, r3, #64
	beq	.L429
	ldrh	r3, [r2, #48]
	ands	r6, r3, #16
	beq	.L430
	ldrh	r3, [r2, #48]
	ands	r6, r3, #128
	beq	.L431
	ldrh	r3, [r2, #48]
	ands	r6, r3, #32
	beq	.L423
	ldr	r4, .L432+4
	ldr	r5, .L432+8
	b	.L369
.L428:
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L378
	bl	playerCollision
	cmp	r0, #0
	ldr	r4, .L432+4
	bne	.L379
	ldr	r5, .L432+8
.L380:
	bl	screenOffset
	mov	r2, #2560
	ldr	r3, .L432+12
	strh	r2, [r3]	@ movhi
	b	.L369
.L425:
	bl	playerCollision
	cmp	r0, #0
	ldr	r4, .L432+4
	bne	.L366
	ldr	r5, .L432+8
.L367:
	bl	screenOffset
	mov	r2, #512
	ldr	r3, .L432+12
	strh	r2, [r3]	@ movhi
.L369:
	ldr	r2, [r4, #20]
	ldr	r0, [r4]
	ldr	r3, [r5, #4]
	add	r1, r2, r2, lsr #31
	ldr	r2, [r4, #16]
	add	r1, r0, r1, asr #1
	add	r2, r2, r2, lsr #31
	add	r3, r3, r1, lsl #9
	ldr	r1, [r4, #4]
	add	r3, r3, r2, asr #1
	ldrb	r3, [r3, r1]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r2, .L432+16
	streq	r3, [r2]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L426:
	bl	playerCollision
	cmp	r0, #0
	ldr	r4, .L432+4
	ldr	r5, .L432+8
	bne	.L371
.L372:
	bl	screenOffset
	mov	r2, #1536
	ldr	r3, .L432+12
	strh	r2, [r3]	@ movhi
	b	.L369
.L427:
	bl	playerCollision
	cmp	r0, #0
	ldr	r4, .L432+4
	bne	.L375
	ldr	r5, .L432+8
.L376:
	bl	screenOffset
	mov	r2, #3584
	ldr	r3, .L432+12
	strh	r2, [r3]	@ movhi
	b	.L369
.L431:
	bl	playerCollision
	cmp	r0, #0
	ldr	r4, .L432+4
	ldr	r5, .L432+8
	bne	.L391
.L392:
	bl	screenOffset
	mov	r2, #2048
	ldr	r3, .L432+12
	strh	r2, [r3]	@ movhi
	b	.L369
.L429:
	bl	playerCollision
	cmp	r0, #0
	ldr	r4, .L432+4
	bne	.L383
	ldr	r5, .L432+8
.L384:
	bl	screenOffset
	mov	r2, #0
	ldr	r3, .L432+12
	strh	r2, [r3]	@ movhi
	b	.L369
.L430:
	bl	playerCollision
	cmp	r0, #0
	ldr	r4, .L432+4
	ldr	r5, .L432+8
	bne	.L387
.L388:
	bl	screenOffset
	mov	r2, #1024
	ldr	r3, .L432+12
	strh	r2, [r3]	@ movhi
	b	.L369
.L366:
	ldr	r3, [r4, #8]
	ldr	r0, [r4, #12]
	ldr	r1, [r4, #20]
	ldr	r2, [r4, #16]
	ldr	r5, .L432+8
	rsb	r3, r3, #0
	str	r3, [sp, #12]
	str	r0, [sp, #8]
	str	r1, [sp, #4]
	str	r2, [sp]
	mov	r1, #512
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	ldr	r0, [r5, #4]
	ldr	r6, .L432+20
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L367
	ldr	r2, [r4]
	ldr	r3, [r4, #4]
	ldr	r0, [r4, #8]
	ldr	r1, [r4, #12]
	sub	r2, r2, r0
	add	r3, r3, r1
	stm	r4, {r2, r3}
	b	.L367
.L383:
	ldr	r3, [r4, #8]
	ldr	r1, [r4, #20]
	ldr	r2, [r4, #16]
	ldr	r5, .L432+8
	rsb	r3, r3, #0
	str	r6, [sp, #8]
	str	r3, [sp, #12]
	str	r1, [sp, #4]
	ldr	r3, [r4]
	str	r2, [sp]
	mov	r1, #512
	ldr	r2, [r4, #4]
	ldr	r0, [r5, #4]
	ldr	r6, .L432+20
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldrne	r3, [r4]
	ldrne	r2, [r4, #8]
	subne	r3, r3, r2
	strne	r3, [r4]
	b	.L384
.L391:
	ldr	r1, [r4, #8]
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #16]
	str	r6, [sp, #8]
	str	r1, [sp, #12]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	mov	r1, #512
	ldr	r0, [r5, #4]
	ldr	r6, .L432+20
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldrne	r3, [r4]
	ldrne	r2, [r4, #8]
	addne	r3, r3, r2
	strne	r3, [r4]
	b	.L392
.L423:
	bl	playerCollision
	cmp	r0, #0
	ldr	r4, .L432+4
	bne	.L394
	ldr	r5, .L432+8
.L395:
	bl	screenOffset
	mov	r2, #3072
	ldr	r3, .L432+12
	strh	r2, [r3]	@ movhi
	b	.L369
.L371:
	add	r0, r4, #8
	ldm	r0, {r0, r1}
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #16]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	mov	r1, #512
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	ldr	r0, [r5, #4]
	ldr	r6, .L432+20
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L372
	ldr	r2, [r4]
	ldr	r3, [r4, #4]
	ldr	r0, [r4, #8]
	ldr	r1, [r4, #12]
	add	r2, r2, r0
	add	r3, r3, r1
	stm	r4, {r2, r3}
	b	.L372
.L375:
	add	r2, r4, #8
	ldm	r2, {r2, r3}
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	ldr	r5, .L432+8
	rsb	r2, r2, #0
	rsb	r3, r3, #0
	stmib	sp, {r0, r3}
	str	r2, [sp, #12]
	str	r1, [sp]
	ldr	r3, [r4]
	mov	r1, #512
	ldr	r2, [r4, #4]
	ldr	r0, [r5, #4]
	ldr	r6, .L432+20
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L376
	ldr	r2, [r4]
	ldr	r3, [r4, #4]
	ldr	r0, [r4, #8]
	ldr	r1, [r4, #12]
	sub	r2, r2, r0
	sub	r3, r3, r1
	stm	r4, {r2, r3}
	b	.L376
.L387:
	ldr	r1, [r4, #12]
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #16]
	str	r6, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	mov	r1, #512
	ldr	r0, [r5, #4]
	ldr	r6, .L432+20
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldrne	r3, [r4, #4]
	ldrne	r2, [r4, #12]
	addne	r3, r3, r2
	strne	r3, [r4, #4]
	b	.L388
.L379:
	add	r0, r4, #8
	ldm	r0, {r0, r3}
	ldr	r1, [r4, #20]
	ldr	r2, [r4, #16]
	ldr	r5, .L432+8
	rsb	r3, r3, #0
	str	r3, [sp, #8]
	str	r0, [sp, #12]
	str	r1, [sp, #4]
	str	r2, [sp]
	mov	r1, #512
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	ldr	r0, [r5, #4]
	ldr	r6, .L432+20
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L380
	ldr	r2, [r4]
	ldr	r3, [r4, #4]
	ldr	r0, [r4, #8]
	ldr	r1, [r4, #12]
	add	r2, r2, r0
	sub	r3, r3, r1
	stm	r4, {r2, r3}
	b	.L380
.L394:
	ldr	r3, [r4, #12]
	ldr	r1, [r4, #20]
	ldr	r2, [r4, #16]
	ldr	r5, .L432+8
	rsb	r3, r3, #0
	stmib	sp, {r1, r3, r6}
	str	r2, [sp]
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	mov	r1, #512
	ldr	r0, [r5, #4]
	ldr	r6, .L432+20
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldrne	r3, [r4, #4]
	ldrne	r2, [r4, #12]
	subne	r3, r3, r2
	strne	r3, [r4, #4]
	b	.L395
.L433:
	.align	2
.L432:
	.word	67109120
	.word	player
	.word	.LANCHOR0
	.word	direction
	.word	lost
	.word	collisionCheck
	.size	movePlayer, .-movePlayer
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L496
	ldrh	r3, [r4]
	tst	r3, #1
	beq	.L435
	ldr	r2, .L496+4
	ldrh	r2, [r2]
	ands	r2, r2, #1
	beq	.L488
.L435:
	tst	r3, #2
	beq	.L439
	ldr	r2, .L496+4
	ldrh	r2, [r2]
	ands	r2, r2, #2
	beq	.L489
.L439:
	tst	r3, #512
	beq	.L440
	ldr	r2, .L496+4
	ldrh	r2, [r2]
	tst	r2, #512
	beq	.L490
.L440:
	tst	r3, #256
	beq	.L441
	ldr	r3, .L496+4
	ldrh	r2, [r3]
	ands	r4, r2, #256
	bne	.L441
	ldr	r3, .L496+8
	ldr	r2, [r3, #48]
	cmp	r2, #1
	beq	.L441
	ldr	r3, [r3, #52]
	cmp	r3, #1
	beq	.L441
	ldr	r3, .L496+12
	ldr	r3, [r3]
	sub	r2, r3, #1
	cmp	r2, #1
	bls	.L491
.L441:
	bl	movePlayer
	bl	playerState
	bl	playerReload
	bl	playerMelee
	pop	{r4, lr}
	b	healthRegen
.L490:
	ldr	r2, .L496+8
	ldr	r1, [r2, #48]
	cmp	r1, #1
	beq	.L440
	ldr	r2, [r2, #52]
	cmp	r2, #1
	beq	.L440
	bl	changeWeapon
	ldrh	r3, [r4]
	b	.L440
.L489:
	ldr	r1, .L496+8
	ldr	r0, [r1, #48]
	cmp	r0, #1
	beq	.L439
	ldr	r0, [r1, #52]
	cmp	r0, #1
	beq	.L439
	mov	r0, #1
	ldr	ip, .L496+16
	ldr	ip, [ip]
	cmp	ip, #0
	str	r2, [r1, #36]
	str	r0, [r1, #52]
	str	r0, [r1, #24]
	beq	.L439
	ldr	r3, .L496+20
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L439
.L488:
	ldr	ip, .L496+8
	ldr	r1, [ip, #52]
	cmp	r1, #1
	beq	.L435
	ldr	r1, [ip, #48]
	cmp	r1, #1
	beq	.L435
	ldr	r1, .L496+12
	ldr	r0, [r1]
	cmp	r0, #0
	beq	.L435
	cmp	r0, #1
	beq	.L492
	ldr	r3, .L496+24
	ldr	r3, [r3]
	cmp	r3, #29
	bgt	.L438
	ldr	r3, .L496+28
	ldr	r3, [r3]
	cmp	r3, #0
	bgt	.L493
.L438:
	ldr	r3, .L496+32
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L496+36
	ldr	r3, .L496+40
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L435
.L491:
	cmp	r3, #1
	beq	.L494
	ldr	r3, .L496+24
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L444
	bl	playerShoot
	ldr	r3, .L496+44
	mov	r2, r4
	ldr	r1, [r3]
	ldr	r0, .L496+48
	ldr	r3, .L496+40
	mov	lr, pc
	bx	r3
	b	.L441
.L492:
	ldr	r3, .L496+52
	ldr	r3, [r3]
	cmp	r3, #11
	bgt	.L437
	ldr	r3, .L496+56
	ldr	r3, [r3]
	cmp	r3, #0
	bgt	.L495
.L437:
	ldr	r3, .L496+60
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L496+64
	ldr	r3, .L496+40
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L435
.L494:
	ldr	r3, .L496+52
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L443
	bl	playerShoot
	ldr	r3, .L496+68
	mov	r2, r4
	ldr	r1, [r3]
	ldr	r0, .L496+72
	ldr	r3, .L496+40
	mov	lr, pc
	bx	r3
	b	.L441
.L444:
	ldr	r3, .L496+32
	mov	r2, r4
	ldr	r1, [r3]
	ldr	r0, .L496+36
	ldr	r3, .L496+40
	mov	lr, pc
	bx	r3
	b	.L441
.L493:
	mov	r3, #1
	ldr	r1, .L496+76
	str	r3, [ip, #48]
	str	r3, [ip, #24]
	ldr	r1, [r1]
	ldr	r3, .L496+40
	ldr	r0, .L496+80
	str	r2, [ip, #36]
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L435
.L443:
	ldr	r3, .L496+60
	mov	r2, r4
	ldr	r1, [r3]
	ldr	r0, .L496+64
	ldr	r3, .L496+40
	mov	lr, pc
	bx	r3
	b	.L441
.L495:
	ldr	r3, .L496+84
	str	r0, [ip, #48]
	ldr	r1, [r3]
	str	r0, [ip, #24]
	ldr	r3, .L496+40
	ldr	r0, .L496+88
	str	r2, [ip, #36]
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L435
.L497:
	.align	2
.L496:
	.word	oldButtons
	.word	buttons
	.word	player
	.word	weapon
	.word	cheat
	.word	destroyZombies
	.word	rifleAmmo
	.word	rifleStockPile
	.word	rifleClick_length
	.word	rifleClick_data
	.word	playSoundB
	.word	rifleShot_length
	.word	rifleShot_data
	.word	pistolAmmo
	.word	pistolStockPile
	.word	pistolClick_length
	.word	pistolClick_data
	.word	pistolFire_length
	.word	pistolFire_data
	.word	rifleReload_length
	.word	rifleReload_data
	.word	pistolReload_length
	.word	pistolReload_data
	.size	updatePlayer, .-updatePlayer
	.global	collisionMap
	.global	rifleRow
	.global	rifleCol
	.global	pistolRow
	.global	pistolCol
	.comm	rifleActive,4,4
	.comm	pistolActive,4,4
	.comm	rifleFound,4,4
	.comm	pistolFound,4,4
	.comm	rifleStockPile,4,4
	.comm	rifleAmmo,4,4
	.comm	pistolStockPile,4,4
	.comm	pistolAmmo,4,4
	.comm	rifleUnlocked,4,4
	.comm	pistolUnlocked,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	weapon,4,4
	.global	frames
	.comm	direction,2,2
	.comm	bullets,1080,4
	.comm	player,68,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	frames, %object
	.size	frames, 4
frames:
	.word	20
	.type	collisionMap, %object
	.size	collisionMap, 4
collisionMap:
	.word	collisionMapBitmap
	.type	rifleRow, %object
	.size	rifleRow, 4
rifleRow:
	.word	72
	.type	rifleCol, %object
	.size	rifleCol, 4
rifleCol:
	.word	336
	.type	pistolRow, %object
	.size	pistolRow, 4
pistolRow:
	.word	55
	.type	pistolCol, %object
	.size	pistolCol, 4
pistolCol:
	.word	120
	.ident	"GCC: (devkitARM release 53) 9.1.0"
