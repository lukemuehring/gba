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
	.global	goToMenu
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToMenu, %function
goToMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #4608
	mov	r5, #67108864
	ldr	r3, .L4
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L4+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+12
	mov	r2, #100663296
	ldr	r1, .L4+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L4+20
	ldr	r1, .L4+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #6528
	mov	r6, #0
	ldr	ip, .L4+28
	strh	r3, [r5, #10]	@ movhi
	ldr	r2, .L4+32
	mov	r3, #256
	ldr	r1, .L4+36
	mov	r0, #3
	str	r6, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L4+40
	ldr	r1, .L4+44
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r0, #272
	ldr	r2, .L4+48
	ldr	r5, .L4+52
	ldr	r1, .L4+56
	str	r6, [r2]
	ldr	r3, .L4+60
	ldr	r2, .L4+64
	str	r6, [r3]
	strh	r0, [r5, #196]	@ movhi
	strh	r1, [r5, #192]	@ movhi
	strh	r2, [r5, #194]	@ movhi
	ldr	r3, .L4+68
	mov	lr, pc
	bx	r3
	mov	r1, r5
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r4, .L4+72
	mov	r3, #1
	ldr	r2, .L4+76
	ldr	r1, .L4+80
	ldr	r0, .L4+84
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	hideSprites
	.word	DMANow
	.word	welcomePal
	.word	16224
	.word	welcomeTiles
	.word	100714496
	.word	welcomeMap
	.word	state
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	mainTime
	.word	shadowOAM
	.word	16480
	.word	highScore
	.word	-16296
	.word	waitForVBlank
	.word	playSoundB
	.word	11025
	.word	724937
	.word	MenuSong
	.size	goToMenu, .-goToMenu
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
	push	{r4, lr}
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToMenu
.L9:
	.align	2
.L8:
	.word	setupSounds
	.word	setupSoundInterrupts
	.size	initialize, .-initialize
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L12
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	mov	r2, #4608
	ldr	r4, .L12+4
	strh	r2, [r5]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L12+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #3424
	mov	r2, #100663296
	ldr	r1, .L12+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r1, .L12+16
	mov	r0, #3
	mov	r3, #1024
	ldr	r2, .L12+20
	mov	lr, pc
	bx	r4
	mov	r2, #5248
	ldr	r3, .L12+24
	strh	r2, [r5, #10]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r0, #1
	mov	r2, #0
	ldr	r1, .L12+28
	ldr	r3, .L12+32
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	waitForVBlank
	.word	DMANow
	.word	instructionsPal
	.word	instructionsTiles
	.word	instructionsMap
	.word	100704256
	.word	initInstructions
	.word	state
	.word	seed
	.size	goToStart, .-goToStart
	.align	2
	.global	menu
	.syntax unified
	.arm
	.fpu softvfp
	.type	menu, %function
menu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L22
	ldr	r2, [r0]
	ldr	r3, .L22+4
	add	r2, r2, #1
	smull	ip, r1, r3, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #3
	add	r3, r3, r3, lsl #1
	add	r3, r3, r3, lsl #3
	cmp	r2, r3
	push	{r4, lr}
	str	r2, [r0]
	ldreq	r2, .L22+8
	ldrheq	r3, [r2, #192]
	eoreq	r3, r3, #512
	strheq	r3, [r2, #192]	@ movhi
	ldr	r3, .L22+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L16
	ldr	r3, .L22+16
	ldrh	r3, [r3]
	ands	r4, r3, #8
	beq	.L21
.L16:
	ldr	r3, .L22+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L22+24
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L22+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L21:
	bl	goToStart
	mov	r3, r4
	ldr	r2, .L22+28
	ldr	r1, .L22+32
	ldr	r0, .L22+36
	ldr	r4, .L22+40
	mov	lr, pc
	bx	r4
	mov	r3, #1
	ldr	r2, .L22+28
	ldr	r1, .L22+44
	ldr	r0, .L22+48
	ldr	r4, .L22+52
	mov	lr, pc
	bx	r4
	mov	r2, #512
	ldr	r3, .L22+8
	strh	r2, [r3, #192]	@ movhi
	b	.L16
.L23:
	.align	2
.L22:
	.word	mainTime
	.word	1272582903
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	DMANow
	.word	11025
	.word	13009
	.word	StartSFX
	.word	playSoundA
	.word	2335780
	.word	InstructionsSong
	.word	playSoundB
	.size	menu, .-menu
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
	push	{r4, r5, r6, lr}
	ldr	r3, .L26
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	mov	r2, #6400
	ldr	r4, .L26+4
	strh	r2, [r5]	@ movhi
	mov	r3, #4608
	mov	r2, #100663296
	ldr	r1, .L26+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L26+12
	ldr	r1, .L26+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L26+20
	mov	r3, #256
	strh	r2, [r5, #8]	@ movhi
	ldr	r1, .L26+24
	mov	r2, #83886080
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2912
	ldr	r2, .L26+28
	ldr	r1, .L26+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L26+36
	ldr	r1, .L26+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r1, .L26+44
	ldr	r3, .L26+48
	strh	r1, [r5, #14]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	waitForVBlank
	.word	DMANow
	.word	gameBG1Tiles
	.word	100673536
	.word	gameBG1Map
	.word	17792
	.word	gameBG3Pal
	.word	100712448
	.word	gameBG3Tiles
	.word	100679680
	.word	gameBG3Map
	.word	18575
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
	push	{r4, lr}
	ldr	r4, .L35
	ldr	r3, [r4]
	ldr	r2, .L35+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L35+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L28
	ldr	r3, .L35+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L34
.L28:
	pop	{r4, lr}
	bx	lr
.L34:
	ldr	r0, [r4]
	ldr	r3, .L35+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L35+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L35+24
	mov	r3, #1
	ldr	r2, .L35+28
	ldr	r1, .L35+32
	ldr	r0, .L35+36
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	goToGame
.L36:
	.align	2
.L35:
	.word	seed
	.word	updateInstructions
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	initGame
	.word	playSoundB
	.word	11025
	.word	1038906
	.word	GameSong
	.size	start, .-start
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
	ldr	r3, .L39
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	mov	r2, #512
	ldr	r4, .L39+4
	strh	r2, [r5]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L39+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L39+12
	mov	r2, #100663296
	ldr	r1, .L39+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L39+20
	ldr	r1, .L39+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #6528
	mov	r2, #3
	ldr	r3, .L39+28
	strh	r1, [r5, #10]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	waitForVBlank
	.word	DMANow
	.word	pausePal
	.word	19232
	.word	pauseTiles
	.word	100714496
	.word	pauseMap
	.word	state
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
	ldr	r3, .L53
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L53+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L42
	ldr	r2, .L53+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L51
.L42:
	tst	r3, #4
	beq	.L41
	ldr	r3, .L53+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L52
.L41:
	pop	{r4, lr}
	bx	lr
.L51:
	ldr	r3, .L53+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L52:
	ldr	r3, .L53+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L53+20
	mov	r3, #1
	ldr	r2, .L53+24
	ldr	r1, .L53+28
	ldr	r0, .L53+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	goToMenu
.L54:
	.align	2
.L53:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	unpauseSound
	.word	stopSound
	.word	playSoundB
	.word	11025
	.word	724937
	.word	MenuSong
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
	push	{r4, r5, r6, lr}
	mov	r5, #67108864
	ldr	r3, .L57
	mov	lr, pc
	bx	r3
	ldr	r2, .L57+4
	ldr	r4, .L57+8
	strh	r2, [r5]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L57+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L57+16
	mov	r2, #100663296
	ldr	r1, .L57+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r3, #1024
	ldr	r2, .L57+24
	ldr	r1, .L57+28
	mov	lr, pc
	bx	r4
	mov	r3, #7808
	mov	r1, #4
	ldr	r2, .L57+32
	strh	r3, [r5, #10]	@ movhi
	ldr	r3, .L57+36
	str	r1, [r2]
	ldr	r4, .L57+40
	mov	lr, pc
	bx	r3
	mov	r3, #1
	ldr	r2, .L57+44
	ldr	r1, .L57+48
	ldr	r0, .L57+52
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L58:
	.align	2
.L57:
	.word	waitForVBlank
	.word	513
	.word	DMANow
	.word	losePal
	.word	15712
	.word	loseTiles
	.word	100724736
	.word	loseMap
	.word	state
	.word	stopSound
	.word	playSoundB
	.word	11025
	.word	2116997
	.word	LoseSong
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
	ldr	r3, .L68
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L68+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L60
	ldr	r3, .L68+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L67
.L60:
	ldr	r3, .L68+12
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L59
	ldr	r3, .L68+16
	ldr	r2, .L68+20
	ldr	r1, [r3]
	ldr	r2, [r2]
	pop	{r4, lr}
	cmp	r1, r2
	strlt	r2, [r3]
	b	goToLose
.L59:
	pop	{r4, lr}
	bx	lr
.L67:
	ldr	r3, .L68+24
	mov	lr, pc
	bx	r3
	bl	goToPause
	b	.L60
.L69:
	.align	2
.L68:
	.word	updateGame
	.word	oldButtons
	.word	buttons
	.word	hasLost
	.word	highScore
	.word	cycleTime
	.word	pauseSound
	.size	game, .-game
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
	ldr	r3, .L85
	mov	lr, pc
	bx	r3
	ldr	fp, .L85+4
	ldr	r3, .L85+8
	ldr	r6, .L85+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L85+16
	mov	lr, pc
	bx	r3
	ldr	r5, .L85+20
	ldr	r10, .L85+24
	ldrh	r1, [fp]
	ldr	r2, [r6]
	ldr	r9, .L85+28
	ldr	r8, .L85+32
	ldr	r7, .L85+36
	ldr	r4, .L85+40
.L71:
	strh	r1, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L82
.L75:
	.word	.L79
	.word	.L78
	.word	.L77
	.word	.L76
	.word	.L74
.L76:
	mov	lr, pc
	bx	r7
	ldrh	r1, [fp]
	ldr	r2, [r6]
	b	.L71
.L77:
	mov	lr, pc
	bx	r8
	ldrh	r1, [fp]
	ldr	r2, [r6]
	b	.L71
.L78:
	mov	lr, pc
	bx	r9
	ldrh	r1, [fp]
	ldr	r2, [r6]
	b	.L71
.L79:
	mov	lr, pc
	bx	r10
	ldrh	r1, [fp]
	ldr	r2, [r6]
	b	.L71
.L81:
	strh	r3, [r5]	@ movhi
	ldrh	r2, [r4, #48]
	mov	r1, r3
	mov	r3, r2
	strh	r2, [fp]	@ movhi
.L74:
	tst	r1, #8
	beq	.L81
	tst	r3, #8
	bne	.L81
	ldr	r3, .L85+16
	mov	lr, pc
	bx	r3
	ldrh	r1, [fp]
	ldr	r2, [r6]
	b	.L71
.L82:
	mov	r1, r3
	b	.L71
.L86:
	.align	2
.L85:
	.word	setupSounds
	.word	buttons
	.word	setupSoundInterrupts
	.word	state
	.word	goToMenu
	.word	oldButtons
	.word	menu
	.word	start
	.word	game
	.word	pause
	.word	67109120
	.size	main, .-main
	.text
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
	@ link register save eliminated.
	ldr	r3, .L92
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L92+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToMenu
.L93:
	.align	2
.L92:
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.comm	highScore,4,4
	.comm	mainTime,4,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	shadowOAM,1024,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
