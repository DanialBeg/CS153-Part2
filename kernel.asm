
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:
8010000c:	0f 20 e0             	mov    %cr4,%eax
8010000f:	83 c8 10             	or     $0x10,%eax
80100012:	0f 22 e0             	mov    %eax,%cr4
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
8010001a:	0f 22 d8             	mov    %eax,%cr3
8010001d:	0f 20 c0             	mov    %cr0,%eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
80100025:	0f 22 c0             	mov    %eax,%cr0
80100028:	bc c0 b5 10 80       	mov    $0x8010b5c0,%esp
8010002d:	b8 50 2e 10 80       	mov    $0x80102e50,%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx
80100044:	bb f4 b5 10 80       	mov    $0x8010b5f4,%ebx
80100049:	83 ec 0c             	sub    $0xc,%esp
8010004c:	68 20 70 10 80       	push   $0x80107020
80100051:	68 c0 b5 10 80       	push   $0x8010b5c0
80100056:	e8 35 41 00 00       	call   80104190 <initlock>
8010005b:	c7 05 0c fd 10 80 bc 	movl   $0x8010fcbc,0x8010fd0c
80100062:	fc 10 80 
80100065:	c7 05 10 fd 10 80 bc 	movl   $0x8010fcbc,0x8010fd10
8010006c:	fc 10 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba bc fc 10 80       	mov    $0x8010fcbc,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
8010008b:	c7 43 50 bc fc 10 80 	movl   $0x8010fcbc,0x50(%ebx)
80100092:	68 27 70 10 80       	push   $0x80107027
80100097:	50                   	push   %eax
80100098:	e8 e3 3f 00 00       	call   80104080 <initsleeplock>
8010009d:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
801000b0:	89 1d 10 fd 10 80    	mov    %ebx,0x8010fd10
801000b6:	3d bc fc 10 80       	cmp    $0x8010fcbc,%eax
801000bb:	75 c3                	jne    80100080 <binit+0x40>
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
801000df:	68 c0 b5 10 80       	push   $0x8010b5c0
801000e4:	e8 a7 41 00 00       	call   80104290 <acquire>
801000e9:	8b 1d 10 fd 10 80    	mov    0x8010fd10,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100120:	8b 1d 0c fd 10 80    	mov    0x8010fd0c,%ebx
80100126:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 c0 b5 10 80       	push   $0x8010b5c0
80100162:	e8 49 42 00 00       	call   801043b0 <release>
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 4e 3f 00 00       	call   801040c0 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 5d 1f 00 00       	call   801020e0 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 2e 70 10 80       	push   $0x8010702e
80100198:	e8 d3 01 00 00       	call   80100370 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 ad 3f 00 00       	call   80104160 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
801001c4:	e9 17 1f 00 00       	jmp    801020e0 <iderw>
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 3f 70 10 80       	push   $0x8010703f
801001d1:	e8 9a 01 00 00       	call   80100370 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 6c 3f 00 00       	call   80104160 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 1c 3f 00 00       	call   80104120 <releasesleep>
80100204:	c7 04 24 c0 b5 10 80 	movl   $0x8010b5c0,(%esp)
8010020b:	e8 80 40 00 00       	call   80104290 <acquire>
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
80100213:	83 c4 10             	add    $0x10,%esp
80100216:	83 e8 01             	sub    $0x1,%eax
80100219:	85 c0                	test   %eax,%eax
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
80100232:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
80100237:	c7 43 50 bc fc 10 80 	movl   $0x8010fcbc,0x50(%ebx)
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
80100241:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
80100249:	89 1d 10 fd 10 80    	mov    %ebx,0x8010fd10
8010024f:	c7 45 08 c0 b5 10 80 	movl   $0x8010b5c0,0x8(%ebp)
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
8010025c:	e9 4f 41 00 00       	jmp    801043b0 <release>
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 46 70 10 80       	push   $0x80107046
80100269:	e8 02 01 00 00       	call   80100370 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 28             	sub    $0x28,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010027f:	57                   	push   %edi
80100280:	e8 bb 14 00 00       	call   80101740 <iunlock>
80100285:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010028c:	e8 ff 3f 00 00       	call   80104290 <acquire>
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e 9a 00 00 00    	jle    8010033b <consoleread+0xcb>
801002a1:	a1 a0 ff 10 80       	mov    0x8010ffa0,%eax
801002a6:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
801002ac:	74 24                	je     801002d2 <consoleread+0x62>
801002ae:	eb 58                	jmp    80100308 <consoleread+0x98>
801002b0:	83 ec 08             	sub    $0x8,%esp
801002b3:	68 20 a5 10 80       	push   $0x8010a520
801002b8:	68 a0 ff 10 80       	push   $0x8010ffa0
801002bd:	e8 5e 3a 00 00       	call   80103d20 <sleep>
801002c2:	a1 a0 ff 10 80       	mov    0x8010ffa0,%eax
801002c7:	83 c4 10             	add    $0x10,%esp
801002ca:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
801002d0:	75 36                	jne    80100308 <consoleread+0x98>
801002d2:	e8 99 34 00 00       	call   80103770 <myproc>
801002d7:	8b 40 24             	mov    0x24(%eax),%eax
801002da:	85 c0                	test   %eax,%eax
801002dc:	74 d2                	je     801002b0 <consoleread+0x40>
801002de:	83 ec 0c             	sub    $0xc,%esp
801002e1:	68 20 a5 10 80       	push   $0x8010a520
801002e6:	e8 c5 40 00 00       	call   801043b0 <release>
801002eb:	89 3c 24             	mov    %edi,(%esp)
801002ee:	e8 6d 13 00 00       	call   80101660 <ilock>
801002f3:	83 c4 10             	add    $0x10,%esp
801002f6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801002fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
801002fe:	5b                   	pop    %ebx
801002ff:	5e                   	pop    %esi
80100300:	5f                   	pop    %edi
80100301:	5d                   	pop    %ebp
80100302:	c3                   	ret    
80100303:	90                   	nop
80100304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100308:	8d 50 01             	lea    0x1(%eax),%edx
8010030b:	89 15 a0 ff 10 80    	mov    %edx,0x8010ffa0
80100311:	89 c2                	mov    %eax,%edx
80100313:	83 e2 7f             	and    $0x7f,%edx
80100316:	0f be 92 20 ff 10 80 	movsbl -0x7fef00e0(%edx),%edx
8010031d:	83 fa 04             	cmp    $0x4,%edx
80100320:	74 39                	je     8010035b <consoleread+0xeb>
80100322:	83 c6 01             	add    $0x1,%esi
80100325:	83 eb 01             	sub    $0x1,%ebx
80100328:	83 fa 0a             	cmp    $0xa,%edx
8010032b:	88 56 ff             	mov    %dl,-0x1(%esi)
8010032e:	74 35                	je     80100365 <consoleread+0xf5>
80100330:	85 db                	test   %ebx,%ebx
80100332:	0f 85 69 ff ff ff    	jne    801002a1 <consoleread+0x31>
80100338:	8b 45 10             	mov    0x10(%ebp),%eax
8010033b:	83 ec 0c             	sub    $0xc,%esp
8010033e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100341:	68 20 a5 10 80       	push   $0x8010a520
80100346:	e8 65 40 00 00       	call   801043b0 <release>
8010034b:	89 3c 24             	mov    %edi,(%esp)
8010034e:	e8 0d 13 00 00       	call   80101660 <ilock>
80100353:	83 c4 10             	add    $0x10,%esp
80100356:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100359:	eb a0                	jmp    801002fb <consoleread+0x8b>
8010035b:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010035e:	76 05                	jbe    80100365 <consoleread+0xf5>
80100360:	a3 a0 ff 10 80       	mov    %eax,0x8010ffa0
80100365:	8b 45 10             	mov    0x10(%ebp),%eax
80100368:	29 d8                	sub    %ebx,%eax
8010036a:	eb cf                	jmp    8010033b <consoleread+0xcb>
8010036c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100370 <panic>:
80100370:	55                   	push   %ebp
80100371:	89 e5                	mov    %esp,%ebp
80100373:	56                   	push   %esi
80100374:	53                   	push   %ebx
80100375:	83 ec 30             	sub    $0x30,%esp
80100378:	fa                   	cli    
80100379:	c7 05 54 a5 10 80 00 	movl   $0x0,0x8010a554
80100380:	00 00 00 
80100383:	8d 5d d0             	lea    -0x30(%ebp),%ebx
80100386:	8d 75 f8             	lea    -0x8(%ebp),%esi
80100389:	e8 52 23 00 00       	call   801026e0 <lapicid>
8010038e:	83 ec 08             	sub    $0x8,%esp
80100391:	50                   	push   %eax
80100392:	68 4d 70 10 80       	push   $0x8010704d
80100397:	e8 c4 02 00 00       	call   80100660 <cprintf>
8010039c:	58                   	pop    %eax
8010039d:	ff 75 08             	pushl  0x8(%ebp)
801003a0:	e8 bb 02 00 00       	call   80100660 <cprintf>
801003a5:	c7 04 24 e7 79 10 80 	movl   $0x801079e7,(%esp)
801003ac:	e8 af 02 00 00       	call   80100660 <cprintf>
801003b1:	5a                   	pop    %edx
801003b2:	8d 45 08             	lea    0x8(%ebp),%eax
801003b5:	59                   	pop    %ecx
801003b6:	53                   	push   %ebx
801003b7:	50                   	push   %eax
801003b8:	e8 f3 3d 00 00       	call   801041b0 <getcallerpcs>
801003bd:	83 c4 10             	add    $0x10,%esp
801003c0:	83 ec 08             	sub    $0x8,%esp
801003c3:	ff 33                	pushl  (%ebx)
801003c5:	83 c3 04             	add    $0x4,%ebx
801003c8:	68 61 70 10 80       	push   $0x80107061
801003cd:	e8 8e 02 00 00       	call   80100660 <cprintf>
801003d2:	83 c4 10             	add    $0x10,%esp
801003d5:	39 f3                	cmp    %esi,%ebx
801003d7:	75 e7                	jne    801003c0 <panic+0x50>
801003d9:	c7 05 58 a5 10 80 01 	movl   $0x1,0x8010a558
801003e0:	00 00 00 
801003e3:	eb fe                	jmp    801003e3 <panic+0x73>
801003e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801003e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801003f0 <consputc>:
801003f0:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
801003f6:	85 d2                	test   %edx,%edx
801003f8:	74 06                	je     80100400 <consputc+0x10>
801003fa:	fa                   	cli    
801003fb:	eb fe                	jmp    801003fb <consputc+0xb>
801003fd:	8d 76 00             	lea    0x0(%esi),%esi
80100400:	55                   	push   %ebp
80100401:	89 e5                	mov    %esp,%ebp
80100403:	57                   	push   %edi
80100404:	56                   	push   %esi
80100405:	53                   	push   %ebx
80100406:	89 c3                	mov    %eax,%ebx
80100408:	83 ec 0c             	sub    $0xc,%esp
8010040b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100410:	0f 84 b8 00 00 00    	je     801004ce <consputc+0xde>
80100416:	83 ec 0c             	sub    $0xc,%esp
80100419:	50                   	push   %eax
8010041a:	e8 41 57 00 00       	call   80105b60 <uartputc>
8010041f:	83 c4 10             	add    $0x10,%esp
80100422:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100427:	b8 0e 00 00 00       	mov    $0xe,%eax
8010042c:	89 fa                	mov    %edi,%edx
8010042e:	ee                   	out    %al,(%dx)
8010042f:	be d5 03 00 00       	mov    $0x3d5,%esi
80100434:	89 f2                	mov    %esi,%edx
80100436:	ec                   	in     (%dx),%al
80100437:	0f b6 c0             	movzbl %al,%eax
8010043a:	89 fa                	mov    %edi,%edx
8010043c:	c1 e0 08             	shl    $0x8,%eax
8010043f:	89 c1                	mov    %eax,%ecx
80100441:	b8 0f 00 00 00       	mov    $0xf,%eax
80100446:	ee                   	out    %al,(%dx)
80100447:	89 f2                	mov    %esi,%edx
80100449:	ec                   	in     (%dx),%al
8010044a:	0f b6 c0             	movzbl %al,%eax
8010044d:	09 c8                	or     %ecx,%eax
8010044f:	83 fb 0a             	cmp    $0xa,%ebx
80100452:	0f 84 0b 01 00 00    	je     80100563 <consputc+0x173>
80100458:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
8010045e:	0f 84 e6 00 00 00    	je     8010054a <consputc+0x15a>
80100464:	0f b6 d3             	movzbl %bl,%edx
80100467:	8d 78 01             	lea    0x1(%eax),%edi
8010046a:	80 ce 07             	or     $0x7,%dh
8010046d:	66 89 94 00 00 80 0b 	mov    %dx,-0x7ff48000(%eax,%eax,1)
80100474:	80 
80100475:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
8010047b:	0f 8f bc 00 00 00    	jg     8010053d <consputc+0x14d>
80100481:	81 ff 7f 07 00 00    	cmp    $0x77f,%edi
80100487:	7f 6f                	jg     801004f8 <consputc+0x108>
80100489:	89 f8                	mov    %edi,%eax
8010048b:	8d 8c 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%ecx
80100492:	89 fb                	mov    %edi,%ebx
80100494:	c1 e8 08             	shr    $0x8,%eax
80100497:	89 c6                	mov    %eax,%esi
80100499:	bf d4 03 00 00       	mov    $0x3d4,%edi
8010049e:	b8 0e 00 00 00       	mov    $0xe,%eax
801004a3:	89 fa                	mov    %edi,%edx
801004a5:	ee                   	out    %al,(%dx)
801004a6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004ab:	89 f0                	mov    %esi,%eax
801004ad:	ee                   	out    %al,(%dx)
801004ae:	b8 0f 00 00 00       	mov    $0xf,%eax
801004b3:	89 fa                	mov    %edi,%edx
801004b5:	ee                   	out    %al,(%dx)
801004b6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004bb:	89 d8                	mov    %ebx,%eax
801004bd:	ee                   	out    %al,(%dx)
801004be:	b8 20 07 00 00       	mov    $0x720,%eax
801004c3:	66 89 01             	mov    %ax,(%ecx)
801004c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004c9:	5b                   	pop    %ebx
801004ca:	5e                   	pop    %esi
801004cb:	5f                   	pop    %edi
801004cc:	5d                   	pop    %ebp
801004cd:	c3                   	ret    
801004ce:	83 ec 0c             	sub    $0xc,%esp
801004d1:	6a 08                	push   $0x8
801004d3:	e8 88 56 00 00       	call   80105b60 <uartputc>
801004d8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004df:	e8 7c 56 00 00       	call   80105b60 <uartputc>
801004e4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004eb:	e8 70 56 00 00       	call   80105b60 <uartputc>
801004f0:	83 c4 10             	add    $0x10,%esp
801004f3:	e9 2a ff ff ff       	jmp    80100422 <consputc+0x32>
801004f8:	83 ec 04             	sub    $0x4,%esp
801004fb:	8d 5f b0             	lea    -0x50(%edi),%ebx
801004fe:	68 60 0e 00 00       	push   $0xe60
80100503:	68 a0 80 0b 80       	push   $0x800b80a0
80100508:	68 00 80 0b 80       	push   $0x800b8000
8010050d:	8d b4 1b 00 80 0b 80 	lea    -0x7ff48000(%ebx,%ebx,1),%esi
80100514:	e8 97 3f 00 00       	call   801044b0 <memmove>
80100519:	b8 80 07 00 00       	mov    $0x780,%eax
8010051e:	83 c4 0c             	add    $0xc,%esp
80100521:	29 d8                	sub    %ebx,%eax
80100523:	01 c0                	add    %eax,%eax
80100525:	50                   	push   %eax
80100526:	6a 00                	push   $0x0
80100528:	56                   	push   %esi
80100529:	e8 d2 3e 00 00       	call   80104400 <memset>
8010052e:	89 f1                	mov    %esi,%ecx
80100530:	83 c4 10             	add    $0x10,%esp
80100533:	be 07 00 00 00       	mov    $0x7,%esi
80100538:	e9 5c ff ff ff       	jmp    80100499 <consputc+0xa9>
8010053d:	83 ec 0c             	sub    $0xc,%esp
80100540:	68 65 70 10 80       	push   $0x80107065
80100545:	e8 26 fe ff ff       	call   80100370 <panic>
8010054a:	85 c0                	test   %eax,%eax
8010054c:	8d 78 ff             	lea    -0x1(%eax),%edi
8010054f:	0f 85 20 ff ff ff    	jne    80100475 <consputc+0x85>
80100555:	b9 00 80 0b 80       	mov    $0x800b8000,%ecx
8010055a:	31 db                	xor    %ebx,%ebx
8010055c:	31 f6                	xor    %esi,%esi
8010055e:	e9 36 ff ff ff       	jmp    80100499 <consputc+0xa9>
80100563:	ba 67 66 66 66       	mov    $0x66666667,%edx
80100568:	f7 ea                	imul   %edx
8010056a:	89 d0                	mov    %edx,%eax
8010056c:	c1 e8 05             	shr    $0x5,%eax
8010056f:	8d 04 80             	lea    (%eax,%eax,4),%eax
80100572:	c1 e0 04             	shl    $0x4,%eax
80100575:	8d 78 50             	lea    0x50(%eax),%edi
80100578:	e9 f8 fe ff ff       	jmp    80100475 <consputc+0x85>
8010057d:	8d 76 00             	lea    0x0(%esi),%esi

80100580 <printint>:
80100580:	55                   	push   %ebp
80100581:	89 e5                	mov    %esp,%ebp
80100583:	57                   	push   %edi
80100584:	56                   	push   %esi
80100585:	53                   	push   %ebx
80100586:	89 d6                	mov    %edx,%esi
80100588:	83 ec 2c             	sub    $0x2c,%esp
8010058b:	85 c9                	test   %ecx,%ecx
8010058d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
80100590:	74 0c                	je     8010059e <printint+0x1e>
80100592:	89 c7                	mov    %eax,%edi
80100594:	c1 ef 1f             	shr    $0x1f,%edi
80100597:	85 c0                	test   %eax,%eax
80100599:	89 7d d4             	mov    %edi,-0x2c(%ebp)
8010059c:	78 51                	js     801005ef <printint+0x6f>
8010059e:	31 ff                	xor    %edi,%edi
801005a0:	8d 5d d7             	lea    -0x29(%ebp),%ebx
801005a3:	eb 05                	jmp    801005aa <printint+0x2a>
801005a5:	8d 76 00             	lea    0x0(%esi),%esi
801005a8:	89 cf                	mov    %ecx,%edi
801005aa:	31 d2                	xor    %edx,%edx
801005ac:	8d 4f 01             	lea    0x1(%edi),%ecx
801005af:	f7 f6                	div    %esi
801005b1:	0f b6 92 90 70 10 80 	movzbl -0x7fef8f70(%edx),%edx
801005b8:	85 c0                	test   %eax,%eax
801005ba:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
801005bd:	75 e9                	jne    801005a8 <printint+0x28>
801005bf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
801005c2:	85 c0                	test   %eax,%eax
801005c4:	74 08                	je     801005ce <printint+0x4e>
801005c6:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
801005cb:	8d 4f 02             	lea    0x2(%edi),%ecx
801005ce:	8d 74 0d d7          	lea    -0x29(%ebp,%ecx,1),%esi
801005d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005d8:	0f be 06             	movsbl (%esi),%eax
801005db:	83 ee 01             	sub    $0x1,%esi
801005de:	e8 0d fe ff ff       	call   801003f0 <consputc>
801005e3:	39 de                	cmp    %ebx,%esi
801005e5:	75 f1                	jne    801005d8 <printint+0x58>
801005e7:	83 c4 2c             	add    $0x2c,%esp
801005ea:	5b                   	pop    %ebx
801005eb:	5e                   	pop    %esi
801005ec:	5f                   	pop    %edi
801005ed:	5d                   	pop    %ebp
801005ee:	c3                   	ret    
801005ef:	f7 d8                	neg    %eax
801005f1:	eb ab                	jmp    8010059e <printint+0x1e>
801005f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100600 <consolewrite>:
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 18             	sub    $0x18,%esp
80100609:	ff 75 08             	pushl  0x8(%ebp)
8010060c:	8b 75 10             	mov    0x10(%ebp),%esi
8010060f:	e8 2c 11 00 00       	call   80101740 <iunlock>
80100614:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010061b:	e8 70 3c 00 00       	call   80104290 <acquire>
80100620:	8b 7d 0c             	mov    0xc(%ebp),%edi
80100623:	83 c4 10             	add    $0x10,%esp
80100626:	85 f6                	test   %esi,%esi
80100628:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010062b:	7e 12                	jle    8010063f <consolewrite+0x3f>
8010062d:	8d 76 00             	lea    0x0(%esi),%esi
80100630:	0f b6 07             	movzbl (%edi),%eax
80100633:	83 c7 01             	add    $0x1,%edi
80100636:	e8 b5 fd ff ff       	call   801003f0 <consputc>
8010063b:	39 df                	cmp    %ebx,%edi
8010063d:	75 f1                	jne    80100630 <consolewrite+0x30>
8010063f:	83 ec 0c             	sub    $0xc,%esp
80100642:	68 20 a5 10 80       	push   $0x8010a520
80100647:	e8 64 3d 00 00       	call   801043b0 <release>
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 0b 10 00 00       	call   80101660 <ilock>
80100655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100658:	89 f0                	mov    %esi,%eax
8010065a:	5b                   	pop    %ebx
8010065b:	5e                   	pop    %esi
8010065c:	5f                   	pop    %edi
8010065d:	5d                   	pop    %ebp
8010065e:	c3                   	ret    
8010065f:	90                   	nop

80100660 <cprintf>:
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
80100669:	a1 54 a5 10 80       	mov    0x8010a554,%eax
8010066e:	85 c0                	test   %eax,%eax
80100670:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100673:	0f 85 47 01 00 00    	jne    801007c0 <cprintf+0x160>
80100679:	8b 45 08             	mov    0x8(%ebp),%eax
8010067c:	85 c0                	test   %eax,%eax
8010067e:	89 c1                	mov    %eax,%ecx
80100680:	0f 84 4f 01 00 00    	je     801007d5 <cprintf+0x175>
80100686:	0f b6 00             	movzbl (%eax),%eax
80100689:	31 db                	xor    %ebx,%ebx
8010068b:	8d 75 0c             	lea    0xc(%ebp),%esi
8010068e:	89 cf                	mov    %ecx,%edi
80100690:	85 c0                	test   %eax,%eax
80100692:	75 55                	jne    801006e9 <cprintf+0x89>
80100694:	eb 68                	jmp    801006fe <cprintf+0x9e>
80100696:	8d 76 00             	lea    0x0(%esi),%esi
80100699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801006a0:	83 c3 01             	add    $0x1,%ebx
801006a3:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
801006a7:	85 d2                	test   %edx,%edx
801006a9:	74 53                	je     801006fe <cprintf+0x9e>
801006ab:	83 fa 70             	cmp    $0x70,%edx
801006ae:	74 7a                	je     8010072a <cprintf+0xca>
801006b0:	7f 6e                	jg     80100720 <cprintf+0xc0>
801006b2:	83 fa 25             	cmp    $0x25,%edx
801006b5:	0f 84 ad 00 00 00    	je     80100768 <cprintf+0x108>
801006bb:	83 fa 64             	cmp    $0x64,%edx
801006be:	0f 85 84 00 00 00    	jne    80100748 <cprintf+0xe8>
801006c4:	8d 46 04             	lea    0x4(%esi),%eax
801006c7:	b9 01 00 00 00       	mov    $0x1,%ecx
801006cc:	ba 0a 00 00 00       	mov    $0xa,%edx
801006d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801006d4:	8b 06                	mov    (%esi),%eax
801006d6:	e8 a5 fe ff ff       	call   80100580 <printint>
801006db:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801006de:	83 c3 01             	add    $0x1,%ebx
801006e1:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006e5:	85 c0                	test   %eax,%eax
801006e7:	74 15                	je     801006fe <cprintf+0x9e>
801006e9:	83 f8 25             	cmp    $0x25,%eax
801006ec:	74 b2                	je     801006a0 <cprintf+0x40>
801006ee:	e8 fd fc ff ff       	call   801003f0 <consputc>
801006f3:	83 c3 01             	add    $0x1,%ebx
801006f6:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006fa:	85 c0                	test   %eax,%eax
801006fc:	75 eb                	jne    801006e9 <cprintf+0x89>
801006fe:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100701:	85 c0                	test   %eax,%eax
80100703:	74 10                	je     80100715 <cprintf+0xb5>
80100705:	83 ec 0c             	sub    $0xc,%esp
80100708:	68 20 a5 10 80       	push   $0x8010a520
8010070d:	e8 9e 3c 00 00       	call   801043b0 <release>
80100712:	83 c4 10             	add    $0x10,%esp
80100715:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100718:	5b                   	pop    %ebx
80100719:	5e                   	pop    %esi
8010071a:	5f                   	pop    %edi
8010071b:	5d                   	pop    %ebp
8010071c:	c3                   	ret    
8010071d:	8d 76 00             	lea    0x0(%esi),%esi
80100720:	83 fa 73             	cmp    $0x73,%edx
80100723:	74 5b                	je     80100780 <cprintf+0x120>
80100725:	83 fa 78             	cmp    $0x78,%edx
80100728:	75 1e                	jne    80100748 <cprintf+0xe8>
8010072a:	8d 46 04             	lea    0x4(%esi),%eax
8010072d:	31 c9                	xor    %ecx,%ecx
8010072f:	ba 10 00 00 00       	mov    $0x10,%edx
80100734:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100737:	8b 06                	mov    (%esi),%eax
80100739:	e8 42 fe ff ff       	call   80100580 <printint>
8010073e:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80100741:	eb 9b                	jmp    801006de <cprintf+0x7e>
80100743:	90                   	nop
80100744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100748:	b8 25 00 00 00       	mov    $0x25,%eax
8010074d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80100750:	e8 9b fc ff ff       	call   801003f0 <consputc>
80100755:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80100758:	89 d0                	mov    %edx,%eax
8010075a:	e8 91 fc ff ff       	call   801003f0 <consputc>
8010075f:	e9 7a ff ff ff       	jmp    801006de <cprintf+0x7e>
80100764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100768:	b8 25 00 00 00       	mov    $0x25,%eax
8010076d:	e8 7e fc ff ff       	call   801003f0 <consputc>
80100772:	e9 7c ff ff ff       	jmp    801006f3 <cprintf+0x93>
80100777:	89 f6                	mov    %esi,%esi
80100779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100780:	8d 46 04             	lea    0x4(%esi),%eax
80100783:	8b 36                	mov    (%esi),%esi
80100785:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100788:	b8 78 70 10 80       	mov    $0x80107078,%eax
8010078d:	85 f6                	test   %esi,%esi
8010078f:	0f 44 f0             	cmove  %eax,%esi
80100792:	0f be 06             	movsbl (%esi),%eax
80100795:	84 c0                	test   %al,%al
80100797:	74 16                	je     801007af <cprintf+0x14f>
80100799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007a0:	83 c6 01             	add    $0x1,%esi
801007a3:	e8 48 fc ff ff       	call   801003f0 <consputc>
801007a8:	0f be 06             	movsbl (%esi),%eax
801007ab:	84 c0                	test   %al,%al
801007ad:	75 f1                	jne    801007a0 <cprintf+0x140>
801007af:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801007b2:	e9 27 ff ff ff       	jmp    801006de <cprintf+0x7e>
801007b7:	89 f6                	mov    %esi,%esi
801007b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801007c0:	83 ec 0c             	sub    $0xc,%esp
801007c3:	68 20 a5 10 80       	push   $0x8010a520
801007c8:	e8 c3 3a 00 00       	call   80104290 <acquire>
801007cd:	83 c4 10             	add    $0x10,%esp
801007d0:	e9 a4 fe ff ff       	jmp    80100679 <cprintf+0x19>
801007d5:	83 ec 0c             	sub    $0xc,%esp
801007d8:	68 7f 70 10 80       	push   $0x8010707f
801007dd:	e8 8e fb ff ff       	call   80100370 <panic>
801007e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801007f0 <consoleintr>:
801007f0:	55                   	push   %ebp
801007f1:	89 e5                	mov    %esp,%ebp
801007f3:	57                   	push   %edi
801007f4:	56                   	push   %esi
801007f5:	53                   	push   %ebx
801007f6:	31 f6                	xor    %esi,%esi
801007f8:	83 ec 18             	sub    $0x18,%esp
801007fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
801007fe:	68 20 a5 10 80       	push   $0x8010a520
80100803:	e8 88 3a 00 00       	call   80104290 <acquire>
80100808:	83 c4 10             	add    $0x10,%esp
8010080b:	90                   	nop
8010080c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100810:	ff d3                	call   *%ebx
80100812:	85 c0                	test   %eax,%eax
80100814:	89 c7                	mov    %eax,%edi
80100816:	78 48                	js     80100860 <consoleintr+0x70>
80100818:	83 ff 10             	cmp    $0x10,%edi
8010081b:	0f 84 3f 01 00 00    	je     80100960 <consoleintr+0x170>
80100821:	7e 5d                	jle    80100880 <consoleintr+0x90>
80100823:	83 ff 15             	cmp    $0x15,%edi
80100826:	0f 84 dc 00 00 00    	je     80100908 <consoleintr+0x118>
8010082c:	83 ff 7f             	cmp    $0x7f,%edi
8010082f:	75 54                	jne    80100885 <consoleintr+0x95>
80100831:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
80100836:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
8010083c:	74 d2                	je     80100810 <consoleintr+0x20>
8010083e:	83 e8 01             	sub    $0x1,%eax
80100841:	a3 a8 ff 10 80       	mov    %eax,0x8010ffa8
80100846:	b8 00 01 00 00       	mov    $0x100,%eax
8010084b:	e8 a0 fb ff ff       	call   801003f0 <consputc>
80100850:	ff d3                	call   *%ebx
80100852:	85 c0                	test   %eax,%eax
80100854:	89 c7                	mov    %eax,%edi
80100856:	79 c0                	jns    80100818 <consoleintr+0x28>
80100858:	90                   	nop
80100859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100860:	83 ec 0c             	sub    $0xc,%esp
80100863:	68 20 a5 10 80       	push   $0x8010a520
80100868:	e8 43 3b 00 00       	call   801043b0 <release>
8010086d:	83 c4 10             	add    $0x10,%esp
80100870:	85 f6                	test   %esi,%esi
80100872:	0f 85 f8 00 00 00    	jne    80100970 <consoleintr+0x180>
80100878:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010087b:	5b                   	pop    %ebx
8010087c:	5e                   	pop    %esi
8010087d:	5f                   	pop    %edi
8010087e:	5d                   	pop    %ebp
8010087f:	c3                   	ret    
80100880:	83 ff 08             	cmp    $0x8,%edi
80100883:	74 ac                	je     80100831 <consoleintr+0x41>
80100885:	85 ff                	test   %edi,%edi
80100887:	74 87                	je     80100810 <consoleintr+0x20>
80100889:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
8010088e:	89 c2                	mov    %eax,%edx
80100890:	2b 15 a0 ff 10 80    	sub    0x8010ffa0,%edx
80100896:	83 fa 7f             	cmp    $0x7f,%edx
80100899:	0f 87 71 ff ff ff    	ja     80100810 <consoleintr+0x20>
8010089f:	8d 50 01             	lea    0x1(%eax),%edx
801008a2:	83 e0 7f             	and    $0x7f,%eax
801008a5:	83 ff 0d             	cmp    $0xd,%edi
801008a8:	89 15 a8 ff 10 80    	mov    %edx,0x8010ffa8
801008ae:	0f 84 c8 00 00 00    	je     8010097c <consoleintr+0x18c>
801008b4:	89 f9                	mov    %edi,%ecx
801008b6:	88 88 20 ff 10 80    	mov    %cl,-0x7fef00e0(%eax)
801008bc:	89 f8                	mov    %edi,%eax
801008be:	e8 2d fb ff ff       	call   801003f0 <consputc>
801008c3:	83 ff 0a             	cmp    $0xa,%edi
801008c6:	0f 84 c1 00 00 00    	je     8010098d <consoleintr+0x19d>
801008cc:	83 ff 04             	cmp    $0x4,%edi
801008cf:	0f 84 b8 00 00 00    	je     8010098d <consoleintr+0x19d>
801008d5:	a1 a0 ff 10 80       	mov    0x8010ffa0,%eax
801008da:	83 e8 80             	sub    $0xffffff80,%eax
801008dd:	39 05 a8 ff 10 80    	cmp    %eax,0x8010ffa8
801008e3:	0f 85 27 ff ff ff    	jne    80100810 <consoleintr+0x20>
801008e9:	83 ec 0c             	sub    $0xc,%esp
801008ec:	a3 a4 ff 10 80       	mov    %eax,0x8010ffa4
801008f1:	68 a0 ff 10 80       	push   $0x8010ffa0
801008f6:	e8 d5 35 00 00       	call   80103ed0 <wakeup>
801008fb:	83 c4 10             	add    $0x10,%esp
801008fe:	e9 0d ff ff ff       	jmp    80100810 <consoleintr+0x20>
80100903:	90                   	nop
80100904:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100908:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
8010090d:	39 05 a4 ff 10 80    	cmp    %eax,0x8010ffa4
80100913:	75 2b                	jne    80100940 <consoleintr+0x150>
80100915:	e9 f6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010091a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100920:	a3 a8 ff 10 80       	mov    %eax,0x8010ffa8
80100925:	b8 00 01 00 00       	mov    $0x100,%eax
8010092a:	e8 c1 fa ff ff       	call   801003f0 <consputc>
8010092f:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
80100934:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
8010093a:	0f 84 d0 fe ff ff    	je     80100810 <consoleintr+0x20>
80100940:	83 e8 01             	sub    $0x1,%eax
80100943:	89 c2                	mov    %eax,%edx
80100945:	83 e2 7f             	and    $0x7f,%edx
80100948:	80 ba 20 ff 10 80 0a 	cmpb   $0xa,-0x7fef00e0(%edx)
8010094f:	75 cf                	jne    80100920 <consoleintr+0x130>
80100951:	e9 ba fe ff ff       	jmp    80100810 <consoleintr+0x20>
80100956:	8d 76 00             	lea    0x0(%esi),%esi
80100959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100960:	be 01 00 00 00       	mov    $0x1,%esi
80100965:	e9 a6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010096a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100970:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100973:	5b                   	pop    %ebx
80100974:	5e                   	pop    %esi
80100975:	5f                   	pop    %edi
80100976:	5d                   	pop    %ebp
80100977:	e9 44 36 00 00       	jmp    80103fc0 <procdump>
8010097c:	c6 80 20 ff 10 80 0a 	movb   $0xa,-0x7fef00e0(%eax)
80100983:	b8 0a 00 00 00       	mov    $0xa,%eax
80100988:	e8 63 fa ff ff       	call   801003f0 <consputc>
8010098d:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
80100992:	e9 52 ff ff ff       	jmp    801008e9 <consoleintr+0xf9>
80100997:	89 f6                	mov    %esi,%esi
80100999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801009a0 <consoleinit>:
801009a0:	55                   	push   %ebp
801009a1:	89 e5                	mov    %esp,%ebp
801009a3:	83 ec 10             	sub    $0x10,%esp
801009a6:	68 88 70 10 80       	push   $0x80107088
801009ab:	68 20 a5 10 80       	push   $0x8010a520
801009b0:	e8 db 37 00 00       	call   80104190 <initlock>
801009b5:	58                   	pop    %eax
801009b6:	5a                   	pop    %edx
801009b7:	6a 00                	push   $0x0
801009b9:	6a 01                	push   $0x1
801009bb:	c7 05 6c 09 11 80 00 	movl   $0x80100600,0x8011096c
801009c2:	06 10 80 
801009c5:	c7 05 68 09 11 80 70 	movl   $0x80100270,0x80110968
801009cc:	02 10 80 
801009cf:	c7 05 54 a5 10 80 01 	movl   $0x1,0x8010a554
801009d6:	00 00 00 
801009d9:	e8 b2 18 00 00       	call   80102290 <ioapicenable>
801009de:	83 c4 10             	add    $0x10,%esp
801009e1:	c9                   	leave  
801009e2:	c3                   	ret    
801009e3:	66 90                	xchg   %ax,%ax
801009e5:	66 90                	xchg   %ax,%ax
801009e7:	66 90                	xchg   %ax,%ax
801009e9:	66 90                	xchg   %ax,%ax
801009eb:	66 90                	xchg   %ax,%ax
801009ed:	66 90                	xchg   %ax,%ax
801009ef:	90                   	nop

801009f0 <exec>:
801009f0:	55                   	push   %ebp
801009f1:	89 e5                	mov    %esp,%ebp
801009f3:	57                   	push   %edi
801009f4:	56                   	push   %esi
801009f5:	53                   	push   %ebx
801009f6:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
801009fc:	e8 6f 2d 00 00       	call   80103770 <myproc>
80100a01:	c7 40 7c 01 00 00 00 	movl   $0x1,0x7c(%eax)
80100a08:	89 c6                	mov    %eax,%esi
80100a0a:	e8 31 21 00 00       	call   80102b40 <begin_op>
80100a0f:	83 ec 0c             	sub    $0xc,%esp
80100a12:	ff 75 08             	pushl  0x8(%ebp)
80100a15:	e8 96 14 00 00       	call   80101eb0 <namei>
80100a1a:	83 c4 10             	add    $0x10,%esp
80100a1d:	85 c0                	test   %eax,%eax
80100a1f:	0f 84 29 02 00 00    	je     80100c4e <exec+0x25e>
80100a25:	83 ec 0c             	sub    $0xc,%esp
80100a28:	89 c3                	mov    %eax,%ebx
80100a2a:	50                   	push   %eax
80100a2b:	e8 30 0c 00 00       	call   80101660 <ilock>
80100a30:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a36:	6a 34                	push   $0x34
80100a38:	6a 00                	push   $0x0
80100a3a:	50                   	push   %eax
80100a3b:	53                   	push   %ebx
80100a3c:	e8 ff 0e 00 00       	call   80101940 <readi>
80100a41:	83 c4 20             	add    $0x20,%esp
80100a44:	83 f8 34             	cmp    $0x34,%eax
80100a47:	74 27                	je     80100a70 <exec+0x80>
80100a49:	83 ec 0c             	sub    $0xc,%esp
80100a4c:	53                   	push   %ebx
80100a4d:	e8 9e 0e 00 00       	call   801018f0 <iunlockput>
80100a52:	e8 59 21 00 00       	call   80102bb0 <end_op>
80100a57:	83 c4 10             	add    $0x10,%esp
80100a5a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100a5f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a62:	5b                   	pop    %ebx
80100a63:	5e                   	pop    %esi
80100a64:	5f                   	pop    %edi
80100a65:	5d                   	pop    %ebp
80100a66:	c3                   	ret    
80100a67:	89 f6                	mov    %esi,%esi
80100a69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100a70:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a77:	45 4c 46 
80100a7a:	75 cd                	jne    80100a49 <exec+0x59>
80100a7c:	e8 6f 62 00 00       	call   80106cf0 <setupkvm>
80100a81:	85 c0                	test   %eax,%eax
80100a83:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100a89:	74 be                	je     80100a49 <exec+0x59>
80100a8b:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100a92:	00 
80100a93:	8b bd 40 ff ff ff    	mov    -0xc0(%ebp),%edi
80100a99:	0f 84 dd 00 00 00    	je     80100b7c <exec+0x18c>
80100a9f:	31 c0                	xor    %eax,%eax
80100aa1:	89 b5 ec fe ff ff    	mov    %esi,-0x114(%ebp)
80100aa7:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
80100aae:	00 00 00 
80100ab1:	89 c6                	mov    %eax,%esi
80100ab3:	eb 18                	jmp    80100acd <exec+0xdd>
80100ab5:	8d 76 00             	lea    0x0(%esi),%esi
80100ab8:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100abf:	83 c6 01             	add    $0x1,%esi
80100ac2:	83 c7 20             	add    $0x20,%edi
80100ac5:	39 f0                	cmp    %esi,%eax
80100ac7:	0f 8e a9 00 00 00    	jle    80100b76 <exec+0x186>
80100acd:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100ad3:	6a 20                	push   $0x20
80100ad5:	57                   	push   %edi
80100ad6:	50                   	push   %eax
80100ad7:	53                   	push   %ebx
80100ad8:	e8 63 0e 00 00       	call   80101940 <readi>
80100add:	83 c4 10             	add    $0x10,%esp
80100ae0:	83 f8 20             	cmp    $0x20,%eax
80100ae3:	75 7b                	jne    80100b60 <exec+0x170>
80100ae5:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100aec:	75 ca                	jne    80100ab8 <exec+0xc8>
80100aee:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100af4:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100afa:	72 64                	jb     80100b60 <exec+0x170>
80100afc:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100b02:	72 5c                	jb     80100b60 <exec+0x170>
80100b04:	83 ec 04             	sub    $0x4,%esp
80100b07:	50                   	push   %eax
80100b08:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b0e:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b14:	e8 27 60 00 00       	call   80106b40 <allocuvm>
80100b19:	83 c4 10             	add    $0x10,%esp
80100b1c:	85 c0                	test   %eax,%eax
80100b1e:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100b24:	74 3a                	je     80100b60 <exec+0x170>
80100b26:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b2c:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b31:	75 2d                	jne    80100b60 <exec+0x170>
80100b33:	83 ec 0c             	sub    $0xc,%esp
80100b36:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b3c:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b42:	53                   	push   %ebx
80100b43:	50                   	push   %eax
80100b44:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b4a:	e8 31 5f 00 00       	call   80106a80 <loaduvm>
80100b4f:	83 c4 20             	add    $0x20,%esp
80100b52:	85 c0                	test   %eax,%eax
80100b54:	0f 89 5e ff ff ff    	jns    80100ab8 <exec+0xc8>
80100b5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100b60:	83 ec 0c             	sub    $0xc,%esp
80100b63:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b69:	e8 02 61 00 00       	call   80106c70 <freevm>
80100b6e:	83 c4 10             	add    $0x10,%esp
80100b71:	e9 d3 fe ff ff       	jmp    80100a49 <exec+0x59>
80100b76:	8b b5 ec fe ff ff    	mov    -0x114(%ebp),%esi
80100b7c:	83 ec 0c             	sub    $0xc,%esp
80100b7f:	53                   	push   %ebx
80100b80:	e8 6b 0d 00 00       	call   801018f0 <iunlockput>
80100b85:	e8 26 20 00 00       	call   80102bb0 <end_op>
80100b8a:	83 c4 0c             	add    $0xc,%esp
80100b8d:	68 ff ef ff 7f       	push   $0x7fffefff
80100b92:	68 ff ff ff 7f       	push   $0x7fffffff
80100b97:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b9d:	e8 9e 5f 00 00       	call   80106b40 <allocuvm>
80100ba2:	83 c4 10             	add    $0x10,%esp
80100ba5:	85 c0                	test   %eax,%eax
80100ba7:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100bad:	0f 84 80 00 00 00    	je     80100c33 <exec+0x243>
80100bb3:	8b 45 0c             	mov    0xc(%ebp),%eax
80100bb6:	31 ff                	xor    %edi,%edi
80100bb8:	bb ff ef ff 7f       	mov    $0x7fffefff,%ebx
80100bbd:	8d 8d 58 ff ff ff    	lea    -0xa8(%ebp),%ecx
80100bc3:	8b 00                	mov    (%eax),%eax
80100bc5:	85 c0                	test   %eax,%eax
80100bc7:	0f 84 a6 00 00 00    	je     80100c73 <exec+0x283>
80100bcd:	89 b5 ec fe ff ff    	mov    %esi,-0x114(%ebp)
80100bd3:	8b b5 f4 fe ff ff    	mov    -0x10c(%ebp),%esi
80100bd9:	eb 24                	jmp    80100bff <exec+0x20f>
80100bdb:	90                   	nop
80100bdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100be0:	8b 45 0c             	mov    0xc(%ebp),%eax
80100be3:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
80100bea:	83 c7 01             	add    $0x1,%edi
80100bed:	8d 8d 58 ff ff ff    	lea    -0xa8(%ebp),%ecx
80100bf3:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100bf6:	85 c0                	test   %eax,%eax
80100bf8:	74 73                	je     80100c6d <exec+0x27d>
80100bfa:	83 ff 20             	cmp    $0x20,%edi
80100bfd:	74 34                	je     80100c33 <exec+0x243>
80100bff:	83 ec 0c             	sub    $0xc,%esp
80100c02:	50                   	push   %eax
80100c03:	e8 38 3a 00 00       	call   80104640 <strlen>
80100c08:	f7 d0                	not    %eax
80100c0a:	01 c3                	add    %eax,%ebx
80100c0c:	58                   	pop    %eax
80100c0d:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c10:	83 e3 fc             	and    $0xfffffffc,%ebx
80100c13:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c16:	e8 25 3a 00 00       	call   80104640 <strlen>
80100c1b:	83 c0 01             	add    $0x1,%eax
80100c1e:	50                   	push   %eax
80100c1f:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c22:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c25:	53                   	push   %ebx
80100c26:	56                   	push   %esi
80100c27:	e8 c4 62 00 00       	call   80106ef0 <copyout>
80100c2c:	83 c4 20             	add    $0x20,%esp
80100c2f:	85 c0                	test   %eax,%eax
80100c31:	79 ad                	jns    80100be0 <exec+0x1f0>
80100c33:	83 ec 0c             	sub    $0xc,%esp
80100c36:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100c3c:	e8 2f 60 00 00       	call   80106c70 <freevm>
80100c41:	83 c4 10             	add    $0x10,%esp
80100c44:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100c49:	e9 11 fe ff ff       	jmp    80100a5f <exec+0x6f>
80100c4e:	e8 5d 1f 00 00       	call   80102bb0 <end_op>
80100c53:	83 ec 0c             	sub    $0xc,%esp
80100c56:	68 a1 70 10 80       	push   $0x801070a1
80100c5b:	e8 00 fa ff ff       	call   80100660 <cprintf>
80100c60:	83 c4 10             	add    $0x10,%esp
80100c63:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100c68:	e9 f2 fd ff ff       	jmp    80100a5f <exec+0x6f>
80100c6d:	8b b5 ec fe ff ff    	mov    -0x114(%ebp),%esi
80100c73:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100c7a:	89 da                	mov    %ebx,%edx
80100c7c:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100c83:	00 00 00 00 
80100c87:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100c8e:	ff ff ff 
80100c91:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
80100c97:	29 c2                	sub    %eax,%edx
80100c99:	83 c0 0c             	add    $0xc,%eax
80100c9c:	29 c3                	sub    %eax,%ebx
80100c9e:	50                   	push   %eax
80100c9f:	51                   	push   %ecx
80100ca0:	53                   	push   %ebx
80100ca1:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100ca7:	89 95 60 ff ff ff    	mov    %edx,-0xa0(%ebp)
80100cad:	e8 3e 62 00 00       	call   80106ef0 <copyout>
80100cb2:	83 c4 10             	add    $0x10,%esp
80100cb5:	85 c0                	test   %eax,%eax
80100cb7:	0f 88 76 ff ff ff    	js     80100c33 <exec+0x243>
80100cbd:	8b 45 08             	mov    0x8(%ebp),%eax
80100cc0:	0f b6 10             	movzbl (%eax),%edx
80100cc3:	84 d2                	test   %dl,%dl
80100cc5:	74 1c                	je     80100ce3 <exec+0x2f3>
80100cc7:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100cca:	83 c0 01             	add    $0x1,%eax
80100ccd:	8d 76 00             	lea    0x0(%esi),%esi
80100cd0:	80 fa 2f             	cmp    $0x2f,%dl
80100cd3:	0f b6 10             	movzbl (%eax),%edx
80100cd6:	0f 44 c8             	cmove  %eax,%ecx
80100cd9:	83 c0 01             	add    $0x1,%eax
80100cdc:	84 d2                	test   %dl,%dl
80100cde:	75 f0                	jne    80100cd0 <exec+0x2e0>
80100ce0:	89 4d 08             	mov    %ecx,0x8(%ebp)
80100ce3:	8d 46 6c             	lea    0x6c(%esi),%eax
80100ce6:	83 ec 04             	sub    $0x4,%esp
80100ce9:	6a 10                	push   $0x10
80100ceb:	ff 75 08             	pushl  0x8(%ebp)
80100cee:	50                   	push   %eax
80100cef:	e8 0c 39 00 00       	call   80104600 <safestrcpy>
80100cf4:	8b 46 04             	mov    0x4(%esi),%eax
80100cf7:	8b 56 18             	mov    0x18(%esi),%edx
80100cfa:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
80100d00:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100d06:	89 46 04             	mov    %eax,0x4(%esi)
80100d09:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
80100d0f:	89 06                	mov    %eax,(%esi)
80100d11:	8b 8d 3c ff ff ff    	mov    -0xc4(%ebp),%ecx
80100d17:	89 4a 38             	mov    %ecx,0x38(%edx)
80100d1a:	8b 56 18             	mov    0x18(%esi),%edx
80100d1d:	89 5a 44             	mov    %ebx,0x44(%edx)
80100d20:	89 34 24             	mov    %esi,(%esp)
80100d23:	e8 c8 5b 00 00       	call   801068f0 <switchuvm>
80100d28:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
80100d2e:	89 04 24             	mov    %eax,(%esp)
80100d31:	e8 3a 5f 00 00       	call   80106c70 <freevm>
80100d36:	83 c4 10             	add    $0x10,%esp
80100d39:	31 c0                	xor    %eax,%eax
80100d3b:	e9 1f fd ff ff       	jmp    80100a5f <exec+0x6f>

80100d40 <fileinit>:
80100d40:	55                   	push   %ebp
80100d41:	89 e5                	mov    %esp,%ebp
80100d43:	83 ec 10             	sub    $0x10,%esp
80100d46:	68 ad 70 10 80       	push   $0x801070ad
80100d4b:	68 c0 ff 10 80       	push   $0x8010ffc0
80100d50:	e8 3b 34 00 00       	call   80104190 <initlock>
80100d55:	83 c4 10             	add    $0x10,%esp
80100d58:	c9                   	leave  
80100d59:	c3                   	ret    
80100d5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100d60 <filealloc>:
80100d60:	55                   	push   %ebp
80100d61:	89 e5                	mov    %esp,%ebp
80100d63:	53                   	push   %ebx
80100d64:	bb f4 ff 10 80       	mov    $0x8010fff4,%ebx
80100d69:	83 ec 10             	sub    $0x10,%esp
80100d6c:	68 c0 ff 10 80       	push   $0x8010ffc0
80100d71:	e8 1a 35 00 00       	call   80104290 <acquire>
80100d76:	83 c4 10             	add    $0x10,%esp
80100d79:	eb 10                	jmp    80100d8b <filealloc+0x2b>
80100d7b:	90                   	nop
80100d7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100d80:	83 c3 18             	add    $0x18,%ebx
80100d83:	81 fb 54 09 11 80    	cmp    $0x80110954,%ebx
80100d89:	74 25                	je     80100db0 <filealloc+0x50>
80100d8b:	8b 43 04             	mov    0x4(%ebx),%eax
80100d8e:	85 c0                	test   %eax,%eax
80100d90:	75 ee                	jne    80100d80 <filealloc+0x20>
80100d92:	83 ec 0c             	sub    $0xc,%esp
80100d95:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
80100d9c:	68 c0 ff 10 80       	push   $0x8010ffc0
80100da1:	e8 0a 36 00 00       	call   801043b0 <release>
80100da6:	89 d8                	mov    %ebx,%eax
80100da8:	83 c4 10             	add    $0x10,%esp
80100dab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dae:	c9                   	leave  
80100daf:	c3                   	ret    
80100db0:	83 ec 0c             	sub    $0xc,%esp
80100db3:	68 c0 ff 10 80       	push   $0x8010ffc0
80100db8:	e8 f3 35 00 00       	call   801043b0 <release>
80100dbd:	83 c4 10             	add    $0x10,%esp
80100dc0:	31 c0                	xor    %eax,%eax
80100dc2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dc5:	c9                   	leave  
80100dc6:	c3                   	ret    
80100dc7:	89 f6                	mov    %esi,%esi
80100dc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100dd0 <filedup>:
80100dd0:	55                   	push   %ebp
80100dd1:	89 e5                	mov    %esp,%ebp
80100dd3:	53                   	push   %ebx
80100dd4:	83 ec 10             	sub    $0x10,%esp
80100dd7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100dda:	68 c0 ff 10 80       	push   $0x8010ffc0
80100ddf:	e8 ac 34 00 00       	call   80104290 <acquire>
80100de4:	8b 43 04             	mov    0x4(%ebx),%eax
80100de7:	83 c4 10             	add    $0x10,%esp
80100dea:	85 c0                	test   %eax,%eax
80100dec:	7e 1a                	jle    80100e08 <filedup+0x38>
80100dee:	83 c0 01             	add    $0x1,%eax
80100df1:	83 ec 0c             	sub    $0xc,%esp
80100df4:	89 43 04             	mov    %eax,0x4(%ebx)
80100df7:	68 c0 ff 10 80       	push   $0x8010ffc0
80100dfc:	e8 af 35 00 00       	call   801043b0 <release>
80100e01:	89 d8                	mov    %ebx,%eax
80100e03:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e06:	c9                   	leave  
80100e07:	c3                   	ret    
80100e08:	83 ec 0c             	sub    $0xc,%esp
80100e0b:	68 b4 70 10 80       	push   $0x801070b4
80100e10:	e8 5b f5 ff ff       	call   80100370 <panic>
80100e15:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e20 <fileclose>:
80100e20:	55                   	push   %ebp
80100e21:	89 e5                	mov    %esp,%ebp
80100e23:	57                   	push   %edi
80100e24:	56                   	push   %esi
80100e25:	53                   	push   %ebx
80100e26:	83 ec 28             	sub    $0x28,%esp
80100e29:	8b 7d 08             	mov    0x8(%ebp),%edi
80100e2c:	68 c0 ff 10 80       	push   $0x8010ffc0
80100e31:	e8 5a 34 00 00       	call   80104290 <acquire>
80100e36:	8b 47 04             	mov    0x4(%edi),%eax
80100e39:	83 c4 10             	add    $0x10,%esp
80100e3c:	85 c0                	test   %eax,%eax
80100e3e:	0f 8e 9b 00 00 00    	jle    80100edf <fileclose+0xbf>
80100e44:	83 e8 01             	sub    $0x1,%eax
80100e47:	85 c0                	test   %eax,%eax
80100e49:	89 47 04             	mov    %eax,0x4(%edi)
80100e4c:	74 1a                	je     80100e68 <fileclose+0x48>
80100e4e:	c7 45 08 c0 ff 10 80 	movl   $0x8010ffc0,0x8(%ebp)
80100e55:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e58:	5b                   	pop    %ebx
80100e59:	5e                   	pop    %esi
80100e5a:	5f                   	pop    %edi
80100e5b:	5d                   	pop    %ebp
80100e5c:	e9 4f 35 00 00       	jmp    801043b0 <release>
80100e61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100e68:	0f b6 47 09          	movzbl 0x9(%edi),%eax
80100e6c:	8b 1f                	mov    (%edi),%ebx
80100e6e:	83 ec 0c             	sub    $0xc,%esp
80100e71:	8b 77 0c             	mov    0xc(%edi),%esi
80100e74:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
80100e7a:	88 45 e7             	mov    %al,-0x19(%ebp)
80100e7d:	8b 47 10             	mov    0x10(%edi),%eax
80100e80:	68 c0 ff 10 80       	push   $0x8010ffc0
80100e85:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100e88:	e8 23 35 00 00       	call   801043b0 <release>
80100e8d:	83 c4 10             	add    $0x10,%esp
80100e90:	83 fb 01             	cmp    $0x1,%ebx
80100e93:	74 13                	je     80100ea8 <fileclose+0x88>
80100e95:	83 fb 02             	cmp    $0x2,%ebx
80100e98:	74 26                	je     80100ec0 <fileclose+0xa0>
80100e9a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e9d:	5b                   	pop    %ebx
80100e9e:	5e                   	pop    %esi
80100e9f:	5f                   	pop    %edi
80100ea0:	5d                   	pop    %ebp
80100ea1:	c3                   	ret    
80100ea2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100ea8:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100eac:	83 ec 08             	sub    $0x8,%esp
80100eaf:	53                   	push   %ebx
80100eb0:	56                   	push   %esi
80100eb1:	e8 2a 24 00 00       	call   801032e0 <pipeclose>
80100eb6:	83 c4 10             	add    $0x10,%esp
80100eb9:	eb df                	jmp    80100e9a <fileclose+0x7a>
80100ebb:	90                   	nop
80100ebc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100ec0:	e8 7b 1c 00 00       	call   80102b40 <begin_op>
80100ec5:	83 ec 0c             	sub    $0xc,%esp
80100ec8:	ff 75 e0             	pushl  -0x20(%ebp)
80100ecb:	e8 c0 08 00 00       	call   80101790 <iput>
80100ed0:	83 c4 10             	add    $0x10,%esp
80100ed3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ed6:	5b                   	pop    %ebx
80100ed7:	5e                   	pop    %esi
80100ed8:	5f                   	pop    %edi
80100ed9:	5d                   	pop    %ebp
80100eda:	e9 d1 1c 00 00       	jmp    80102bb0 <end_op>
80100edf:	83 ec 0c             	sub    $0xc,%esp
80100ee2:	68 bc 70 10 80       	push   $0x801070bc
80100ee7:	e8 84 f4 ff ff       	call   80100370 <panic>
80100eec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100ef0 <filestat>:
80100ef0:	55                   	push   %ebp
80100ef1:	89 e5                	mov    %esp,%ebp
80100ef3:	53                   	push   %ebx
80100ef4:	83 ec 04             	sub    $0x4,%esp
80100ef7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100efa:	83 3b 02             	cmpl   $0x2,(%ebx)
80100efd:	75 31                	jne    80100f30 <filestat+0x40>
80100eff:	83 ec 0c             	sub    $0xc,%esp
80100f02:	ff 73 10             	pushl  0x10(%ebx)
80100f05:	e8 56 07 00 00       	call   80101660 <ilock>
80100f0a:	58                   	pop    %eax
80100f0b:	5a                   	pop    %edx
80100f0c:	ff 75 0c             	pushl  0xc(%ebp)
80100f0f:	ff 73 10             	pushl  0x10(%ebx)
80100f12:	e8 f9 09 00 00       	call   80101910 <stati>
80100f17:	59                   	pop    %ecx
80100f18:	ff 73 10             	pushl  0x10(%ebx)
80100f1b:	e8 20 08 00 00       	call   80101740 <iunlock>
80100f20:	83 c4 10             	add    $0x10,%esp
80100f23:	31 c0                	xor    %eax,%eax
80100f25:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f28:	c9                   	leave  
80100f29:	c3                   	ret    
80100f2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100f30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100f35:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f38:	c9                   	leave  
80100f39:	c3                   	ret    
80100f3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100f40 <fileread>:
80100f40:	55                   	push   %ebp
80100f41:	89 e5                	mov    %esp,%ebp
80100f43:	57                   	push   %edi
80100f44:	56                   	push   %esi
80100f45:	53                   	push   %ebx
80100f46:	83 ec 0c             	sub    $0xc,%esp
80100f49:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f4c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f4f:	8b 7d 10             	mov    0x10(%ebp),%edi
80100f52:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f56:	74 60                	je     80100fb8 <fileread+0x78>
80100f58:	8b 03                	mov    (%ebx),%eax
80100f5a:	83 f8 01             	cmp    $0x1,%eax
80100f5d:	74 41                	je     80100fa0 <fileread+0x60>
80100f5f:	83 f8 02             	cmp    $0x2,%eax
80100f62:	75 5b                	jne    80100fbf <fileread+0x7f>
80100f64:	83 ec 0c             	sub    $0xc,%esp
80100f67:	ff 73 10             	pushl  0x10(%ebx)
80100f6a:	e8 f1 06 00 00       	call   80101660 <ilock>
80100f6f:	57                   	push   %edi
80100f70:	ff 73 14             	pushl  0x14(%ebx)
80100f73:	56                   	push   %esi
80100f74:	ff 73 10             	pushl  0x10(%ebx)
80100f77:	e8 c4 09 00 00       	call   80101940 <readi>
80100f7c:	83 c4 20             	add    $0x20,%esp
80100f7f:	85 c0                	test   %eax,%eax
80100f81:	89 c6                	mov    %eax,%esi
80100f83:	7e 03                	jle    80100f88 <fileread+0x48>
80100f85:	01 43 14             	add    %eax,0x14(%ebx)
80100f88:	83 ec 0c             	sub    $0xc,%esp
80100f8b:	ff 73 10             	pushl  0x10(%ebx)
80100f8e:	e8 ad 07 00 00       	call   80101740 <iunlock>
80100f93:	83 c4 10             	add    $0x10,%esp
80100f96:	89 f0                	mov    %esi,%eax
80100f98:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f9b:	5b                   	pop    %ebx
80100f9c:	5e                   	pop    %esi
80100f9d:	5f                   	pop    %edi
80100f9e:	5d                   	pop    %ebp
80100f9f:	c3                   	ret    
80100fa0:	8b 43 0c             	mov    0xc(%ebx),%eax
80100fa3:	89 45 08             	mov    %eax,0x8(%ebp)
80100fa6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fa9:	5b                   	pop    %ebx
80100faa:	5e                   	pop    %esi
80100fab:	5f                   	pop    %edi
80100fac:	5d                   	pop    %ebp
80100fad:	e9 ce 24 00 00       	jmp    80103480 <piperead>
80100fb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100fb8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100fbd:	eb d9                	jmp    80100f98 <fileread+0x58>
80100fbf:	83 ec 0c             	sub    $0xc,%esp
80100fc2:	68 c6 70 10 80       	push   $0x801070c6
80100fc7:	e8 a4 f3 ff ff       	call   80100370 <panic>
80100fcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100fd0 <filewrite>:
80100fd0:	55                   	push   %ebp
80100fd1:	89 e5                	mov    %esp,%ebp
80100fd3:	57                   	push   %edi
80100fd4:	56                   	push   %esi
80100fd5:	53                   	push   %ebx
80100fd6:	83 ec 1c             	sub    $0x1c,%esp
80100fd9:	8b 75 08             	mov    0x8(%ebp),%esi
80100fdc:	8b 45 0c             	mov    0xc(%ebp),%eax
80100fdf:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)
80100fe3:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100fe6:	8b 45 10             	mov    0x10(%ebp),%eax
80100fe9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100fec:	0f 84 aa 00 00 00    	je     8010109c <filewrite+0xcc>
80100ff2:	8b 06                	mov    (%esi),%eax
80100ff4:	83 f8 01             	cmp    $0x1,%eax
80100ff7:	0f 84 c2 00 00 00    	je     801010bf <filewrite+0xef>
80100ffd:	83 f8 02             	cmp    $0x2,%eax
80101000:	0f 85 d8 00 00 00    	jne    801010de <filewrite+0x10e>
80101006:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101009:	31 ff                	xor    %edi,%edi
8010100b:	85 c0                	test   %eax,%eax
8010100d:	7f 34                	jg     80101043 <filewrite+0x73>
8010100f:	e9 9c 00 00 00       	jmp    801010b0 <filewrite+0xe0>
80101014:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101018:	01 46 14             	add    %eax,0x14(%esi)
8010101b:	83 ec 0c             	sub    $0xc,%esp
8010101e:	ff 76 10             	pushl  0x10(%esi)
80101021:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101024:	e8 17 07 00 00       	call   80101740 <iunlock>
80101029:	e8 82 1b 00 00       	call   80102bb0 <end_op>
8010102e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101031:	83 c4 10             	add    $0x10,%esp
80101034:	39 d8                	cmp    %ebx,%eax
80101036:	0f 85 95 00 00 00    	jne    801010d1 <filewrite+0x101>
8010103c:	01 c7                	add    %eax,%edi
8010103e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101041:	7e 6d                	jle    801010b0 <filewrite+0xe0>
80101043:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101046:	b8 00 1a 00 00       	mov    $0x1a00,%eax
8010104b:	29 fb                	sub    %edi,%ebx
8010104d:	81 fb 00 1a 00 00    	cmp    $0x1a00,%ebx
80101053:	0f 4f d8             	cmovg  %eax,%ebx
80101056:	e8 e5 1a 00 00       	call   80102b40 <begin_op>
8010105b:	83 ec 0c             	sub    $0xc,%esp
8010105e:	ff 76 10             	pushl  0x10(%esi)
80101061:	e8 fa 05 00 00       	call   80101660 <ilock>
80101066:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101069:	53                   	push   %ebx
8010106a:	ff 76 14             	pushl  0x14(%esi)
8010106d:	01 f8                	add    %edi,%eax
8010106f:	50                   	push   %eax
80101070:	ff 76 10             	pushl  0x10(%esi)
80101073:	e8 c8 09 00 00       	call   80101a40 <writei>
80101078:	83 c4 20             	add    $0x20,%esp
8010107b:	85 c0                	test   %eax,%eax
8010107d:	7f 99                	jg     80101018 <filewrite+0x48>
8010107f:	83 ec 0c             	sub    $0xc,%esp
80101082:	ff 76 10             	pushl  0x10(%esi)
80101085:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101088:	e8 b3 06 00 00       	call   80101740 <iunlock>
8010108d:	e8 1e 1b 00 00       	call   80102bb0 <end_op>
80101092:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101095:	83 c4 10             	add    $0x10,%esp
80101098:	85 c0                	test   %eax,%eax
8010109a:	74 98                	je     80101034 <filewrite+0x64>
8010109c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010109f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801010a4:	5b                   	pop    %ebx
801010a5:	5e                   	pop    %esi
801010a6:	5f                   	pop    %edi
801010a7:	5d                   	pop    %ebp
801010a8:	c3                   	ret    
801010a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801010b0:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
801010b3:	75 e7                	jne    8010109c <filewrite+0xcc>
801010b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010b8:	89 f8                	mov    %edi,%eax
801010ba:	5b                   	pop    %ebx
801010bb:	5e                   	pop    %esi
801010bc:	5f                   	pop    %edi
801010bd:	5d                   	pop    %ebp
801010be:	c3                   	ret    
801010bf:	8b 46 0c             	mov    0xc(%esi),%eax
801010c2:	89 45 08             	mov    %eax,0x8(%ebp)
801010c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010c8:	5b                   	pop    %ebx
801010c9:	5e                   	pop    %esi
801010ca:	5f                   	pop    %edi
801010cb:	5d                   	pop    %ebp
801010cc:	e9 af 22 00 00       	jmp    80103380 <pipewrite>
801010d1:	83 ec 0c             	sub    $0xc,%esp
801010d4:	68 cf 70 10 80       	push   $0x801070cf
801010d9:	e8 92 f2 ff ff       	call   80100370 <panic>
801010de:	83 ec 0c             	sub    $0xc,%esp
801010e1:	68 d5 70 10 80       	push   $0x801070d5
801010e6:	e8 85 f2 ff ff       	call   80100370 <panic>
801010eb:	66 90                	xchg   %ax,%ax
801010ed:	66 90                	xchg   %ax,%ax
801010ef:	90                   	nop

801010f0 <balloc>:
801010f0:	55                   	push   %ebp
801010f1:	89 e5                	mov    %esp,%ebp
801010f3:	57                   	push   %edi
801010f4:	56                   	push   %esi
801010f5:	53                   	push   %ebx
801010f6:	83 ec 1c             	sub    $0x1c,%esp
801010f9:	8b 0d c0 09 11 80    	mov    0x801109c0,%ecx
801010ff:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101102:	85 c9                	test   %ecx,%ecx
80101104:	0f 84 85 00 00 00    	je     8010118f <balloc+0x9f>
8010110a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
80101111:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101114:	83 ec 08             	sub    $0x8,%esp
80101117:	89 f0                	mov    %esi,%eax
80101119:	c1 f8 0c             	sar    $0xc,%eax
8010111c:	03 05 d8 09 11 80    	add    0x801109d8,%eax
80101122:	50                   	push   %eax
80101123:	ff 75 d8             	pushl  -0x28(%ebp)
80101126:	e8 a5 ef ff ff       	call   801000d0 <bread>
8010112b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010112e:	a1 c0 09 11 80       	mov    0x801109c0,%eax
80101133:	83 c4 10             	add    $0x10,%esp
80101136:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101139:	31 c0                	xor    %eax,%eax
8010113b:	eb 2d                	jmp    8010116a <balloc+0x7a>
8010113d:	8d 76 00             	lea    0x0(%esi),%esi
80101140:	89 c1                	mov    %eax,%ecx
80101142:	ba 01 00 00 00       	mov    $0x1,%edx
80101147:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
8010114a:	83 e1 07             	and    $0x7,%ecx
8010114d:	d3 e2                	shl    %cl,%edx
8010114f:	89 c1                	mov    %eax,%ecx
80101151:	c1 f9 03             	sar    $0x3,%ecx
80101154:	0f b6 7c 0b 5c       	movzbl 0x5c(%ebx,%ecx,1),%edi
80101159:	85 d7                	test   %edx,%edi
8010115b:	74 43                	je     801011a0 <balloc+0xb0>
8010115d:	83 c0 01             	add    $0x1,%eax
80101160:	83 c6 01             	add    $0x1,%esi
80101163:	3d 00 10 00 00       	cmp    $0x1000,%eax
80101168:	74 05                	je     8010116f <balloc+0x7f>
8010116a:	3b 75 e0             	cmp    -0x20(%ebp),%esi
8010116d:	72 d1                	jb     80101140 <balloc+0x50>
8010116f:	83 ec 0c             	sub    $0xc,%esp
80101172:	ff 75 e4             	pushl  -0x1c(%ebp)
80101175:	e8 66 f0 ff ff       	call   801001e0 <brelse>
8010117a:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
80101181:	83 c4 10             	add    $0x10,%esp
80101184:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101187:	39 05 c0 09 11 80    	cmp    %eax,0x801109c0
8010118d:	77 82                	ja     80101111 <balloc+0x21>
8010118f:	83 ec 0c             	sub    $0xc,%esp
80101192:	68 df 70 10 80       	push   $0x801070df
80101197:	e8 d4 f1 ff ff       	call   80100370 <panic>
8010119c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801011a0:	09 fa                	or     %edi,%edx
801011a2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801011a5:	83 ec 0c             	sub    $0xc,%esp
801011a8:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
801011ac:	57                   	push   %edi
801011ad:	e8 6e 1b 00 00       	call   80102d20 <log_write>
801011b2:	89 3c 24             	mov    %edi,(%esp)
801011b5:	e8 26 f0 ff ff       	call   801001e0 <brelse>
801011ba:	58                   	pop    %eax
801011bb:	5a                   	pop    %edx
801011bc:	56                   	push   %esi
801011bd:	ff 75 d8             	pushl  -0x28(%ebp)
801011c0:	e8 0b ef ff ff       	call   801000d0 <bread>
801011c5:	89 c3                	mov    %eax,%ebx
801011c7:	8d 40 5c             	lea    0x5c(%eax),%eax
801011ca:	83 c4 0c             	add    $0xc,%esp
801011cd:	68 00 02 00 00       	push   $0x200
801011d2:	6a 00                	push   $0x0
801011d4:	50                   	push   %eax
801011d5:	e8 26 32 00 00       	call   80104400 <memset>
801011da:	89 1c 24             	mov    %ebx,(%esp)
801011dd:	e8 3e 1b 00 00       	call   80102d20 <log_write>
801011e2:	89 1c 24             	mov    %ebx,(%esp)
801011e5:	e8 f6 ef ff ff       	call   801001e0 <brelse>
801011ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
801011ed:	89 f0                	mov    %esi,%eax
801011ef:	5b                   	pop    %ebx
801011f0:	5e                   	pop    %esi
801011f1:	5f                   	pop    %edi
801011f2:	5d                   	pop    %ebp
801011f3:	c3                   	ret    
801011f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801011fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101200 <iget>:
80101200:	55                   	push   %ebp
80101201:	89 e5                	mov    %esp,%ebp
80101203:	57                   	push   %edi
80101204:	56                   	push   %esi
80101205:	53                   	push   %ebx
80101206:	89 c7                	mov    %eax,%edi
80101208:	31 f6                	xor    %esi,%esi
8010120a:	bb 14 0a 11 80       	mov    $0x80110a14,%ebx
8010120f:	83 ec 28             	sub    $0x28,%esp
80101212:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101215:	68 e0 09 11 80       	push   $0x801109e0
8010121a:	e8 71 30 00 00       	call   80104290 <acquire>
8010121f:	83 c4 10             	add    $0x10,%esp
80101222:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101225:	eb 1b                	jmp    80101242 <iget+0x42>
80101227:	89 f6                	mov    %esi,%esi
80101229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101230:	85 f6                	test   %esi,%esi
80101232:	74 44                	je     80101278 <iget+0x78>
80101234:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010123a:	81 fb 34 26 11 80    	cmp    $0x80112634,%ebx
80101240:	74 4e                	je     80101290 <iget+0x90>
80101242:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101245:	85 c9                	test   %ecx,%ecx
80101247:	7e e7                	jle    80101230 <iget+0x30>
80101249:	39 3b                	cmp    %edi,(%ebx)
8010124b:	75 e3                	jne    80101230 <iget+0x30>
8010124d:	39 53 04             	cmp    %edx,0x4(%ebx)
80101250:	75 de                	jne    80101230 <iget+0x30>
80101252:	83 ec 0c             	sub    $0xc,%esp
80101255:	83 c1 01             	add    $0x1,%ecx
80101258:	89 de                	mov    %ebx,%esi
8010125a:	68 e0 09 11 80       	push   $0x801109e0
8010125f:	89 4b 08             	mov    %ecx,0x8(%ebx)
80101262:	e8 49 31 00 00       	call   801043b0 <release>
80101267:	83 c4 10             	add    $0x10,%esp
8010126a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010126d:	89 f0                	mov    %esi,%eax
8010126f:	5b                   	pop    %ebx
80101270:	5e                   	pop    %esi
80101271:	5f                   	pop    %edi
80101272:	5d                   	pop    %ebp
80101273:	c3                   	ret    
80101274:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101278:	85 c9                	test   %ecx,%ecx
8010127a:	0f 44 f3             	cmove  %ebx,%esi
8010127d:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101283:	81 fb 34 26 11 80    	cmp    $0x80112634,%ebx
80101289:	75 b7                	jne    80101242 <iget+0x42>
8010128b:	90                   	nop
8010128c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101290:	85 f6                	test   %esi,%esi
80101292:	74 2d                	je     801012c1 <iget+0xc1>
80101294:	83 ec 0c             	sub    $0xc,%esp
80101297:	89 3e                	mov    %edi,(%esi)
80101299:	89 56 04             	mov    %edx,0x4(%esi)
8010129c:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
801012a3:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
801012aa:	68 e0 09 11 80       	push   $0x801109e0
801012af:	e8 fc 30 00 00       	call   801043b0 <release>
801012b4:	83 c4 10             	add    $0x10,%esp
801012b7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012ba:	89 f0                	mov    %esi,%eax
801012bc:	5b                   	pop    %ebx
801012bd:	5e                   	pop    %esi
801012be:	5f                   	pop    %edi
801012bf:	5d                   	pop    %ebp
801012c0:	c3                   	ret    
801012c1:	83 ec 0c             	sub    $0xc,%esp
801012c4:	68 f5 70 10 80       	push   $0x801070f5
801012c9:	e8 a2 f0 ff ff       	call   80100370 <panic>
801012ce:	66 90                	xchg   %ax,%ax

801012d0 <bmap>:
801012d0:	55                   	push   %ebp
801012d1:	89 e5                	mov    %esp,%ebp
801012d3:	57                   	push   %edi
801012d4:	56                   	push   %esi
801012d5:	53                   	push   %ebx
801012d6:	89 c6                	mov    %eax,%esi
801012d8:	83 ec 1c             	sub    $0x1c,%esp
801012db:	83 fa 0b             	cmp    $0xb,%edx
801012de:	77 18                	ja     801012f8 <bmap+0x28>
801012e0:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
801012e3:	8b 43 5c             	mov    0x5c(%ebx),%eax
801012e6:	85 c0                	test   %eax,%eax
801012e8:	74 76                	je     80101360 <bmap+0x90>
801012ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012ed:	5b                   	pop    %ebx
801012ee:	5e                   	pop    %esi
801012ef:	5f                   	pop    %edi
801012f0:	5d                   	pop    %ebp
801012f1:	c3                   	ret    
801012f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801012f8:	8d 5a f4             	lea    -0xc(%edx),%ebx
801012fb:	83 fb 7f             	cmp    $0x7f,%ebx
801012fe:	0f 87 83 00 00 00    	ja     80101387 <bmap+0xb7>
80101304:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
8010130a:	85 c0                	test   %eax,%eax
8010130c:	74 6a                	je     80101378 <bmap+0xa8>
8010130e:	83 ec 08             	sub    $0x8,%esp
80101311:	50                   	push   %eax
80101312:	ff 36                	pushl  (%esi)
80101314:	e8 b7 ed ff ff       	call   801000d0 <bread>
80101319:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
8010131d:	83 c4 10             	add    $0x10,%esp
80101320:	89 c7                	mov    %eax,%edi
80101322:	8b 1a                	mov    (%edx),%ebx
80101324:	85 db                	test   %ebx,%ebx
80101326:	75 1d                	jne    80101345 <bmap+0x75>
80101328:	8b 06                	mov    (%esi),%eax
8010132a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010132d:	e8 be fd ff ff       	call   801010f0 <balloc>
80101332:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101335:	83 ec 0c             	sub    $0xc,%esp
80101338:	89 c3                	mov    %eax,%ebx
8010133a:	89 02                	mov    %eax,(%edx)
8010133c:	57                   	push   %edi
8010133d:	e8 de 19 00 00       	call   80102d20 <log_write>
80101342:	83 c4 10             	add    $0x10,%esp
80101345:	83 ec 0c             	sub    $0xc,%esp
80101348:	57                   	push   %edi
80101349:	e8 92 ee ff ff       	call   801001e0 <brelse>
8010134e:	83 c4 10             	add    $0x10,%esp
80101351:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101354:	89 d8                	mov    %ebx,%eax
80101356:	5b                   	pop    %ebx
80101357:	5e                   	pop    %esi
80101358:	5f                   	pop    %edi
80101359:	5d                   	pop    %ebp
8010135a:	c3                   	ret    
8010135b:	90                   	nop
8010135c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101360:	8b 06                	mov    (%esi),%eax
80101362:	e8 89 fd ff ff       	call   801010f0 <balloc>
80101367:	89 43 5c             	mov    %eax,0x5c(%ebx)
8010136a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010136d:	5b                   	pop    %ebx
8010136e:	5e                   	pop    %esi
8010136f:	5f                   	pop    %edi
80101370:	5d                   	pop    %ebp
80101371:	c3                   	ret    
80101372:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101378:	8b 06                	mov    (%esi),%eax
8010137a:	e8 71 fd ff ff       	call   801010f0 <balloc>
8010137f:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
80101385:	eb 87                	jmp    8010130e <bmap+0x3e>
80101387:	83 ec 0c             	sub    $0xc,%esp
8010138a:	68 05 71 10 80       	push   $0x80107105
8010138f:	e8 dc ef ff ff       	call   80100370 <panic>
80101394:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010139a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801013a0 <readsb>:
801013a0:	55                   	push   %ebp
801013a1:	89 e5                	mov    %esp,%ebp
801013a3:	56                   	push   %esi
801013a4:	53                   	push   %ebx
801013a5:	8b 75 0c             	mov    0xc(%ebp),%esi
801013a8:	83 ec 08             	sub    $0x8,%esp
801013ab:	6a 01                	push   $0x1
801013ad:	ff 75 08             	pushl  0x8(%ebp)
801013b0:	e8 1b ed ff ff       	call   801000d0 <bread>
801013b5:	89 c3                	mov    %eax,%ebx
801013b7:	8d 40 5c             	lea    0x5c(%eax),%eax
801013ba:	83 c4 0c             	add    $0xc,%esp
801013bd:	6a 1c                	push   $0x1c
801013bf:	50                   	push   %eax
801013c0:	56                   	push   %esi
801013c1:	e8 ea 30 00 00       	call   801044b0 <memmove>
801013c6:	89 5d 08             	mov    %ebx,0x8(%ebp)
801013c9:	83 c4 10             	add    $0x10,%esp
801013cc:	8d 65 f8             	lea    -0x8(%ebp),%esp
801013cf:	5b                   	pop    %ebx
801013d0:	5e                   	pop    %esi
801013d1:	5d                   	pop    %ebp
801013d2:	e9 09 ee ff ff       	jmp    801001e0 <brelse>
801013d7:	89 f6                	mov    %esi,%esi
801013d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801013e0 <bfree>:
801013e0:	55                   	push   %ebp
801013e1:	89 e5                	mov    %esp,%ebp
801013e3:	56                   	push   %esi
801013e4:	53                   	push   %ebx
801013e5:	89 d3                	mov    %edx,%ebx
801013e7:	89 c6                	mov    %eax,%esi
801013e9:	83 ec 08             	sub    $0x8,%esp
801013ec:	68 c0 09 11 80       	push   $0x801109c0
801013f1:	50                   	push   %eax
801013f2:	e8 a9 ff ff ff       	call   801013a0 <readsb>
801013f7:	58                   	pop    %eax
801013f8:	5a                   	pop    %edx
801013f9:	89 da                	mov    %ebx,%edx
801013fb:	c1 ea 0c             	shr    $0xc,%edx
801013fe:	03 15 d8 09 11 80    	add    0x801109d8,%edx
80101404:	52                   	push   %edx
80101405:	56                   	push   %esi
80101406:	e8 c5 ec ff ff       	call   801000d0 <bread>
8010140b:	89 d9                	mov    %ebx,%ecx
8010140d:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
80101413:	ba 01 00 00 00       	mov    $0x1,%edx
80101418:	83 e1 07             	and    $0x7,%ecx
8010141b:	c1 fb 03             	sar    $0x3,%ebx
8010141e:	83 c4 10             	add    $0x10,%esp
80101421:	d3 e2                	shl    %cl,%edx
80101423:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80101428:	85 d1                	test   %edx,%ecx
8010142a:	74 27                	je     80101453 <bfree+0x73>
8010142c:	89 c6                	mov    %eax,%esi
8010142e:	f7 d2                	not    %edx
80101430:	89 c8                	mov    %ecx,%eax
80101432:	83 ec 0c             	sub    $0xc,%esp
80101435:	21 d0                	and    %edx,%eax
80101437:	88 44 1e 5c          	mov    %al,0x5c(%esi,%ebx,1)
8010143b:	56                   	push   %esi
8010143c:	e8 df 18 00 00       	call   80102d20 <log_write>
80101441:	89 34 24             	mov    %esi,(%esp)
80101444:	e8 97 ed ff ff       	call   801001e0 <brelse>
80101449:	83 c4 10             	add    $0x10,%esp
8010144c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010144f:	5b                   	pop    %ebx
80101450:	5e                   	pop    %esi
80101451:	5d                   	pop    %ebp
80101452:	c3                   	ret    
80101453:	83 ec 0c             	sub    $0xc,%esp
80101456:	68 18 71 10 80       	push   $0x80107118
8010145b:	e8 10 ef ff ff       	call   80100370 <panic>

80101460 <iinit>:
80101460:	55                   	push   %ebp
80101461:	89 e5                	mov    %esp,%ebp
80101463:	53                   	push   %ebx
80101464:	bb 20 0a 11 80       	mov    $0x80110a20,%ebx
80101469:	83 ec 0c             	sub    $0xc,%esp
8010146c:	68 2b 71 10 80       	push   $0x8010712b
80101471:	68 e0 09 11 80       	push   $0x801109e0
80101476:	e8 15 2d 00 00       	call   80104190 <initlock>
8010147b:	83 c4 10             	add    $0x10,%esp
8010147e:	66 90                	xchg   %ax,%ax
80101480:	83 ec 08             	sub    $0x8,%esp
80101483:	68 32 71 10 80       	push   $0x80107132
80101488:	53                   	push   %ebx
80101489:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010148f:	e8 ec 2b 00 00       	call   80104080 <initsleeplock>
80101494:	83 c4 10             	add    $0x10,%esp
80101497:	81 fb 40 26 11 80    	cmp    $0x80112640,%ebx
8010149d:	75 e1                	jne    80101480 <iinit+0x20>
8010149f:	83 ec 08             	sub    $0x8,%esp
801014a2:	68 c0 09 11 80       	push   $0x801109c0
801014a7:	ff 75 08             	pushl  0x8(%ebp)
801014aa:	e8 f1 fe ff ff       	call   801013a0 <readsb>
801014af:	ff 35 d8 09 11 80    	pushl  0x801109d8
801014b5:	ff 35 d4 09 11 80    	pushl  0x801109d4
801014bb:	ff 35 d0 09 11 80    	pushl  0x801109d0
801014c1:	ff 35 cc 09 11 80    	pushl  0x801109cc
801014c7:	ff 35 c8 09 11 80    	pushl  0x801109c8
801014cd:	ff 35 c4 09 11 80    	pushl  0x801109c4
801014d3:	ff 35 c0 09 11 80    	pushl  0x801109c0
801014d9:	68 98 71 10 80       	push   $0x80107198
801014de:	e8 7d f1 ff ff       	call   80100660 <cprintf>
801014e3:	83 c4 30             	add    $0x30,%esp
801014e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801014e9:	c9                   	leave  
801014ea:	c3                   	ret    
801014eb:	90                   	nop
801014ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801014f0 <ialloc>:
801014f0:	55                   	push   %ebp
801014f1:	89 e5                	mov    %esp,%ebp
801014f3:	57                   	push   %edi
801014f4:	56                   	push   %esi
801014f5:	53                   	push   %ebx
801014f6:	83 ec 1c             	sub    $0x1c,%esp
801014f9:	83 3d c8 09 11 80 01 	cmpl   $0x1,0x801109c8
80101500:	8b 45 0c             	mov    0xc(%ebp),%eax
80101503:	8b 75 08             	mov    0x8(%ebp),%esi
80101506:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101509:	0f 86 91 00 00 00    	jbe    801015a0 <ialloc+0xb0>
8010150f:	bb 01 00 00 00       	mov    $0x1,%ebx
80101514:	eb 21                	jmp    80101537 <ialloc+0x47>
80101516:	8d 76 00             	lea    0x0(%esi),%esi
80101519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101520:	83 ec 0c             	sub    $0xc,%esp
80101523:	83 c3 01             	add    $0x1,%ebx
80101526:	57                   	push   %edi
80101527:	e8 b4 ec ff ff       	call   801001e0 <brelse>
8010152c:	83 c4 10             	add    $0x10,%esp
8010152f:	39 1d c8 09 11 80    	cmp    %ebx,0x801109c8
80101535:	76 69                	jbe    801015a0 <ialloc+0xb0>
80101537:	89 d8                	mov    %ebx,%eax
80101539:	83 ec 08             	sub    $0x8,%esp
8010153c:	c1 e8 03             	shr    $0x3,%eax
8010153f:	03 05 d4 09 11 80    	add    0x801109d4,%eax
80101545:	50                   	push   %eax
80101546:	56                   	push   %esi
80101547:	e8 84 eb ff ff       	call   801000d0 <bread>
8010154c:	89 c7                	mov    %eax,%edi
8010154e:	89 d8                	mov    %ebx,%eax
80101550:	83 c4 10             	add    $0x10,%esp
80101553:	83 e0 07             	and    $0x7,%eax
80101556:	c1 e0 06             	shl    $0x6,%eax
80101559:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
8010155d:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101561:	75 bd                	jne    80101520 <ialloc+0x30>
80101563:	83 ec 04             	sub    $0x4,%esp
80101566:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101569:	6a 40                	push   $0x40
8010156b:	6a 00                	push   $0x0
8010156d:	51                   	push   %ecx
8010156e:	e8 8d 2e 00 00       	call   80104400 <memset>
80101573:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
80101577:	8b 4d e0             	mov    -0x20(%ebp),%ecx
8010157a:	66 89 01             	mov    %ax,(%ecx)
8010157d:	89 3c 24             	mov    %edi,(%esp)
80101580:	e8 9b 17 00 00       	call   80102d20 <log_write>
80101585:	89 3c 24             	mov    %edi,(%esp)
80101588:	e8 53 ec ff ff       	call   801001e0 <brelse>
8010158d:	83 c4 10             	add    $0x10,%esp
80101590:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101593:	89 da                	mov    %ebx,%edx
80101595:	89 f0                	mov    %esi,%eax
80101597:	5b                   	pop    %ebx
80101598:	5e                   	pop    %esi
80101599:	5f                   	pop    %edi
8010159a:	5d                   	pop    %ebp
8010159b:	e9 60 fc ff ff       	jmp    80101200 <iget>
801015a0:	83 ec 0c             	sub    $0xc,%esp
801015a3:	68 38 71 10 80       	push   $0x80107138
801015a8:	e8 c3 ed ff ff       	call   80100370 <panic>
801015ad:	8d 76 00             	lea    0x0(%esi),%esi

801015b0 <iupdate>:
801015b0:	55                   	push   %ebp
801015b1:	89 e5                	mov    %esp,%ebp
801015b3:	56                   	push   %esi
801015b4:	53                   	push   %ebx
801015b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801015b8:	83 ec 08             	sub    $0x8,%esp
801015bb:	8b 43 04             	mov    0x4(%ebx),%eax
801015be:	83 c3 5c             	add    $0x5c,%ebx
801015c1:	c1 e8 03             	shr    $0x3,%eax
801015c4:	03 05 d4 09 11 80    	add    0x801109d4,%eax
801015ca:	50                   	push   %eax
801015cb:	ff 73 a4             	pushl  -0x5c(%ebx)
801015ce:	e8 fd ea ff ff       	call   801000d0 <bread>
801015d3:	89 c6                	mov    %eax,%esi
801015d5:	8b 43 a8             	mov    -0x58(%ebx),%eax
801015d8:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
801015dc:	83 c4 0c             	add    $0xc,%esp
801015df:	83 e0 07             	and    $0x7,%eax
801015e2:	c1 e0 06             	shl    $0x6,%eax
801015e5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
801015e9:	66 89 10             	mov    %dx,(%eax)
801015ec:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
801015f0:	83 c0 0c             	add    $0xc,%eax
801015f3:	66 89 50 f6          	mov    %dx,-0xa(%eax)
801015f7:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
801015fb:	66 89 50 f8          	mov    %dx,-0x8(%eax)
801015ff:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101603:	66 89 50 fa          	mov    %dx,-0x6(%eax)
80101607:	8b 53 fc             	mov    -0x4(%ebx),%edx
8010160a:	89 50 fc             	mov    %edx,-0x4(%eax)
8010160d:	6a 34                	push   $0x34
8010160f:	53                   	push   %ebx
80101610:	50                   	push   %eax
80101611:	e8 9a 2e 00 00       	call   801044b0 <memmove>
80101616:	89 34 24             	mov    %esi,(%esp)
80101619:	e8 02 17 00 00       	call   80102d20 <log_write>
8010161e:	89 75 08             	mov    %esi,0x8(%ebp)
80101621:	83 c4 10             	add    $0x10,%esp
80101624:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101627:	5b                   	pop    %ebx
80101628:	5e                   	pop    %esi
80101629:	5d                   	pop    %ebp
8010162a:	e9 b1 eb ff ff       	jmp    801001e0 <brelse>
8010162f:	90                   	nop

80101630 <idup>:
80101630:	55                   	push   %ebp
80101631:	89 e5                	mov    %esp,%ebp
80101633:	53                   	push   %ebx
80101634:	83 ec 10             	sub    $0x10,%esp
80101637:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010163a:	68 e0 09 11 80       	push   $0x801109e0
8010163f:	e8 4c 2c 00 00       	call   80104290 <acquire>
80101644:	83 43 08 01          	addl   $0x1,0x8(%ebx)
80101648:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
8010164f:	e8 5c 2d 00 00       	call   801043b0 <release>
80101654:	89 d8                	mov    %ebx,%eax
80101656:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101659:	c9                   	leave  
8010165a:	c3                   	ret    
8010165b:	90                   	nop
8010165c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101660 <ilock>:
80101660:	55                   	push   %ebp
80101661:	89 e5                	mov    %esp,%ebp
80101663:	56                   	push   %esi
80101664:	53                   	push   %ebx
80101665:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101668:	85 db                	test   %ebx,%ebx
8010166a:	0f 84 b7 00 00 00    	je     80101727 <ilock+0xc7>
80101670:	8b 53 08             	mov    0x8(%ebx),%edx
80101673:	85 d2                	test   %edx,%edx
80101675:	0f 8e ac 00 00 00    	jle    80101727 <ilock+0xc7>
8010167b:	8d 43 0c             	lea    0xc(%ebx),%eax
8010167e:	83 ec 0c             	sub    $0xc,%esp
80101681:	50                   	push   %eax
80101682:	e8 39 2a 00 00       	call   801040c0 <acquiresleep>
80101687:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010168a:	83 c4 10             	add    $0x10,%esp
8010168d:	85 c0                	test   %eax,%eax
8010168f:	74 0f                	je     801016a0 <ilock+0x40>
80101691:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101694:	5b                   	pop    %ebx
80101695:	5e                   	pop    %esi
80101696:	5d                   	pop    %ebp
80101697:	c3                   	ret    
80101698:	90                   	nop
80101699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801016a0:	8b 43 04             	mov    0x4(%ebx),%eax
801016a3:	83 ec 08             	sub    $0x8,%esp
801016a6:	c1 e8 03             	shr    $0x3,%eax
801016a9:	03 05 d4 09 11 80    	add    0x801109d4,%eax
801016af:	50                   	push   %eax
801016b0:	ff 33                	pushl  (%ebx)
801016b2:	e8 19 ea ff ff       	call   801000d0 <bread>
801016b7:	89 c6                	mov    %eax,%esi
801016b9:	8b 43 04             	mov    0x4(%ebx),%eax
801016bc:	83 c4 0c             	add    $0xc,%esp
801016bf:	83 e0 07             	and    $0x7,%eax
801016c2:	c1 e0 06             	shl    $0x6,%eax
801016c5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
801016c9:	0f b7 10             	movzwl (%eax),%edx
801016cc:	83 c0 0c             	add    $0xc,%eax
801016cf:	66 89 53 50          	mov    %dx,0x50(%ebx)
801016d3:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
801016d7:	66 89 53 52          	mov    %dx,0x52(%ebx)
801016db:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
801016df:	66 89 53 54          	mov    %dx,0x54(%ebx)
801016e3:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
801016e7:	66 89 53 56          	mov    %dx,0x56(%ebx)
801016eb:	8b 50 fc             	mov    -0x4(%eax),%edx
801016ee:	89 53 58             	mov    %edx,0x58(%ebx)
801016f1:	6a 34                	push   $0x34
801016f3:	50                   	push   %eax
801016f4:	8d 43 5c             	lea    0x5c(%ebx),%eax
801016f7:	50                   	push   %eax
801016f8:	e8 b3 2d 00 00       	call   801044b0 <memmove>
801016fd:	89 34 24             	mov    %esi,(%esp)
80101700:	e8 db ea ff ff       	call   801001e0 <brelse>
80101705:	83 c4 10             	add    $0x10,%esp
80101708:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
8010170d:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
80101714:	0f 85 77 ff ff ff    	jne    80101691 <ilock+0x31>
8010171a:	83 ec 0c             	sub    $0xc,%esp
8010171d:	68 50 71 10 80       	push   $0x80107150
80101722:	e8 49 ec ff ff       	call   80100370 <panic>
80101727:	83 ec 0c             	sub    $0xc,%esp
8010172a:	68 4a 71 10 80       	push   $0x8010714a
8010172f:	e8 3c ec ff ff       	call   80100370 <panic>
80101734:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010173a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101740 <iunlock>:
80101740:	55                   	push   %ebp
80101741:	89 e5                	mov    %esp,%ebp
80101743:	56                   	push   %esi
80101744:	53                   	push   %ebx
80101745:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101748:	85 db                	test   %ebx,%ebx
8010174a:	74 28                	je     80101774 <iunlock+0x34>
8010174c:	8d 73 0c             	lea    0xc(%ebx),%esi
8010174f:	83 ec 0c             	sub    $0xc,%esp
80101752:	56                   	push   %esi
80101753:	e8 08 2a 00 00       	call   80104160 <holdingsleep>
80101758:	83 c4 10             	add    $0x10,%esp
8010175b:	85 c0                	test   %eax,%eax
8010175d:	74 15                	je     80101774 <iunlock+0x34>
8010175f:	8b 43 08             	mov    0x8(%ebx),%eax
80101762:	85 c0                	test   %eax,%eax
80101764:	7e 0e                	jle    80101774 <iunlock+0x34>
80101766:	89 75 08             	mov    %esi,0x8(%ebp)
80101769:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010176c:	5b                   	pop    %ebx
8010176d:	5e                   	pop    %esi
8010176e:	5d                   	pop    %ebp
8010176f:	e9 ac 29 00 00       	jmp    80104120 <releasesleep>
80101774:	83 ec 0c             	sub    $0xc,%esp
80101777:	68 5f 71 10 80       	push   $0x8010715f
8010177c:	e8 ef eb ff ff       	call   80100370 <panic>
80101781:	eb 0d                	jmp    80101790 <iput>
80101783:	90                   	nop
80101784:	90                   	nop
80101785:	90                   	nop
80101786:	90                   	nop
80101787:	90                   	nop
80101788:	90                   	nop
80101789:	90                   	nop
8010178a:	90                   	nop
8010178b:	90                   	nop
8010178c:	90                   	nop
8010178d:	90                   	nop
8010178e:	90                   	nop
8010178f:	90                   	nop

80101790 <iput>:
80101790:	55                   	push   %ebp
80101791:	89 e5                	mov    %esp,%ebp
80101793:	57                   	push   %edi
80101794:	56                   	push   %esi
80101795:	53                   	push   %ebx
80101796:	83 ec 28             	sub    $0x28,%esp
80101799:	8b 75 08             	mov    0x8(%ebp),%esi
8010179c:	8d 7e 0c             	lea    0xc(%esi),%edi
8010179f:	57                   	push   %edi
801017a0:	e8 1b 29 00 00       	call   801040c0 <acquiresleep>
801017a5:	8b 56 4c             	mov    0x4c(%esi),%edx
801017a8:	83 c4 10             	add    $0x10,%esp
801017ab:	85 d2                	test   %edx,%edx
801017ad:	74 07                	je     801017b6 <iput+0x26>
801017af:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
801017b4:	74 32                	je     801017e8 <iput+0x58>
801017b6:	83 ec 0c             	sub    $0xc,%esp
801017b9:	57                   	push   %edi
801017ba:	e8 61 29 00 00       	call   80104120 <releasesleep>
801017bf:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
801017c6:	e8 c5 2a 00 00       	call   80104290 <acquire>
801017cb:	83 6e 08 01          	subl   $0x1,0x8(%esi)
801017cf:	83 c4 10             	add    $0x10,%esp
801017d2:	c7 45 08 e0 09 11 80 	movl   $0x801109e0,0x8(%ebp)
801017d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801017dc:	5b                   	pop    %ebx
801017dd:	5e                   	pop    %esi
801017de:	5f                   	pop    %edi
801017df:	5d                   	pop    %ebp
801017e0:	e9 cb 2b 00 00       	jmp    801043b0 <release>
801017e5:	8d 76 00             	lea    0x0(%esi),%esi
801017e8:	83 ec 0c             	sub    $0xc,%esp
801017eb:	68 e0 09 11 80       	push   $0x801109e0
801017f0:	e8 9b 2a 00 00       	call   80104290 <acquire>
801017f5:	8b 5e 08             	mov    0x8(%esi),%ebx
801017f8:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
801017ff:	e8 ac 2b 00 00       	call   801043b0 <release>
80101804:	83 c4 10             	add    $0x10,%esp
80101807:	83 fb 01             	cmp    $0x1,%ebx
8010180a:	75 aa                	jne    801017b6 <iput+0x26>
8010180c:	8d 8e 8c 00 00 00    	lea    0x8c(%esi),%ecx
80101812:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101815:	8d 5e 5c             	lea    0x5c(%esi),%ebx
80101818:	89 cf                	mov    %ecx,%edi
8010181a:	eb 0b                	jmp    80101827 <iput+0x97>
8010181c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101820:	83 c3 04             	add    $0x4,%ebx
80101823:	39 fb                	cmp    %edi,%ebx
80101825:	74 19                	je     80101840 <iput+0xb0>
80101827:	8b 13                	mov    (%ebx),%edx
80101829:	85 d2                	test   %edx,%edx
8010182b:	74 f3                	je     80101820 <iput+0x90>
8010182d:	8b 06                	mov    (%esi),%eax
8010182f:	e8 ac fb ff ff       	call   801013e0 <bfree>
80101834:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010183a:	eb e4                	jmp    80101820 <iput+0x90>
8010183c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101840:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
80101846:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101849:	85 c0                	test   %eax,%eax
8010184b:	75 33                	jne    80101880 <iput+0xf0>
8010184d:	83 ec 0c             	sub    $0xc,%esp
80101850:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
80101857:	56                   	push   %esi
80101858:	e8 53 fd ff ff       	call   801015b0 <iupdate>
8010185d:	31 c0                	xor    %eax,%eax
8010185f:	66 89 46 50          	mov    %ax,0x50(%esi)
80101863:	89 34 24             	mov    %esi,(%esp)
80101866:	e8 45 fd ff ff       	call   801015b0 <iupdate>
8010186b:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
80101872:	83 c4 10             	add    $0x10,%esp
80101875:	e9 3c ff ff ff       	jmp    801017b6 <iput+0x26>
8010187a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101880:	83 ec 08             	sub    $0x8,%esp
80101883:	50                   	push   %eax
80101884:	ff 36                	pushl  (%esi)
80101886:	e8 45 e8 ff ff       	call   801000d0 <bread>
8010188b:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
80101891:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101894:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101897:	8d 58 5c             	lea    0x5c(%eax),%ebx
8010189a:	83 c4 10             	add    $0x10,%esp
8010189d:	89 cf                	mov    %ecx,%edi
8010189f:	eb 0e                	jmp    801018af <iput+0x11f>
801018a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801018a8:	83 c3 04             	add    $0x4,%ebx
801018ab:	39 fb                	cmp    %edi,%ebx
801018ad:	74 0f                	je     801018be <iput+0x12e>
801018af:	8b 13                	mov    (%ebx),%edx
801018b1:	85 d2                	test   %edx,%edx
801018b3:	74 f3                	je     801018a8 <iput+0x118>
801018b5:	8b 06                	mov    (%esi),%eax
801018b7:	e8 24 fb ff ff       	call   801013e0 <bfree>
801018bc:	eb ea                	jmp    801018a8 <iput+0x118>
801018be:	83 ec 0c             	sub    $0xc,%esp
801018c1:	ff 75 e4             	pushl  -0x1c(%ebp)
801018c4:	8b 7d e0             	mov    -0x20(%ebp),%edi
801018c7:	e8 14 e9 ff ff       	call   801001e0 <brelse>
801018cc:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
801018d2:	8b 06                	mov    (%esi),%eax
801018d4:	e8 07 fb ff ff       	call   801013e0 <bfree>
801018d9:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
801018e0:	00 00 00 
801018e3:	83 c4 10             	add    $0x10,%esp
801018e6:	e9 62 ff ff ff       	jmp    8010184d <iput+0xbd>
801018eb:	90                   	nop
801018ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801018f0 <iunlockput>:
801018f0:	55                   	push   %ebp
801018f1:	89 e5                	mov    %esp,%ebp
801018f3:	53                   	push   %ebx
801018f4:	83 ec 10             	sub    $0x10,%esp
801018f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801018fa:	53                   	push   %ebx
801018fb:	e8 40 fe ff ff       	call   80101740 <iunlock>
80101900:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101903:	83 c4 10             	add    $0x10,%esp
80101906:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101909:	c9                   	leave  
8010190a:	e9 81 fe ff ff       	jmp    80101790 <iput>
8010190f:	90                   	nop

80101910 <stati>:
80101910:	55                   	push   %ebp
80101911:	89 e5                	mov    %esp,%ebp
80101913:	8b 55 08             	mov    0x8(%ebp),%edx
80101916:	8b 45 0c             	mov    0xc(%ebp),%eax
80101919:	8b 0a                	mov    (%edx),%ecx
8010191b:	89 48 04             	mov    %ecx,0x4(%eax)
8010191e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101921:	89 48 08             	mov    %ecx,0x8(%eax)
80101924:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101928:	66 89 08             	mov    %cx,(%eax)
8010192b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010192f:	66 89 48 0c          	mov    %cx,0xc(%eax)
80101933:	8b 52 58             	mov    0x58(%edx),%edx
80101936:	89 50 10             	mov    %edx,0x10(%eax)
80101939:	5d                   	pop    %ebp
8010193a:	c3                   	ret    
8010193b:	90                   	nop
8010193c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101940 <readi>:
80101940:	55                   	push   %ebp
80101941:	89 e5                	mov    %esp,%ebp
80101943:	57                   	push   %edi
80101944:	56                   	push   %esi
80101945:	53                   	push   %ebx
80101946:	83 ec 1c             	sub    $0x1c,%esp
80101949:	8b 45 08             	mov    0x8(%ebp),%eax
8010194c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010194f:	8b 75 10             	mov    0x10(%ebp),%esi
80101952:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101957:	89 7d e0             	mov    %edi,-0x20(%ebp)
8010195a:	8b 7d 14             	mov    0x14(%ebp),%edi
8010195d:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101960:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101963:	0f 84 a7 00 00 00    	je     80101a10 <readi+0xd0>
80101969:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010196c:	8b 40 58             	mov    0x58(%eax),%eax
8010196f:	39 f0                	cmp    %esi,%eax
80101971:	0f 82 c1 00 00 00    	jb     80101a38 <readi+0xf8>
80101977:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010197a:	89 fa                	mov    %edi,%edx
8010197c:	01 f2                	add    %esi,%edx
8010197e:	0f 82 b4 00 00 00    	jb     80101a38 <readi+0xf8>
80101984:	89 c1                	mov    %eax,%ecx
80101986:	29 f1                	sub    %esi,%ecx
80101988:	39 d0                	cmp    %edx,%eax
8010198a:	0f 43 cf             	cmovae %edi,%ecx
8010198d:	31 ff                	xor    %edi,%edi
8010198f:	85 c9                	test   %ecx,%ecx
80101991:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101994:	74 6d                	je     80101a03 <readi+0xc3>
80101996:	8d 76 00             	lea    0x0(%esi),%esi
80101999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801019a0:	8b 5d d8             	mov    -0x28(%ebp),%ebx
801019a3:	89 f2                	mov    %esi,%edx
801019a5:	c1 ea 09             	shr    $0x9,%edx
801019a8:	89 d8                	mov    %ebx,%eax
801019aa:	e8 21 f9 ff ff       	call   801012d0 <bmap>
801019af:	83 ec 08             	sub    $0x8,%esp
801019b2:	50                   	push   %eax
801019b3:	ff 33                	pushl  (%ebx)
801019b5:	bb 00 02 00 00       	mov    $0x200,%ebx
801019ba:	e8 11 e7 ff ff       	call   801000d0 <bread>
801019bf:	89 c2                	mov    %eax,%edx
801019c1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801019c4:	89 f1                	mov    %esi,%ecx
801019c6:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
801019cc:	83 c4 0c             	add    $0xc,%esp
801019cf:	89 55 dc             	mov    %edx,-0x24(%ebp)
801019d2:	29 cb                	sub    %ecx,%ebx
801019d4:	29 f8                	sub    %edi,%eax
801019d6:	39 c3                	cmp    %eax,%ebx
801019d8:	0f 47 d8             	cmova  %eax,%ebx
801019db:	8d 44 0a 5c          	lea    0x5c(%edx,%ecx,1),%eax
801019df:	53                   	push   %ebx
801019e0:	01 df                	add    %ebx,%edi
801019e2:	01 de                	add    %ebx,%esi
801019e4:	50                   	push   %eax
801019e5:	ff 75 e0             	pushl  -0x20(%ebp)
801019e8:	e8 c3 2a 00 00       	call   801044b0 <memmove>
801019ed:	8b 55 dc             	mov    -0x24(%ebp),%edx
801019f0:	89 14 24             	mov    %edx,(%esp)
801019f3:	e8 e8 e7 ff ff       	call   801001e0 <brelse>
801019f8:	01 5d e0             	add    %ebx,-0x20(%ebp)
801019fb:	83 c4 10             	add    $0x10,%esp
801019fe:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101a01:	77 9d                	ja     801019a0 <readi+0x60>
80101a03:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101a06:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a09:	5b                   	pop    %ebx
80101a0a:	5e                   	pop    %esi
80101a0b:	5f                   	pop    %edi
80101a0c:	5d                   	pop    %ebp
80101a0d:	c3                   	ret    
80101a0e:	66 90                	xchg   %ax,%ax
80101a10:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101a14:	66 83 f8 09          	cmp    $0x9,%ax
80101a18:	77 1e                	ja     80101a38 <readi+0xf8>
80101a1a:	8b 04 c5 60 09 11 80 	mov    -0x7feef6a0(,%eax,8),%eax
80101a21:	85 c0                	test   %eax,%eax
80101a23:	74 13                	je     80101a38 <readi+0xf8>
80101a25:	89 7d 10             	mov    %edi,0x10(%ebp)
80101a28:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a2b:	5b                   	pop    %ebx
80101a2c:	5e                   	pop    %esi
80101a2d:	5f                   	pop    %edi
80101a2e:	5d                   	pop    %ebp
80101a2f:	ff e0                	jmp    *%eax
80101a31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101a38:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a3d:	eb c7                	jmp    80101a06 <readi+0xc6>
80101a3f:	90                   	nop

80101a40 <writei>:
80101a40:	55                   	push   %ebp
80101a41:	89 e5                	mov    %esp,%ebp
80101a43:	57                   	push   %edi
80101a44:	56                   	push   %esi
80101a45:	53                   	push   %ebx
80101a46:	83 ec 1c             	sub    $0x1c,%esp
80101a49:	8b 45 08             	mov    0x8(%ebp),%eax
80101a4c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a4f:	8b 7d 14             	mov    0x14(%ebp),%edi
80101a52:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101a57:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101a5a:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a5d:	8b 75 10             	mov    0x10(%ebp),%esi
80101a60:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101a63:	0f 84 b7 00 00 00    	je     80101b20 <writei+0xe0>
80101a69:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a6c:	39 70 58             	cmp    %esi,0x58(%eax)
80101a6f:	0f 82 eb 00 00 00    	jb     80101b60 <writei+0x120>
80101a75:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101a78:	89 f8                	mov    %edi,%eax
80101a7a:	01 f0                	add    %esi,%eax
80101a7c:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101a81:	0f 87 d9 00 00 00    	ja     80101b60 <writei+0x120>
80101a87:	39 c6                	cmp    %eax,%esi
80101a89:	0f 87 d1 00 00 00    	ja     80101b60 <writei+0x120>
80101a8f:	85 ff                	test   %edi,%edi
80101a91:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101a98:	74 78                	je     80101b12 <writei+0xd2>
80101a9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101aa0:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101aa3:	89 f2                	mov    %esi,%edx
80101aa5:	bb 00 02 00 00       	mov    $0x200,%ebx
80101aaa:	c1 ea 09             	shr    $0x9,%edx
80101aad:	89 f8                	mov    %edi,%eax
80101aaf:	e8 1c f8 ff ff       	call   801012d0 <bmap>
80101ab4:	83 ec 08             	sub    $0x8,%esp
80101ab7:	50                   	push   %eax
80101ab8:	ff 37                	pushl  (%edi)
80101aba:	e8 11 e6 ff ff       	call   801000d0 <bread>
80101abf:	89 c7                	mov    %eax,%edi
80101ac1:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101ac4:	2b 45 e4             	sub    -0x1c(%ebp),%eax
80101ac7:	89 f1                	mov    %esi,%ecx
80101ac9:	83 c4 0c             	add    $0xc,%esp
80101acc:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
80101ad2:	29 cb                	sub    %ecx,%ebx
80101ad4:	39 c3                	cmp    %eax,%ebx
80101ad6:	0f 47 d8             	cmova  %eax,%ebx
80101ad9:	8d 44 0f 5c          	lea    0x5c(%edi,%ecx,1),%eax
80101add:	53                   	push   %ebx
80101ade:	ff 75 dc             	pushl  -0x24(%ebp)
80101ae1:	01 de                	add    %ebx,%esi
80101ae3:	50                   	push   %eax
80101ae4:	e8 c7 29 00 00       	call   801044b0 <memmove>
80101ae9:	89 3c 24             	mov    %edi,(%esp)
80101aec:	e8 2f 12 00 00       	call   80102d20 <log_write>
80101af1:	89 3c 24             	mov    %edi,(%esp)
80101af4:	e8 e7 e6 ff ff       	call   801001e0 <brelse>
80101af9:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101afc:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101aff:	83 c4 10             	add    $0x10,%esp
80101b02:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101b05:	39 55 e0             	cmp    %edx,-0x20(%ebp)
80101b08:	77 96                	ja     80101aa0 <writei+0x60>
80101b0a:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b0d:	3b 70 58             	cmp    0x58(%eax),%esi
80101b10:	77 36                	ja     80101b48 <writei+0x108>
80101b12:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101b15:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b18:	5b                   	pop    %ebx
80101b19:	5e                   	pop    %esi
80101b1a:	5f                   	pop    %edi
80101b1b:	5d                   	pop    %ebp
80101b1c:	c3                   	ret    
80101b1d:	8d 76 00             	lea    0x0(%esi),%esi
80101b20:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b24:	66 83 f8 09          	cmp    $0x9,%ax
80101b28:	77 36                	ja     80101b60 <writei+0x120>
80101b2a:	8b 04 c5 64 09 11 80 	mov    -0x7feef69c(,%eax,8),%eax
80101b31:	85 c0                	test   %eax,%eax
80101b33:	74 2b                	je     80101b60 <writei+0x120>
80101b35:	89 7d 10             	mov    %edi,0x10(%ebp)
80101b38:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b3b:	5b                   	pop    %ebx
80101b3c:	5e                   	pop    %esi
80101b3d:	5f                   	pop    %edi
80101b3e:	5d                   	pop    %ebp
80101b3f:	ff e0                	jmp    *%eax
80101b41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101b48:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b4b:	83 ec 0c             	sub    $0xc,%esp
80101b4e:	89 70 58             	mov    %esi,0x58(%eax)
80101b51:	50                   	push   %eax
80101b52:	e8 59 fa ff ff       	call   801015b0 <iupdate>
80101b57:	83 c4 10             	add    $0x10,%esp
80101b5a:	eb b6                	jmp    80101b12 <writei+0xd2>
80101b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b65:	eb ae                	jmp    80101b15 <writei+0xd5>
80101b67:	89 f6                	mov    %esi,%esi
80101b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b70 <namecmp>:
80101b70:	55                   	push   %ebp
80101b71:	89 e5                	mov    %esp,%ebp
80101b73:	83 ec 0c             	sub    $0xc,%esp
80101b76:	6a 0e                	push   $0xe
80101b78:	ff 75 0c             	pushl  0xc(%ebp)
80101b7b:	ff 75 08             	pushl  0x8(%ebp)
80101b7e:	e8 ad 29 00 00       	call   80104530 <strncmp>
80101b83:	c9                   	leave  
80101b84:	c3                   	ret    
80101b85:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b90 <dirlookup>:
80101b90:	55                   	push   %ebp
80101b91:	89 e5                	mov    %esp,%ebp
80101b93:	57                   	push   %edi
80101b94:	56                   	push   %esi
80101b95:	53                   	push   %ebx
80101b96:	83 ec 1c             	sub    $0x1c,%esp
80101b99:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101b9c:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101ba1:	0f 85 80 00 00 00    	jne    80101c27 <dirlookup+0x97>
80101ba7:	8b 53 58             	mov    0x58(%ebx),%edx
80101baa:	31 ff                	xor    %edi,%edi
80101bac:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101baf:	85 d2                	test   %edx,%edx
80101bb1:	75 0d                	jne    80101bc0 <dirlookup+0x30>
80101bb3:	eb 5b                	jmp    80101c10 <dirlookup+0x80>
80101bb5:	8d 76 00             	lea    0x0(%esi),%esi
80101bb8:	83 c7 10             	add    $0x10,%edi
80101bbb:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101bbe:	76 50                	jbe    80101c10 <dirlookup+0x80>
80101bc0:	6a 10                	push   $0x10
80101bc2:	57                   	push   %edi
80101bc3:	56                   	push   %esi
80101bc4:	53                   	push   %ebx
80101bc5:	e8 76 fd ff ff       	call   80101940 <readi>
80101bca:	83 c4 10             	add    $0x10,%esp
80101bcd:	83 f8 10             	cmp    $0x10,%eax
80101bd0:	75 48                	jne    80101c1a <dirlookup+0x8a>
80101bd2:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101bd7:	74 df                	je     80101bb8 <dirlookup+0x28>
80101bd9:	8d 45 da             	lea    -0x26(%ebp),%eax
80101bdc:	83 ec 04             	sub    $0x4,%esp
80101bdf:	6a 0e                	push   $0xe
80101be1:	50                   	push   %eax
80101be2:	ff 75 0c             	pushl  0xc(%ebp)
80101be5:	e8 46 29 00 00       	call   80104530 <strncmp>
80101bea:	83 c4 10             	add    $0x10,%esp
80101bed:	85 c0                	test   %eax,%eax
80101bef:	75 c7                	jne    80101bb8 <dirlookup+0x28>
80101bf1:	8b 45 10             	mov    0x10(%ebp),%eax
80101bf4:	85 c0                	test   %eax,%eax
80101bf6:	74 05                	je     80101bfd <dirlookup+0x6d>
80101bf8:	8b 45 10             	mov    0x10(%ebp),%eax
80101bfb:	89 38                	mov    %edi,(%eax)
80101bfd:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101c01:	8b 03                	mov    (%ebx),%eax
80101c03:	e8 f8 f5 ff ff       	call   80101200 <iget>
80101c08:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c0b:	5b                   	pop    %ebx
80101c0c:	5e                   	pop    %esi
80101c0d:	5f                   	pop    %edi
80101c0e:	5d                   	pop    %ebp
80101c0f:	c3                   	ret    
80101c10:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c13:	31 c0                	xor    %eax,%eax
80101c15:	5b                   	pop    %ebx
80101c16:	5e                   	pop    %esi
80101c17:	5f                   	pop    %edi
80101c18:	5d                   	pop    %ebp
80101c19:	c3                   	ret    
80101c1a:	83 ec 0c             	sub    $0xc,%esp
80101c1d:	68 79 71 10 80       	push   $0x80107179
80101c22:	e8 49 e7 ff ff       	call   80100370 <panic>
80101c27:	83 ec 0c             	sub    $0xc,%esp
80101c2a:	68 67 71 10 80       	push   $0x80107167
80101c2f:	e8 3c e7 ff ff       	call   80100370 <panic>
80101c34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101c3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101c40 <namex>:
80101c40:	55                   	push   %ebp
80101c41:	89 e5                	mov    %esp,%ebp
80101c43:	57                   	push   %edi
80101c44:	56                   	push   %esi
80101c45:	53                   	push   %ebx
80101c46:	89 cf                	mov    %ecx,%edi
80101c48:	89 c3                	mov    %eax,%ebx
80101c4a:	83 ec 1c             	sub    $0x1c,%esp
80101c4d:	80 38 2f             	cmpb   $0x2f,(%eax)
80101c50:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101c53:	0f 84 53 01 00 00    	je     80101dac <namex+0x16c>
80101c59:	e8 12 1b 00 00       	call   80103770 <myproc>
80101c5e:	83 ec 0c             	sub    $0xc,%esp
80101c61:	8b 70 68             	mov    0x68(%eax),%esi
80101c64:	68 e0 09 11 80       	push   $0x801109e0
80101c69:	e8 22 26 00 00       	call   80104290 <acquire>
80101c6e:	83 46 08 01          	addl   $0x1,0x8(%esi)
80101c72:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
80101c79:	e8 32 27 00 00       	call   801043b0 <release>
80101c7e:	83 c4 10             	add    $0x10,%esp
80101c81:	eb 08                	jmp    80101c8b <namex+0x4b>
80101c83:	90                   	nop
80101c84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101c88:	83 c3 01             	add    $0x1,%ebx
80101c8b:	0f b6 03             	movzbl (%ebx),%eax
80101c8e:	3c 2f                	cmp    $0x2f,%al
80101c90:	74 f6                	je     80101c88 <namex+0x48>
80101c92:	84 c0                	test   %al,%al
80101c94:	0f 84 e3 00 00 00    	je     80101d7d <namex+0x13d>
80101c9a:	0f b6 03             	movzbl (%ebx),%eax
80101c9d:	89 da                	mov    %ebx,%edx
80101c9f:	84 c0                	test   %al,%al
80101ca1:	0f 84 ac 00 00 00    	je     80101d53 <namex+0x113>
80101ca7:	3c 2f                	cmp    $0x2f,%al
80101ca9:	75 09                	jne    80101cb4 <namex+0x74>
80101cab:	e9 a3 00 00 00       	jmp    80101d53 <namex+0x113>
80101cb0:	84 c0                	test   %al,%al
80101cb2:	74 0a                	je     80101cbe <namex+0x7e>
80101cb4:	83 c2 01             	add    $0x1,%edx
80101cb7:	0f b6 02             	movzbl (%edx),%eax
80101cba:	3c 2f                	cmp    $0x2f,%al
80101cbc:	75 f2                	jne    80101cb0 <namex+0x70>
80101cbe:	89 d1                	mov    %edx,%ecx
80101cc0:	29 d9                	sub    %ebx,%ecx
80101cc2:	83 f9 0d             	cmp    $0xd,%ecx
80101cc5:	0f 8e 8d 00 00 00    	jle    80101d58 <namex+0x118>
80101ccb:	83 ec 04             	sub    $0x4,%esp
80101cce:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101cd1:	6a 0e                	push   $0xe
80101cd3:	53                   	push   %ebx
80101cd4:	57                   	push   %edi
80101cd5:	e8 d6 27 00 00       	call   801044b0 <memmove>
80101cda:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101cdd:	83 c4 10             	add    $0x10,%esp
80101ce0:	89 d3                	mov    %edx,%ebx
80101ce2:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101ce5:	75 11                	jne    80101cf8 <namex+0xb8>
80101ce7:	89 f6                	mov    %esi,%esi
80101ce9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101cf0:	83 c3 01             	add    $0x1,%ebx
80101cf3:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101cf6:	74 f8                	je     80101cf0 <namex+0xb0>
80101cf8:	83 ec 0c             	sub    $0xc,%esp
80101cfb:	56                   	push   %esi
80101cfc:	e8 5f f9 ff ff       	call   80101660 <ilock>
80101d01:	83 c4 10             	add    $0x10,%esp
80101d04:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101d09:	0f 85 7f 00 00 00    	jne    80101d8e <namex+0x14e>
80101d0f:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101d12:	85 d2                	test   %edx,%edx
80101d14:	74 09                	je     80101d1f <namex+0xdf>
80101d16:	80 3b 00             	cmpb   $0x0,(%ebx)
80101d19:	0f 84 a3 00 00 00    	je     80101dc2 <namex+0x182>
80101d1f:	83 ec 04             	sub    $0x4,%esp
80101d22:	6a 00                	push   $0x0
80101d24:	57                   	push   %edi
80101d25:	56                   	push   %esi
80101d26:	e8 65 fe ff ff       	call   80101b90 <dirlookup>
80101d2b:	83 c4 10             	add    $0x10,%esp
80101d2e:	85 c0                	test   %eax,%eax
80101d30:	74 5c                	je     80101d8e <namex+0x14e>
80101d32:	83 ec 0c             	sub    $0xc,%esp
80101d35:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d38:	56                   	push   %esi
80101d39:	e8 02 fa ff ff       	call   80101740 <iunlock>
80101d3e:	89 34 24             	mov    %esi,(%esp)
80101d41:	e8 4a fa ff ff       	call   80101790 <iput>
80101d46:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101d49:	83 c4 10             	add    $0x10,%esp
80101d4c:	89 c6                	mov    %eax,%esi
80101d4e:	e9 38 ff ff ff       	jmp    80101c8b <namex+0x4b>
80101d53:	31 c9                	xor    %ecx,%ecx
80101d55:	8d 76 00             	lea    0x0(%esi),%esi
80101d58:	83 ec 04             	sub    $0x4,%esp
80101d5b:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101d5e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101d61:	51                   	push   %ecx
80101d62:	53                   	push   %ebx
80101d63:	57                   	push   %edi
80101d64:	e8 47 27 00 00       	call   801044b0 <memmove>
80101d69:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101d6c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101d6f:	83 c4 10             	add    $0x10,%esp
80101d72:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101d76:	89 d3                	mov    %edx,%ebx
80101d78:	e9 65 ff ff ff       	jmp    80101ce2 <namex+0xa2>
80101d7d:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101d80:	85 c0                	test   %eax,%eax
80101d82:	75 54                	jne    80101dd8 <namex+0x198>
80101d84:	89 f0                	mov    %esi,%eax
80101d86:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d89:	5b                   	pop    %ebx
80101d8a:	5e                   	pop    %esi
80101d8b:	5f                   	pop    %edi
80101d8c:	5d                   	pop    %ebp
80101d8d:	c3                   	ret    
80101d8e:	83 ec 0c             	sub    $0xc,%esp
80101d91:	56                   	push   %esi
80101d92:	e8 a9 f9 ff ff       	call   80101740 <iunlock>
80101d97:	89 34 24             	mov    %esi,(%esp)
80101d9a:	e8 f1 f9 ff ff       	call   80101790 <iput>
80101d9f:	83 c4 10             	add    $0x10,%esp
80101da2:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101da5:	31 c0                	xor    %eax,%eax
80101da7:	5b                   	pop    %ebx
80101da8:	5e                   	pop    %esi
80101da9:	5f                   	pop    %edi
80101daa:	5d                   	pop    %ebp
80101dab:	c3                   	ret    
80101dac:	ba 01 00 00 00       	mov    $0x1,%edx
80101db1:	b8 01 00 00 00       	mov    $0x1,%eax
80101db6:	e8 45 f4 ff ff       	call   80101200 <iget>
80101dbb:	89 c6                	mov    %eax,%esi
80101dbd:	e9 c9 fe ff ff       	jmp    80101c8b <namex+0x4b>
80101dc2:	83 ec 0c             	sub    $0xc,%esp
80101dc5:	56                   	push   %esi
80101dc6:	e8 75 f9 ff ff       	call   80101740 <iunlock>
80101dcb:	83 c4 10             	add    $0x10,%esp
80101dce:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101dd1:	89 f0                	mov    %esi,%eax
80101dd3:	5b                   	pop    %ebx
80101dd4:	5e                   	pop    %esi
80101dd5:	5f                   	pop    %edi
80101dd6:	5d                   	pop    %ebp
80101dd7:	c3                   	ret    
80101dd8:	83 ec 0c             	sub    $0xc,%esp
80101ddb:	56                   	push   %esi
80101ddc:	e8 af f9 ff ff       	call   80101790 <iput>
80101de1:	83 c4 10             	add    $0x10,%esp
80101de4:	31 c0                	xor    %eax,%eax
80101de6:	eb 9e                	jmp    80101d86 <namex+0x146>
80101de8:	90                   	nop
80101de9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101df0 <dirlink>:
80101df0:	55                   	push   %ebp
80101df1:	89 e5                	mov    %esp,%ebp
80101df3:	57                   	push   %edi
80101df4:	56                   	push   %esi
80101df5:	53                   	push   %ebx
80101df6:	83 ec 20             	sub    $0x20,%esp
80101df9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101dfc:	6a 00                	push   $0x0
80101dfe:	ff 75 0c             	pushl  0xc(%ebp)
80101e01:	53                   	push   %ebx
80101e02:	e8 89 fd ff ff       	call   80101b90 <dirlookup>
80101e07:	83 c4 10             	add    $0x10,%esp
80101e0a:	85 c0                	test   %eax,%eax
80101e0c:	75 67                	jne    80101e75 <dirlink+0x85>
80101e0e:	8b 7b 58             	mov    0x58(%ebx),%edi
80101e11:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e14:	85 ff                	test   %edi,%edi
80101e16:	74 29                	je     80101e41 <dirlink+0x51>
80101e18:	31 ff                	xor    %edi,%edi
80101e1a:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e1d:	eb 09                	jmp    80101e28 <dirlink+0x38>
80101e1f:	90                   	nop
80101e20:	83 c7 10             	add    $0x10,%edi
80101e23:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101e26:	76 19                	jbe    80101e41 <dirlink+0x51>
80101e28:	6a 10                	push   $0x10
80101e2a:	57                   	push   %edi
80101e2b:	56                   	push   %esi
80101e2c:	53                   	push   %ebx
80101e2d:	e8 0e fb ff ff       	call   80101940 <readi>
80101e32:	83 c4 10             	add    $0x10,%esp
80101e35:	83 f8 10             	cmp    $0x10,%eax
80101e38:	75 4e                	jne    80101e88 <dirlink+0x98>
80101e3a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e3f:	75 df                	jne    80101e20 <dirlink+0x30>
80101e41:	8d 45 da             	lea    -0x26(%ebp),%eax
80101e44:	83 ec 04             	sub    $0x4,%esp
80101e47:	6a 0e                	push   $0xe
80101e49:	ff 75 0c             	pushl  0xc(%ebp)
80101e4c:	50                   	push   %eax
80101e4d:	e8 4e 27 00 00       	call   801045a0 <strncpy>
80101e52:	8b 45 10             	mov    0x10(%ebp),%eax
80101e55:	6a 10                	push   $0x10
80101e57:	57                   	push   %edi
80101e58:	56                   	push   %esi
80101e59:	53                   	push   %ebx
80101e5a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
80101e5e:	e8 dd fb ff ff       	call   80101a40 <writei>
80101e63:	83 c4 20             	add    $0x20,%esp
80101e66:	83 f8 10             	cmp    $0x10,%eax
80101e69:	75 2a                	jne    80101e95 <dirlink+0xa5>
80101e6b:	31 c0                	xor    %eax,%eax
80101e6d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e70:	5b                   	pop    %ebx
80101e71:	5e                   	pop    %esi
80101e72:	5f                   	pop    %edi
80101e73:	5d                   	pop    %ebp
80101e74:	c3                   	ret    
80101e75:	83 ec 0c             	sub    $0xc,%esp
80101e78:	50                   	push   %eax
80101e79:	e8 12 f9 ff ff       	call   80101790 <iput>
80101e7e:	83 c4 10             	add    $0x10,%esp
80101e81:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101e86:	eb e5                	jmp    80101e6d <dirlink+0x7d>
80101e88:	83 ec 0c             	sub    $0xc,%esp
80101e8b:	68 88 71 10 80       	push   $0x80107188
80101e90:	e8 db e4 ff ff       	call   80100370 <panic>
80101e95:	83 ec 0c             	sub    $0xc,%esp
80101e98:	68 86 77 10 80       	push   $0x80107786
80101e9d:	e8 ce e4 ff ff       	call   80100370 <panic>
80101ea2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101ea9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101eb0 <namei>:
80101eb0:	55                   	push   %ebp
80101eb1:	31 d2                	xor    %edx,%edx
80101eb3:	89 e5                	mov    %esp,%ebp
80101eb5:	83 ec 18             	sub    $0x18,%esp
80101eb8:	8b 45 08             	mov    0x8(%ebp),%eax
80101ebb:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101ebe:	e8 7d fd ff ff       	call   80101c40 <namex>
80101ec3:	c9                   	leave  
80101ec4:	c3                   	ret    
80101ec5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ec9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ed0 <nameiparent>:
80101ed0:	55                   	push   %ebp
80101ed1:	ba 01 00 00 00       	mov    $0x1,%edx
80101ed6:	89 e5                	mov    %esp,%ebp
80101ed8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101edb:	8b 45 08             	mov    0x8(%ebp),%eax
80101ede:	5d                   	pop    %ebp
80101edf:	e9 5c fd ff ff       	jmp    80101c40 <namex>
80101ee4:	66 90                	xchg   %ax,%ax
80101ee6:	66 90                	xchg   %ax,%ax
80101ee8:	66 90                	xchg   %ax,%ax
80101eea:	66 90                	xchg   %ax,%ax
80101eec:	66 90                	xchg   %ax,%ax
80101eee:	66 90                	xchg   %ax,%ax

80101ef0 <idestart>:
80101ef0:	55                   	push   %ebp
80101ef1:	85 c0                	test   %eax,%eax
80101ef3:	89 e5                	mov    %esp,%ebp
80101ef5:	56                   	push   %esi
80101ef6:	53                   	push   %ebx
80101ef7:	0f 84 ad 00 00 00    	je     80101faa <idestart+0xba>
80101efd:	8b 58 08             	mov    0x8(%eax),%ebx
80101f00:	89 c1                	mov    %eax,%ecx
80101f02:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101f08:	0f 87 8f 00 00 00    	ja     80101f9d <idestart+0xad>
80101f0e:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f13:	90                   	nop
80101f14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101f18:	ec                   	in     (%dx),%al
80101f19:	83 e0 c0             	and    $0xffffffc0,%eax
80101f1c:	3c 40                	cmp    $0x40,%al
80101f1e:	75 f8                	jne    80101f18 <idestart+0x28>
80101f20:	31 f6                	xor    %esi,%esi
80101f22:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101f27:	89 f0                	mov    %esi,%eax
80101f29:	ee                   	out    %al,(%dx)
80101f2a:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101f2f:	b8 01 00 00 00       	mov    $0x1,%eax
80101f34:	ee                   	out    %al,(%dx)
80101f35:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101f3a:	89 d8                	mov    %ebx,%eax
80101f3c:	ee                   	out    %al,(%dx)
80101f3d:	89 d8                	mov    %ebx,%eax
80101f3f:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101f44:	c1 f8 08             	sar    $0x8,%eax
80101f47:	ee                   	out    %al,(%dx)
80101f48:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101f4d:	89 f0                	mov    %esi,%eax
80101f4f:	ee                   	out    %al,(%dx)
80101f50:	0f b6 41 04          	movzbl 0x4(%ecx),%eax
80101f54:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101f59:	83 e0 01             	and    $0x1,%eax
80101f5c:	c1 e0 04             	shl    $0x4,%eax
80101f5f:	83 c8 e0             	or     $0xffffffe0,%eax
80101f62:	ee                   	out    %al,(%dx)
80101f63:	f6 01 04             	testb  $0x4,(%ecx)
80101f66:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f6b:	75 13                	jne    80101f80 <idestart+0x90>
80101f6d:	b8 20 00 00 00       	mov    $0x20,%eax
80101f72:	ee                   	out    %al,(%dx)
80101f73:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101f76:	5b                   	pop    %ebx
80101f77:	5e                   	pop    %esi
80101f78:	5d                   	pop    %ebp
80101f79:	c3                   	ret    
80101f7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101f80:	b8 30 00 00 00       	mov    $0x30,%eax
80101f85:	ee                   	out    %al,(%dx)
80101f86:	ba f0 01 00 00       	mov    $0x1f0,%edx
80101f8b:	8d 71 5c             	lea    0x5c(%ecx),%esi
80101f8e:	b9 80 00 00 00       	mov    $0x80,%ecx
80101f93:	fc                   	cld    
80101f94:	f3 6f                	rep outsl %ds:(%esi),(%dx)
80101f96:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101f99:	5b                   	pop    %ebx
80101f9a:	5e                   	pop    %esi
80101f9b:	5d                   	pop    %ebp
80101f9c:	c3                   	ret    
80101f9d:	83 ec 0c             	sub    $0xc,%esp
80101fa0:	68 f4 71 10 80       	push   $0x801071f4
80101fa5:	e8 c6 e3 ff ff       	call   80100370 <panic>
80101faa:	83 ec 0c             	sub    $0xc,%esp
80101fad:	68 eb 71 10 80       	push   $0x801071eb
80101fb2:	e8 b9 e3 ff ff       	call   80100370 <panic>
80101fb7:	89 f6                	mov    %esi,%esi
80101fb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101fc0 <ideinit>:
80101fc0:	55                   	push   %ebp
80101fc1:	89 e5                	mov    %esp,%ebp
80101fc3:	83 ec 10             	sub    $0x10,%esp
80101fc6:	68 06 72 10 80       	push   $0x80107206
80101fcb:	68 80 a5 10 80       	push   $0x8010a580
80101fd0:	e8 bb 21 00 00       	call   80104190 <initlock>
80101fd5:	58                   	pop    %eax
80101fd6:	a1 00 2d 11 80       	mov    0x80112d00,%eax
80101fdb:	5a                   	pop    %edx
80101fdc:	83 e8 01             	sub    $0x1,%eax
80101fdf:	50                   	push   %eax
80101fe0:	6a 0e                	push   $0xe
80101fe2:	e8 a9 02 00 00       	call   80102290 <ioapicenable>
80101fe7:	83 c4 10             	add    $0x10,%esp
80101fea:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101fef:	90                   	nop
80101ff0:	ec                   	in     (%dx),%al
80101ff1:	83 e0 c0             	and    $0xffffffc0,%eax
80101ff4:	3c 40                	cmp    $0x40,%al
80101ff6:	75 f8                	jne    80101ff0 <ideinit+0x30>
80101ff8:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101ffd:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
80102002:	ee                   	out    %al,(%dx)
80102003:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
80102008:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010200d:	eb 06                	jmp    80102015 <ideinit+0x55>
8010200f:	90                   	nop
80102010:	83 e9 01             	sub    $0x1,%ecx
80102013:	74 0f                	je     80102024 <ideinit+0x64>
80102015:	ec                   	in     (%dx),%al
80102016:	84 c0                	test   %al,%al
80102018:	74 f6                	je     80102010 <ideinit+0x50>
8010201a:	c7 05 60 a5 10 80 01 	movl   $0x1,0x8010a560
80102021:	00 00 00 
80102024:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102029:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
8010202e:	ee                   	out    %al,(%dx)
8010202f:	c9                   	leave  
80102030:	c3                   	ret    
80102031:	eb 0d                	jmp    80102040 <ideintr>
80102033:	90                   	nop
80102034:	90                   	nop
80102035:	90                   	nop
80102036:	90                   	nop
80102037:	90                   	nop
80102038:	90                   	nop
80102039:	90                   	nop
8010203a:	90                   	nop
8010203b:	90                   	nop
8010203c:	90                   	nop
8010203d:	90                   	nop
8010203e:	90                   	nop
8010203f:	90                   	nop

80102040 <ideintr>:
80102040:	55                   	push   %ebp
80102041:	89 e5                	mov    %esp,%ebp
80102043:	57                   	push   %edi
80102044:	56                   	push   %esi
80102045:	53                   	push   %ebx
80102046:	83 ec 18             	sub    $0x18,%esp
80102049:	68 80 a5 10 80       	push   $0x8010a580
8010204e:	e8 3d 22 00 00       	call   80104290 <acquire>
80102053:	8b 1d 64 a5 10 80    	mov    0x8010a564,%ebx
80102059:	83 c4 10             	add    $0x10,%esp
8010205c:	85 db                	test   %ebx,%ebx
8010205e:	74 34                	je     80102094 <ideintr+0x54>
80102060:	8b 43 58             	mov    0x58(%ebx),%eax
80102063:	a3 64 a5 10 80       	mov    %eax,0x8010a564
80102068:	8b 33                	mov    (%ebx),%esi
8010206a:	f7 c6 04 00 00 00    	test   $0x4,%esi
80102070:	74 3e                	je     801020b0 <ideintr+0x70>
80102072:	83 e6 fb             	and    $0xfffffffb,%esi
80102075:	83 ec 0c             	sub    $0xc,%esp
80102078:	83 ce 02             	or     $0x2,%esi
8010207b:	89 33                	mov    %esi,(%ebx)
8010207d:	53                   	push   %ebx
8010207e:	e8 4d 1e 00 00       	call   80103ed0 <wakeup>
80102083:	a1 64 a5 10 80       	mov    0x8010a564,%eax
80102088:	83 c4 10             	add    $0x10,%esp
8010208b:	85 c0                	test   %eax,%eax
8010208d:	74 05                	je     80102094 <ideintr+0x54>
8010208f:	e8 5c fe ff ff       	call   80101ef0 <idestart>
80102094:	83 ec 0c             	sub    $0xc,%esp
80102097:	68 80 a5 10 80       	push   $0x8010a580
8010209c:	e8 0f 23 00 00       	call   801043b0 <release>
801020a1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801020a4:	5b                   	pop    %ebx
801020a5:	5e                   	pop    %esi
801020a6:	5f                   	pop    %edi
801020a7:	5d                   	pop    %ebp
801020a8:	c3                   	ret    
801020a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801020b0:	ba f7 01 00 00       	mov    $0x1f7,%edx
801020b5:	8d 76 00             	lea    0x0(%esi),%esi
801020b8:	ec                   	in     (%dx),%al
801020b9:	89 c1                	mov    %eax,%ecx
801020bb:	83 e1 c0             	and    $0xffffffc0,%ecx
801020be:	80 f9 40             	cmp    $0x40,%cl
801020c1:	75 f5                	jne    801020b8 <ideintr+0x78>
801020c3:	a8 21                	test   $0x21,%al
801020c5:	75 ab                	jne    80102072 <ideintr+0x32>
801020c7:	8d 7b 5c             	lea    0x5c(%ebx),%edi
801020ca:	b9 80 00 00 00       	mov    $0x80,%ecx
801020cf:	ba f0 01 00 00       	mov    $0x1f0,%edx
801020d4:	fc                   	cld    
801020d5:	f3 6d                	rep insl (%dx),%es:(%edi)
801020d7:	8b 33                	mov    (%ebx),%esi
801020d9:	eb 97                	jmp    80102072 <ideintr+0x32>
801020db:	90                   	nop
801020dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801020e0 <iderw>:
801020e0:	55                   	push   %ebp
801020e1:	89 e5                	mov    %esp,%ebp
801020e3:	53                   	push   %ebx
801020e4:	83 ec 10             	sub    $0x10,%esp
801020e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801020ea:	8d 43 0c             	lea    0xc(%ebx),%eax
801020ed:	50                   	push   %eax
801020ee:	e8 6d 20 00 00       	call   80104160 <holdingsleep>
801020f3:	83 c4 10             	add    $0x10,%esp
801020f6:	85 c0                	test   %eax,%eax
801020f8:	0f 84 ad 00 00 00    	je     801021ab <iderw+0xcb>
801020fe:	8b 03                	mov    (%ebx),%eax
80102100:	83 e0 06             	and    $0x6,%eax
80102103:	83 f8 02             	cmp    $0x2,%eax
80102106:	0f 84 b9 00 00 00    	je     801021c5 <iderw+0xe5>
8010210c:	8b 53 04             	mov    0x4(%ebx),%edx
8010210f:	85 d2                	test   %edx,%edx
80102111:	74 0d                	je     80102120 <iderw+0x40>
80102113:	a1 60 a5 10 80       	mov    0x8010a560,%eax
80102118:	85 c0                	test   %eax,%eax
8010211a:	0f 84 98 00 00 00    	je     801021b8 <iderw+0xd8>
80102120:	83 ec 0c             	sub    $0xc,%esp
80102123:	68 80 a5 10 80       	push   $0x8010a580
80102128:	e8 63 21 00 00       	call   80104290 <acquire>
8010212d:	8b 15 64 a5 10 80    	mov    0x8010a564,%edx
80102133:	83 c4 10             	add    $0x10,%esp
80102136:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
8010213d:	85 d2                	test   %edx,%edx
8010213f:	75 09                	jne    8010214a <iderw+0x6a>
80102141:	eb 58                	jmp    8010219b <iderw+0xbb>
80102143:	90                   	nop
80102144:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102148:	89 c2                	mov    %eax,%edx
8010214a:	8b 42 58             	mov    0x58(%edx),%eax
8010214d:	85 c0                	test   %eax,%eax
8010214f:	75 f7                	jne    80102148 <iderw+0x68>
80102151:	83 c2 58             	add    $0x58,%edx
80102154:	89 1a                	mov    %ebx,(%edx)
80102156:	3b 1d 64 a5 10 80    	cmp    0x8010a564,%ebx
8010215c:	74 44                	je     801021a2 <iderw+0xc2>
8010215e:	8b 03                	mov    (%ebx),%eax
80102160:	83 e0 06             	and    $0x6,%eax
80102163:	83 f8 02             	cmp    $0x2,%eax
80102166:	74 23                	je     8010218b <iderw+0xab>
80102168:	90                   	nop
80102169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102170:	83 ec 08             	sub    $0x8,%esp
80102173:	68 80 a5 10 80       	push   $0x8010a580
80102178:	53                   	push   %ebx
80102179:	e8 a2 1b 00 00       	call   80103d20 <sleep>
8010217e:	8b 03                	mov    (%ebx),%eax
80102180:	83 c4 10             	add    $0x10,%esp
80102183:	83 e0 06             	and    $0x6,%eax
80102186:	83 f8 02             	cmp    $0x2,%eax
80102189:	75 e5                	jne    80102170 <iderw+0x90>
8010218b:	c7 45 08 80 a5 10 80 	movl   $0x8010a580,0x8(%ebp)
80102192:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102195:	c9                   	leave  
80102196:	e9 15 22 00 00       	jmp    801043b0 <release>
8010219b:	ba 64 a5 10 80       	mov    $0x8010a564,%edx
801021a0:	eb b2                	jmp    80102154 <iderw+0x74>
801021a2:	89 d8                	mov    %ebx,%eax
801021a4:	e8 47 fd ff ff       	call   80101ef0 <idestart>
801021a9:	eb b3                	jmp    8010215e <iderw+0x7e>
801021ab:	83 ec 0c             	sub    $0xc,%esp
801021ae:	68 0a 72 10 80       	push   $0x8010720a
801021b3:	e8 b8 e1 ff ff       	call   80100370 <panic>
801021b8:	83 ec 0c             	sub    $0xc,%esp
801021bb:	68 35 72 10 80       	push   $0x80107235
801021c0:	e8 ab e1 ff ff       	call   80100370 <panic>
801021c5:	83 ec 0c             	sub    $0xc,%esp
801021c8:	68 20 72 10 80       	push   $0x80107220
801021cd:	e8 9e e1 ff ff       	call   80100370 <panic>
801021d2:	66 90                	xchg   %ax,%ax
801021d4:	66 90                	xchg   %ax,%ax
801021d6:	66 90                	xchg   %ax,%ax
801021d8:	66 90                	xchg   %ax,%ax
801021da:	66 90                	xchg   %ax,%ax
801021dc:	66 90                	xchg   %ax,%ax
801021de:	66 90                	xchg   %ax,%ax

801021e0 <ioapicinit>:
801021e0:	55                   	push   %ebp
801021e1:	c7 05 34 26 11 80 00 	movl   $0xfec00000,0x80112634
801021e8:	00 c0 fe 
801021eb:	89 e5                	mov    %esp,%ebp
801021ed:	56                   	push   %esi
801021ee:	53                   	push   %ebx
801021ef:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
801021f6:	00 00 00 
801021f9:	8b 15 34 26 11 80    	mov    0x80112634,%edx
801021ff:	8b 72 10             	mov    0x10(%edx),%esi
80102202:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
80102208:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
8010220e:	0f b6 15 60 27 11 80 	movzbl 0x80112760,%edx
80102215:	89 f0                	mov    %esi,%eax
80102217:	c1 e8 10             	shr    $0x10,%eax
8010221a:	0f b6 f0             	movzbl %al,%esi
8010221d:	8b 41 10             	mov    0x10(%ecx),%eax
80102220:	c1 e8 18             	shr    $0x18,%eax
80102223:	39 d0                	cmp    %edx,%eax
80102225:	74 16                	je     8010223d <ioapicinit+0x5d>
80102227:	83 ec 0c             	sub    $0xc,%esp
8010222a:	68 54 72 10 80       	push   $0x80107254
8010222f:	e8 2c e4 ff ff       	call   80100660 <cprintf>
80102234:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
8010223a:	83 c4 10             	add    $0x10,%esp
8010223d:	83 c6 21             	add    $0x21,%esi
80102240:	ba 10 00 00 00       	mov    $0x10,%edx
80102245:	b8 20 00 00 00       	mov    $0x20,%eax
8010224a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102250:	89 11                	mov    %edx,(%ecx)
80102252:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
80102258:	89 c3                	mov    %eax,%ebx
8010225a:	81 cb 00 00 01 00    	or     $0x10000,%ebx
80102260:	83 c0 01             	add    $0x1,%eax
80102263:	89 59 10             	mov    %ebx,0x10(%ecx)
80102266:	8d 5a 01             	lea    0x1(%edx),%ebx
80102269:	83 c2 02             	add    $0x2,%edx
8010226c:	39 f0                	cmp    %esi,%eax
8010226e:	89 19                	mov    %ebx,(%ecx)
80102270:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
80102276:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
8010227d:	75 d1                	jne    80102250 <ioapicinit+0x70>
8010227f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102282:	5b                   	pop    %ebx
80102283:	5e                   	pop    %esi
80102284:	5d                   	pop    %ebp
80102285:	c3                   	ret    
80102286:	8d 76 00             	lea    0x0(%esi),%esi
80102289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102290 <ioapicenable>:
80102290:	55                   	push   %ebp
80102291:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
80102297:	89 e5                	mov    %esp,%ebp
80102299:	8b 45 08             	mov    0x8(%ebp),%eax
8010229c:	8d 50 20             	lea    0x20(%eax),%edx
8010229f:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
801022a3:	89 01                	mov    %eax,(%ecx)
801022a5:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
801022ab:	83 c0 01             	add    $0x1,%eax
801022ae:	89 51 10             	mov    %edx,0x10(%ecx)
801022b1:	8b 55 0c             	mov    0xc(%ebp),%edx
801022b4:	89 01                	mov    %eax,(%ecx)
801022b6:	a1 34 26 11 80       	mov    0x80112634,%eax
801022bb:	c1 e2 18             	shl    $0x18,%edx
801022be:	89 50 10             	mov    %edx,0x10(%eax)
801022c1:	5d                   	pop    %ebp
801022c2:	c3                   	ret    
801022c3:	66 90                	xchg   %ax,%ax
801022c5:	66 90                	xchg   %ax,%ax
801022c7:	66 90                	xchg   %ax,%ax
801022c9:	66 90                	xchg   %ax,%ax
801022cb:	66 90                	xchg   %ax,%ax
801022cd:	66 90                	xchg   %ax,%ax
801022cf:	90                   	nop

801022d0 <kfree>:
801022d0:	55                   	push   %ebp
801022d1:	89 e5                	mov    %esp,%ebp
801022d3:	53                   	push   %ebx
801022d4:	83 ec 04             	sub    $0x4,%esp
801022d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801022da:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
801022e0:	75 70                	jne    80102352 <kfree+0x82>
801022e2:	81 fb f4 58 11 80    	cmp    $0x801158f4,%ebx
801022e8:	72 68                	jb     80102352 <kfree+0x82>
801022ea:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801022f0:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
801022f5:	77 5b                	ja     80102352 <kfree+0x82>
801022f7:	83 ec 04             	sub    $0x4,%esp
801022fa:	68 00 10 00 00       	push   $0x1000
801022ff:	6a 01                	push   $0x1
80102301:	53                   	push   %ebx
80102302:	e8 f9 20 00 00       	call   80104400 <memset>
80102307:	8b 15 74 26 11 80    	mov    0x80112674,%edx
8010230d:	83 c4 10             	add    $0x10,%esp
80102310:	85 d2                	test   %edx,%edx
80102312:	75 2c                	jne    80102340 <kfree+0x70>
80102314:	a1 78 26 11 80       	mov    0x80112678,%eax
80102319:	89 03                	mov    %eax,(%ebx)
8010231b:	a1 74 26 11 80       	mov    0x80112674,%eax
80102320:	89 1d 78 26 11 80    	mov    %ebx,0x80112678
80102326:	85 c0                	test   %eax,%eax
80102328:	75 06                	jne    80102330 <kfree+0x60>
8010232a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010232d:	c9                   	leave  
8010232e:	c3                   	ret    
8010232f:	90                   	nop
80102330:	c7 45 08 40 26 11 80 	movl   $0x80112640,0x8(%ebp)
80102337:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010233a:	c9                   	leave  
8010233b:	e9 70 20 00 00       	jmp    801043b0 <release>
80102340:	83 ec 0c             	sub    $0xc,%esp
80102343:	68 40 26 11 80       	push   $0x80112640
80102348:	e8 43 1f 00 00       	call   80104290 <acquire>
8010234d:	83 c4 10             	add    $0x10,%esp
80102350:	eb c2                	jmp    80102314 <kfree+0x44>
80102352:	83 ec 0c             	sub    $0xc,%esp
80102355:	68 86 72 10 80       	push   $0x80107286
8010235a:	e8 11 e0 ff ff       	call   80100370 <panic>
8010235f:	90                   	nop

80102360 <freerange>:
80102360:	55                   	push   %ebp
80102361:	89 e5                	mov    %esp,%ebp
80102363:	56                   	push   %esi
80102364:	53                   	push   %ebx
80102365:	8b 45 08             	mov    0x8(%ebp),%eax
80102368:	8b 75 0c             	mov    0xc(%ebp),%esi
8010236b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102371:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102377:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010237d:	39 de                	cmp    %ebx,%esi
8010237f:	72 23                	jb     801023a4 <freerange+0x44>
80102381:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102388:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010238e:	83 ec 0c             	sub    $0xc,%esp
80102391:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102397:	50                   	push   %eax
80102398:	e8 33 ff ff ff       	call   801022d0 <kfree>
8010239d:	83 c4 10             	add    $0x10,%esp
801023a0:	39 f3                	cmp    %esi,%ebx
801023a2:	76 e4                	jbe    80102388 <freerange+0x28>
801023a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023a7:	5b                   	pop    %ebx
801023a8:	5e                   	pop    %esi
801023a9:	5d                   	pop    %ebp
801023aa:	c3                   	ret    
801023ab:	90                   	nop
801023ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801023b0 <kinit1>:
801023b0:	55                   	push   %ebp
801023b1:	89 e5                	mov    %esp,%ebp
801023b3:	56                   	push   %esi
801023b4:	53                   	push   %ebx
801023b5:	8b 75 0c             	mov    0xc(%ebp),%esi
801023b8:	83 ec 08             	sub    $0x8,%esp
801023bb:	68 8c 72 10 80       	push   $0x8010728c
801023c0:	68 40 26 11 80       	push   $0x80112640
801023c5:	e8 c6 1d 00 00       	call   80104190 <initlock>
801023ca:	8b 45 08             	mov    0x8(%ebp),%eax
801023cd:	83 c4 10             	add    $0x10,%esp
801023d0:	c7 05 74 26 11 80 00 	movl   $0x0,0x80112674
801023d7:	00 00 00 
801023da:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801023e0:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801023e6:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023ec:	39 de                	cmp    %ebx,%esi
801023ee:	72 1c                	jb     8010240c <kinit1+0x5c>
801023f0:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801023f6:	83 ec 0c             	sub    $0xc,%esp
801023f9:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023ff:	50                   	push   %eax
80102400:	e8 cb fe ff ff       	call   801022d0 <kfree>
80102405:	83 c4 10             	add    $0x10,%esp
80102408:	39 de                	cmp    %ebx,%esi
8010240a:	73 e4                	jae    801023f0 <kinit1+0x40>
8010240c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010240f:	5b                   	pop    %ebx
80102410:	5e                   	pop    %esi
80102411:	5d                   	pop    %ebp
80102412:	c3                   	ret    
80102413:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102420 <kinit2>:
80102420:	55                   	push   %ebp
80102421:	89 e5                	mov    %esp,%ebp
80102423:	56                   	push   %esi
80102424:	53                   	push   %ebx
80102425:	8b 45 08             	mov    0x8(%ebp),%eax
80102428:	8b 75 0c             	mov    0xc(%ebp),%esi
8010242b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102431:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102437:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010243d:	39 de                	cmp    %ebx,%esi
8010243f:	72 23                	jb     80102464 <kinit2+0x44>
80102441:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102448:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010244e:	83 ec 0c             	sub    $0xc,%esp
80102451:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102457:	50                   	push   %eax
80102458:	e8 73 fe ff ff       	call   801022d0 <kfree>
8010245d:	83 c4 10             	add    $0x10,%esp
80102460:	39 de                	cmp    %ebx,%esi
80102462:	73 e4                	jae    80102448 <kinit2+0x28>
80102464:	c7 05 74 26 11 80 01 	movl   $0x1,0x80112674
8010246b:	00 00 00 
8010246e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102471:	5b                   	pop    %ebx
80102472:	5e                   	pop    %esi
80102473:	5d                   	pop    %ebp
80102474:	c3                   	ret    
80102475:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102479:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102480 <kalloc>:
80102480:	55                   	push   %ebp
80102481:	89 e5                	mov    %esp,%ebp
80102483:	53                   	push   %ebx
80102484:	83 ec 04             	sub    $0x4,%esp
80102487:	a1 74 26 11 80       	mov    0x80112674,%eax
8010248c:	85 c0                	test   %eax,%eax
8010248e:	75 30                	jne    801024c0 <kalloc+0x40>
80102490:	8b 1d 78 26 11 80    	mov    0x80112678,%ebx
80102496:	85 db                	test   %ebx,%ebx
80102498:	74 1c                	je     801024b6 <kalloc+0x36>
8010249a:	8b 13                	mov    (%ebx),%edx
8010249c:	89 15 78 26 11 80    	mov    %edx,0x80112678
801024a2:	85 c0                	test   %eax,%eax
801024a4:	74 10                	je     801024b6 <kalloc+0x36>
801024a6:	83 ec 0c             	sub    $0xc,%esp
801024a9:	68 40 26 11 80       	push   $0x80112640
801024ae:	e8 fd 1e 00 00       	call   801043b0 <release>
801024b3:	83 c4 10             	add    $0x10,%esp
801024b6:	89 d8                	mov    %ebx,%eax
801024b8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801024bb:	c9                   	leave  
801024bc:	c3                   	ret    
801024bd:	8d 76 00             	lea    0x0(%esi),%esi
801024c0:	83 ec 0c             	sub    $0xc,%esp
801024c3:	68 40 26 11 80       	push   $0x80112640
801024c8:	e8 c3 1d 00 00       	call   80104290 <acquire>
801024cd:	8b 1d 78 26 11 80    	mov    0x80112678,%ebx
801024d3:	83 c4 10             	add    $0x10,%esp
801024d6:	a1 74 26 11 80       	mov    0x80112674,%eax
801024db:	85 db                	test   %ebx,%ebx
801024dd:	75 bb                	jne    8010249a <kalloc+0x1a>
801024df:	eb c1                	jmp    801024a2 <kalloc+0x22>
801024e1:	66 90                	xchg   %ax,%ax
801024e3:	66 90                	xchg   %ax,%ax
801024e5:	66 90                	xchg   %ax,%ax
801024e7:	66 90                	xchg   %ax,%ax
801024e9:	66 90                	xchg   %ax,%ax
801024eb:	66 90                	xchg   %ax,%ax
801024ed:	66 90                	xchg   %ax,%ax
801024ef:	90                   	nop

801024f0 <kbdgetc>:
801024f0:	55                   	push   %ebp
801024f1:	ba 64 00 00 00       	mov    $0x64,%edx
801024f6:	89 e5                	mov    %esp,%ebp
801024f8:	ec                   	in     (%dx),%al
801024f9:	a8 01                	test   $0x1,%al
801024fb:	0f 84 af 00 00 00    	je     801025b0 <kbdgetc+0xc0>
80102501:	ba 60 00 00 00       	mov    $0x60,%edx
80102506:	ec                   	in     (%dx),%al
80102507:	0f b6 d0             	movzbl %al,%edx
8010250a:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
80102510:	74 7e                	je     80102590 <kbdgetc+0xa0>
80102512:	84 c0                	test   %al,%al
80102514:	8b 0d b4 a5 10 80    	mov    0x8010a5b4,%ecx
8010251a:	79 24                	jns    80102540 <kbdgetc+0x50>
8010251c:	f6 c1 40             	test   $0x40,%cl
8010251f:	75 05                	jne    80102526 <kbdgetc+0x36>
80102521:	89 c2                	mov    %eax,%edx
80102523:	83 e2 7f             	and    $0x7f,%edx
80102526:	0f b6 82 c0 73 10 80 	movzbl -0x7fef8c40(%edx),%eax
8010252d:	83 c8 40             	or     $0x40,%eax
80102530:	0f b6 c0             	movzbl %al,%eax
80102533:	f7 d0                	not    %eax
80102535:	21 c8                	and    %ecx,%eax
80102537:	a3 b4 a5 10 80       	mov    %eax,0x8010a5b4
8010253c:	31 c0                	xor    %eax,%eax
8010253e:	5d                   	pop    %ebp
8010253f:	c3                   	ret    
80102540:	f6 c1 40             	test   $0x40,%cl
80102543:	74 09                	je     8010254e <kbdgetc+0x5e>
80102545:	83 c8 80             	or     $0xffffff80,%eax
80102548:	83 e1 bf             	and    $0xffffffbf,%ecx
8010254b:	0f b6 d0             	movzbl %al,%edx
8010254e:	0f b6 82 c0 73 10 80 	movzbl -0x7fef8c40(%edx),%eax
80102555:	09 c1                	or     %eax,%ecx
80102557:	0f b6 82 c0 72 10 80 	movzbl -0x7fef8d40(%edx),%eax
8010255e:	31 c1                	xor    %eax,%ecx
80102560:	89 c8                	mov    %ecx,%eax
80102562:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
80102568:	83 e0 03             	and    $0x3,%eax
8010256b:	83 e1 08             	and    $0x8,%ecx
8010256e:	8b 04 85 a0 72 10 80 	mov    -0x7fef8d60(,%eax,4),%eax
80102575:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
80102579:	74 c3                	je     8010253e <kbdgetc+0x4e>
8010257b:	8d 50 9f             	lea    -0x61(%eax),%edx
8010257e:	83 fa 19             	cmp    $0x19,%edx
80102581:	77 1d                	ja     801025a0 <kbdgetc+0xb0>
80102583:	83 e8 20             	sub    $0x20,%eax
80102586:	5d                   	pop    %ebp
80102587:	c3                   	ret    
80102588:	90                   	nop
80102589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102590:	31 c0                	xor    %eax,%eax
80102592:	83 0d b4 a5 10 80 40 	orl    $0x40,0x8010a5b4
80102599:	5d                   	pop    %ebp
8010259a:	c3                   	ret    
8010259b:	90                   	nop
8010259c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801025a0:	8d 48 bf             	lea    -0x41(%eax),%ecx
801025a3:	8d 50 20             	lea    0x20(%eax),%edx
801025a6:	5d                   	pop    %ebp
801025a7:	83 f9 19             	cmp    $0x19,%ecx
801025aa:	0f 46 c2             	cmovbe %edx,%eax
801025ad:	c3                   	ret    
801025ae:	66 90                	xchg   %ax,%ax
801025b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801025b5:	5d                   	pop    %ebp
801025b6:	c3                   	ret    
801025b7:	89 f6                	mov    %esi,%esi
801025b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801025c0 <kbdintr>:
801025c0:	55                   	push   %ebp
801025c1:	89 e5                	mov    %esp,%ebp
801025c3:	83 ec 14             	sub    $0x14,%esp
801025c6:	68 f0 24 10 80       	push   $0x801024f0
801025cb:	e8 20 e2 ff ff       	call   801007f0 <consoleintr>
801025d0:	83 c4 10             	add    $0x10,%esp
801025d3:	c9                   	leave  
801025d4:	c3                   	ret    
801025d5:	66 90                	xchg   %ax,%ax
801025d7:	66 90                	xchg   %ax,%ax
801025d9:	66 90                	xchg   %ax,%ax
801025db:	66 90                	xchg   %ax,%ax
801025dd:	66 90                	xchg   %ax,%ax
801025df:	90                   	nop

801025e0 <lapicinit>:
801025e0:	a1 7c 26 11 80       	mov    0x8011267c,%eax
801025e5:	55                   	push   %ebp
801025e6:	89 e5                	mov    %esp,%ebp
801025e8:	85 c0                	test   %eax,%eax
801025ea:	0f 84 c8 00 00 00    	je     801026b8 <lapicinit+0xd8>
801025f0:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
801025f7:	01 00 00 
801025fa:	8b 50 20             	mov    0x20(%eax),%edx
801025fd:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102604:	00 00 00 
80102607:	8b 50 20             	mov    0x20(%eax),%edx
8010260a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
80102611:	00 02 00 
80102614:	8b 50 20             	mov    0x20(%eax),%edx
80102617:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010261e:	96 98 00 
80102621:	8b 50 20             	mov    0x20(%eax),%edx
80102624:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
8010262b:	00 01 00 
8010262e:	8b 50 20             	mov    0x20(%eax),%edx
80102631:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102638:	00 01 00 
8010263b:	8b 50 20             	mov    0x20(%eax),%edx
8010263e:	8b 50 30             	mov    0x30(%eax),%edx
80102641:	c1 ea 10             	shr    $0x10,%edx
80102644:	80 fa 03             	cmp    $0x3,%dl
80102647:	77 77                	ja     801026c0 <lapicinit+0xe0>
80102649:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80102650:	00 00 00 
80102653:	8b 50 20             	mov    0x20(%eax),%edx
80102656:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010265d:	00 00 00 
80102660:	8b 50 20             	mov    0x20(%eax),%edx
80102663:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010266a:	00 00 00 
8010266d:	8b 50 20             	mov    0x20(%eax),%edx
80102670:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102677:	00 00 00 
8010267a:	8b 50 20             	mov    0x20(%eax),%edx
8010267d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102684:	00 00 00 
80102687:	8b 50 20             	mov    0x20(%eax),%edx
8010268a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
80102691:	85 08 00 
80102694:	8b 50 20             	mov    0x20(%eax),%edx
80102697:	89 f6                	mov    %esi,%esi
80102699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801026a0:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
801026a6:	80 e6 10             	and    $0x10,%dh
801026a9:	75 f5                	jne    801026a0 <lapicinit+0xc0>
801026ab:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
801026b2:	00 00 00 
801026b5:	8b 40 20             	mov    0x20(%eax),%eax
801026b8:	5d                   	pop    %ebp
801026b9:	c3                   	ret    
801026ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801026c0:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
801026c7:	00 01 00 
801026ca:	8b 50 20             	mov    0x20(%eax),%edx
801026cd:	e9 77 ff ff ff       	jmp    80102649 <lapicinit+0x69>
801026d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801026d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801026e0 <lapicid>:
801026e0:	a1 7c 26 11 80       	mov    0x8011267c,%eax
801026e5:	55                   	push   %ebp
801026e6:	89 e5                	mov    %esp,%ebp
801026e8:	85 c0                	test   %eax,%eax
801026ea:	74 0c                	je     801026f8 <lapicid+0x18>
801026ec:	8b 40 20             	mov    0x20(%eax),%eax
801026ef:	5d                   	pop    %ebp
801026f0:	c1 e8 18             	shr    $0x18,%eax
801026f3:	c3                   	ret    
801026f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801026f8:	31 c0                	xor    %eax,%eax
801026fa:	5d                   	pop    %ebp
801026fb:	c3                   	ret    
801026fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102700 <lapiceoi>:
80102700:	a1 7c 26 11 80       	mov    0x8011267c,%eax
80102705:	55                   	push   %ebp
80102706:	89 e5                	mov    %esp,%ebp
80102708:	85 c0                	test   %eax,%eax
8010270a:	74 0d                	je     80102719 <lapiceoi+0x19>
8010270c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102713:	00 00 00 
80102716:	8b 40 20             	mov    0x20(%eax),%eax
80102719:	5d                   	pop    %ebp
8010271a:	c3                   	ret    
8010271b:	90                   	nop
8010271c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102720 <microdelay>:
80102720:	55                   	push   %ebp
80102721:	89 e5                	mov    %esp,%ebp
80102723:	5d                   	pop    %ebp
80102724:	c3                   	ret    
80102725:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102730 <lapicstartap>:
80102730:	55                   	push   %ebp
80102731:	ba 70 00 00 00       	mov    $0x70,%edx
80102736:	b8 0f 00 00 00       	mov    $0xf,%eax
8010273b:	89 e5                	mov    %esp,%ebp
8010273d:	53                   	push   %ebx
8010273e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102741:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102744:	ee                   	out    %al,(%dx)
80102745:	ba 71 00 00 00       	mov    $0x71,%edx
8010274a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010274f:	ee                   	out    %al,(%dx)
80102750:	31 c0                	xor    %eax,%eax
80102752:	c1 e3 18             	shl    $0x18,%ebx
80102755:	66 a3 67 04 00 80    	mov    %ax,0x80000467
8010275b:	89 c8                	mov    %ecx,%eax
8010275d:	c1 e9 0c             	shr    $0xc,%ecx
80102760:	c1 e8 04             	shr    $0x4,%eax
80102763:	89 da                	mov    %ebx,%edx
80102765:	80 cd 06             	or     $0x6,%ch
80102768:	66 a3 69 04 00 80    	mov    %ax,0x80000469
8010276e:	a1 7c 26 11 80       	mov    0x8011267c,%eax
80102773:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
80102779:	8b 58 20             	mov    0x20(%eax),%ebx
8010277c:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80102783:	c5 00 00 
80102786:	8b 58 20             	mov    0x20(%eax),%ebx
80102789:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
80102790:	85 00 00 
80102793:	8b 58 20             	mov    0x20(%eax),%ebx
80102796:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
8010279c:	8b 58 20             	mov    0x20(%eax),%ebx
8010279f:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
801027a5:	8b 58 20             	mov    0x20(%eax),%ebx
801027a8:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
801027ae:	8b 50 20             	mov    0x20(%eax),%edx
801027b1:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
801027b7:	8b 40 20             	mov    0x20(%eax),%eax
801027ba:	5b                   	pop    %ebx
801027bb:	5d                   	pop    %ebp
801027bc:	c3                   	ret    
801027bd:	8d 76 00             	lea    0x0(%esi),%esi

801027c0 <cmostime>:
801027c0:	55                   	push   %ebp
801027c1:	ba 70 00 00 00       	mov    $0x70,%edx
801027c6:	b8 0b 00 00 00       	mov    $0xb,%eax
801027cb:	89 e5                	mov    %esp,%ebp
801027cd:	57                   	push   %edi
801027ce:	56                   	push   %esi
801027cf:	53                   	push   %ebx
801027d0:	83 ec 4c             	sub    $0x4c,%esp
801027d3:	ee                   	out    %al,(%dx)
801027d4:	ba 71 00 00 00       	mov    $0x71,%edx
801027d9:	ec                   	in     (%dx),%al
801027da:	83 e0 04             	and    $0x4,%eax
801027dd:	8d 75 d0             	lea    -0x30(%ebp),%esi
801027e0:	31 db                	xor    %ebx,%ebx
801027e2:	88 45 b7             	mov    %al,-0x49(%ebp)
801027e5:	bf 70 00 00 00       	mov    $0x70,%edi
801027ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801027f0:	89 d8                	mov    %ebx,%eax
801027f2:	89 fa                	mov    %edi,%edx
801027f4:	ee                   	out    %al,(%dx)
801027f5:	b9 71 00 00 00       	mov    $0x71,%ecx
801027fa:	89 ca                	mov    %ecx,%edx
801027fc:	ec                   	in     (%dx),%al
801027fd:	0f b6 c0             	movzbl %al,%eax
80102800:	89 fa                	mov    %edi,%edx
80102802:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102805:	b8 02 00 00 00       	mov    $0x2,%eax
8010280a:	ee                   	out    %al,(%dx)
8010280b:	89 ca                	mov    %ecx,%edx
8010280d:	ec                   	in     (%dx),%al
8010280e:	0f b6 c0             	movzbl %al,%eax
80102811:	89 fa                	mov    %edi,%edx
80102813:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102816:	b8 04 00 00 00       	mov    $0x4,%eax
8010281b:	ee                   	out    %al,(%dx)
8010281c:	89 ca                	mov    %ecx,%edx
8010281e:	ec                   	in     (%dx),%al
8010281f:	0f b6 c0             	movzbl %al,%eax
80102822:	89 fa                	mov    %edi,%edx
80102824:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102827:	b8 07 00 00 00       	mov    $0x7,%eax
8010282c:	ee                   	out    %al,(%dx)
8010282d:	89 ca                	mov    %ecx,%edx
8010282f:	ec                   	in     (%dx),%al
80102830:	0f b6 c0             	movzbl %al,%eax
80102833:	89 fa                	mov    %edi,%edx
80102835:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102838:	b8 08 00 00 00       	mov    $0x8,%eax
8010283d:	ee                   	out    %al,(%dx)
8010283e:	89 ca                	mov    %ecx,%edx
80102840:	ec                   	in     (%dx),%al
80102841:	0f b6 c0             	movzbl %al,%eax
80102844:	89 fa                	mov    %edi,%edx
80102846:	89 45 c8             	mov    %eax,-0x38(%ebp)
80102849:	b8 09 00 00 00       	mov    $0x9,%eax
8010284e:	ee                   	out    %al,(%dx)
8010284f:	89 ca                	mov    %ecx,%edx
80102851:	ec                   	in     (%dx),%al
80102852:	0f b6 c0             	movzbl %al,%eax
80102855:	89 fa                	mov    %edi,%edx
80102857:	89 45 cc             	mov    %eax,-0x34(%ebp)
8010285a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010285f:	ee                   	out    %al,(%dx)
80102860:	89 ca                	mov    %ecx,%edx
80102862:	ec                   	in     (%dx),%al
80102863:	84 c0                	test   %al,%al
80102865:	78 89                	js     801027f0 <cmostime+0x30>
80102867:	89 d8                	mov    %ebx,%eax
80102869:	89 fa                	mov    %edi,%edx
8010286b:	ee                   	out    %al,(%dx)
8010286c:	89 ca                	mov    %ecx,%edx
8010286e:	ec                   	in     (%dx),%al
8010286f:	0f b6 c0             	movzbl %al,%eax
80102872:	89 fa                	mov    %edi,%edx
80102874:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102877:	b8 02 00 00 00       	mov    $0x2,%eax
8010287c:	ee                   	out    %al,(%dx)
8010287d:	89 ca                	mov    %ecx,%edx
8010287f:	ec                   	in     (%dx),%al
80102880:	0f b6 c0             	movzbl %al,%eax
80102883:	89 fa                	mov    %edi,%edx
80102885:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102888:	b8 04 00 00 00       	mov    $0x4,%eax
8010288d:	ee                   	out    %al,(%dx)
8010288e:	89 ca                	mov    %ecx,%edx
80102890:	ec                   	in     (%dx),%al
80102891:	0f b6 c0             	movzbl %al,%eax
80102894:	89 fa                	mov    %edi,%edx
80102896:	89 45 d8             	mov    %eax,-0x28(%ebp)
80102899:	b8 07 00 00 00       	mov    $0x7,%eax
8010289e:	ee                   	out    %al,(%dx)
8010289f:	89 ca                	mov    %ecx,%edx
801028a1:	ec                   	in     (%dx),%al
801028a2:	0f b6 c0             	movzbl %al,%eax
801028a5:	89 fa                	mov    %edi,%edx
801028a7:	89 45 dc             	mov    %eax,-0x24(%ebp)
801028aa:	b8 08 00 00 00       	mov    $0x8,%eax
801028af:	ee                   	out    %al,(%dx)
801028b0:	89 ca                	mov    %ecx,%edx
801028b2:	ec                   	in     (%dx),%al
801028b3:	0f b6 c0             	movzbl %al,%eax
801028b6:	89 fa                	mov    %edi,%edx
801028b8:	89 45 e0             	mov    %eax,-0x20(%ebp)
801028bb:	b8 09 00 00 00       	mov    $0x9,%eax
801028c0:	ee                   	out    %al,(%dx)
801028c1:	89 ca                	mov    %ecx,%edx
801028c3:	ec                   	in     (%dx),%al
801028c4:	0f b6 c0             	movzbl %al,%eax
801028c7:	83 ec 04             	sub    $0x4,%esp
801028ca:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801028cd:	8d 45 b8             	lea    -0x48(%ebp),%eax
801028d0:	6a 18                	push   $0x18
801028d2:	56                   	push   %esi
801028d3:	50                   	push   %eax
801028d4:	e8 77 1b 00 00       	call   80104450 <memcmp>
801028d9:	83 c4 10             	add    $0x10,%esp
801028dc:	85 c0                	test   %eax,%eax
801028de:	0f 85 0c ff ff ff    	jne    801027f0 <cmostime+0x30>
801028e4:	80 7d b7 00          	cmpb   $0x0,-0x49(%ebp)
801028e8:	75 78                	jne    80102962 <cmostime+0x1a2>
801028ea:	8b 45 b8             	mov    -0x48(%ebp),%eax
801028ed:	89 c2                	mov    %eax,%edx
801028ef:	83 e0 0f             	and    $0xf,%eax
801028f2:	c1 ea 04             	shr    $0x4,%edx
801028f5:	8d 14 92             	lea    (%edx,%edx,4),%edx
801028f8:	8d 04 50             	lea    (%eax,%edx,2),%eax
801028fb:	89 45 b8             	mov    %eax,-0x48(%ebp)
801028fe:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102901:	89 c2                	mov    %eax,%edx
80102903:	83 e0 0f             	and    $0xf,%eax
80102906:	c1 ea 04             	shr    $0x4,%edx
80102909:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010290c:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010290f:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102912:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102915:	89 c2                	mov    %eax,%edx
80102917:	83 e0 0f             	and    $0xf,%eax
8010291a:	c1 ea 04             	shr    $0x4,%edx
8010291d:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102920:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102923:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102926:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102929:	89 c2                	mov    %eax,%edx
8010292b:	83 e0 0f             	and    $0xf,%eax
8010292e:	c1 ea 04             	shr    $0x4,%edx
80102931:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102934:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102937:	89 45 c4             	mov    %eax,-0x3c(%ebp)
8010293a:	8b 45 c8             	mov    -0x38(%ebp),%eax
8010293d:	89 c2                	mov    %eax,%edx
8010293f:	83 e0 0f             	and    $0xf,%eax
80102942:	c1 ea 04             	shr    $0x4,%edx
80102945:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102948:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010294b:	89 45 c8             	mov    %eax,-0x38(%ebp)
8010294e:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102951:	89 c2                	mov    %eax,%edx
80102953:	83 e0 0f             	and    $0xf,%eax
80102956:	c1 ea 04             	shr    $0x4,%edx
80102959:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010295c:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010295f:	89 45 cc             	mov    %eax,-0x34(%ebp)
80102962:	8b 75 08             	mov    0x8(%ebp),%esi
80102965:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102968:	89 06                	mov    %eax,(%esi)
8010296a:	8b 45 bc             	mov    -0x44(%ebp),%eax
8010296d:	89 46 04             	mov    %eax,0x4(%esi)
80102970:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102973:	89 46 08             	mov    %eax,0x8(%esi)
80102976:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102979:	89 46 0c             	mov    %eax,0xc(%esi)
8010297c:	8b 45 c8             	mov    -0x38(%ebp),%eax
8010297f:	89 46 10             	mov    %eax,0x10(%esi)
80102982:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102985:	89 46 14             	mov    %eax,0x14(%esi)
80102988:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
8010298f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102992:	5b                   	pop    %ebx
80102993:	5e                   	pop    %esi
80102994:	5f                   	pop    %edi
80102995:	5d                   	pop    %ebp
80102996:	c3                   	ret    
80102997:	66 90                	xchg   %ax,%ax
80102999:	66 90                	xchg   %ax,%ax
8010299b:	66 90                	xchg   %ax,%ax
8010299d:	66 90                	xchg   %ax,%ax
8010299f:	90                   	nop

801029a0 <install_trans>:
801029a0:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
801029a6:	85 c9                	test   %ecx,%ecx
801029a8:	0f 8e 85 00 00 00    	jle    80102a33 <install_trans+0x93>
801029ae:	55                   	push   %ebp
801029af:	89 e5                	mov    %esp,%ebp
801029b1:	57                   	push   %edi
801029b2:	56                   	push   %esi
801029b3:	53                   	push   %ebx
801029b4:	31 db                	xor    %ebx,%ebx
801029b6:	83 ec 0c             	sub    $0xc,%esp
801029b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801029c0:	a1 b4 26 11 80       	mov    0x801126b4,%eax
801029c5:	83 ec 08             	sub    $0x8,%esp
801029c8:	01 d8                	add    %ebx,%eax
801029ca:	83 c0 01             	add    $0x1,%eax
801029cd:	50                   	push   %eax
801029ce:	ff 35 c4 26 11 80    	pushl  0x801126c4
801029d4:	e8 f7 d6 ff ff       	call   801000d0 <bread>
801029d9:	89 c7                	mov    %eax,%edi
801029db:	58                   	pop    %eax
801029dc:	5a                   	pop    %edx
801029dd:	ff 34 9d cc 26 11 80 	pushl  -0x7feed934(,%ebx,4)
801029e4:	ff 35 c4 26 11 80    	pushl  0x801126c4
801029ea:	83 c3 01             	add    $0x1,%ebx
801029ed:	e8 de d6 ff ff       	call   801000d0 <bread>
801029f2:	89 c6                	mov    %eax,%esi
801029f4:	8d 47 5c             	lea    0x5c(%edi),%eax
801029f7:	83 c4 0c             	add    $0xc,%esp
801029fa:	68 00 02 00 00       	push   $0x200
801029ff:	50                   	push   %eax
80102a00:	8d 46 5c             	lea    0x5c(%esi),%eax
80102a03:	50                   	push   %eax
80102a04:	e8 a7 1a 00 00       	call   801044b0 <memmove>
80102a09:	89 34 24             	mov    %esi,(%esp)
80102a0c:	e8 8f d7 ff ff       	call   801001a0 <bwrite>
80102a11:	89 3c 24             	mov    %edi,(%esp)
80102a14:	e8 c7 d7 ff ff       	call   801001e0 <brelse>
80102a19:	89 34 24             	mov    %esi,(%esp)
80102a1c:	e8 bf d7 ff ff       	call   801001e0 <brelse>
80102a21:	83 c4 10             	add    $0x10,%esp
80102a24:	39 1d c8 26 11 80    	cmp    %ebx,0x801126c8
80102a2a:	7f 94                	jg     801029c0 <install_trans+0x20>
80102a2c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a2f:	5b                   	pop    %ebx
80102a30:	5e                   	pop    %esi
80102a31:	5f                   	pop    %edi
80102a32:	5d                   	pop    %ebp
80102a33:	f3 c3                	repz ret 
80102a35:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102a40 <write_head>:
80102a40:	55                   	push   %ebp
80102a41:	89 e5                	mov    %esp,%ebp
80102a43:	53                   	push   %ebx
80102a44:	83 ec 0c             	sub    $0xc,%esp
80102a47:	ff 35 b4 26 11 80    	pushl  0x801126b4
80102a4d:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102a53:	e8 78 d6 ff ff       	call   801000d0 <bread>
80102a58:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
80102a5e:	83 c4 10             	add    $0x10,%esp
80102a61:	89 c3                	mov    %eax,%ebx
80102a63:	85 c9                	test   %ecx,%ecx
80102a65:	89 48 5c             	mov    %ecx,0x5c(%eax)
80102a68:	7e 1f                	jle    80102a89 <write_head+0x49>
80102a6a:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
80102a71:	31 d2                	xor    %edx,%edx
80102a73:	90                   	nop
80102a74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102a78:	8b 8a cc 26 11 80    	mov    -0x7feed934(%edx),%ecx
80102a7e:	89 4c 13 60          	mov    %ecx,0x60(%ebx,%edx,1)
80102a82:	83 c2 04             	add    $0x4,%edx
80102a85:	39 c2                	cmp    %eax,%edx
80102a87:	75 ef                	jne    80102a78 <write_head+0x38>
80102a89:	83 ec 0c             	sub    $0xc,%esp
80102a8c:	53                   	push   %ebx
80102a8d:	e8 0e d7 ff ff       	call   801001a0 <bwrite>
80102a92:	89 1c 24             	mov    %ebx,(%esp)
80102a95:	e8 46 d7 ff ff       	call   801001e0 <brelse>
80102a9a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102a9d:	c9                   	leave  
80102a9e:	c3                   	ret    
80102a9f:	90                   	nop

80102aa0 <initlog>:
80102aa0:	55                   	push   %ebp
80102aa1:	89 e5                	mov    %esp,%ebp
80102aa3:	53                   	push   %ebx
80102aa4:	83 ec 2c             	sub    $0x2c,%esp
80102aa7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102aaa:	68 c0 74 10 80       	push   $0x801074c0
80102aaf:	68 80 26 11 80       	push   $0x80112680
80102ab4:	e8 d7 16 00 00       	call   80104190 <initlock>
80102ab9:	58                   	pop    %eax
80102aba:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102abd:	5a                   	pop    %edx
80102abe:	50                   	push   %eax
80102abf:	53                   	push   %ebx
80102ac0:	e8 db e8 ff ff       	call   801013a0 <readsb>
80102ac5:	8b 55 e8             	mov    -0x18(%ebp),%edx
80102ac8:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102acb:	59                   	pop    %ecx
80102acc:	89 1d c4 26 11 80    	mov    %ebx,0x801126c4
80102ad2:	89 15 b8 26 11 80    	mov    %edx,0x801126b8
80102ad8:	a3 b4 26 11 80       	mov    %eax,0x801126b4
80102add:	5a                   	pop    %edx
80102ade:	50                   	push   %eax
80102adf:	53                   	push   %ebx
80102ae0:	e8 eb d5 ff ff       	call   801000d0 <bread>
80102ae5:	8b 48 5c             	mov    0x5c(%eax),%ecx
80102ae8:	83 c4 10             	add    $0x10,%esp
80102aeb:	85 c9                	test   %ecx,%ecx
80102aed:	89 0d c8 26 11 80    	mov    %ecx,0x801126c8
80102af3:	7e 1c                	jle    80102b11 <initlog+0x71>
80102af5:	8d 1c 8d 00 00 00 00 	lea    0x0(,%ecx,4),%ebx
80102afc:	31 d2                	xor    %edx,%edx
80102afe:	66 90                	xchg   %ax,%ax
80102b00:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102b04:	83 c2 04             	add    $0x4,%edx
80102b07:	89 8a c8 26 11 80    	mov    %ecx,-0x7feed938(%edx)
80102b0d:	39 da                	cmp    %ebx,%edx
80102b0f:	75 ef                	jne    80102b00 <initlog+0x60>
80102b11:	83 ec 0c             	sub    $0xc,%esp
80102b14:	50                   	push   %eax
80102b15:	e8 c6 d6 ff ff       	call   801001e0 <brelse>
80102b1a:	e8 81 fe ff ff       	call   801029a0 <install_trans>
80102b1f:	c7 05 c8 26 11 80 00 	movl   $0x0,0x801126c8
80102b26:	00 00 00 
80102b29:	e8 12 ff ff ff       	call   80102a40 <write_head>
80102b2e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102b31:	c9                   	leave  
80102b32:	c3                   	ret    
80102b33:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102b40 <begin_op>:
80102b40:	55                   	push   %ebp
80102b41:	89 e5                	mov    %esp,%ebp
80102b43:	83 ec 14             	sub    $0x14,%esp
80102b46:	68 80 26 11 80       	push   $0x80112680
80102b4b:	e8 40 17 00 00       	call   80104290 <acquire>
80102b50:	83 c4 10             	add    $0x10,%esp
80102b53:	eb 18                	jmp    80102b6d <begin_op+0x2d>
80102b55:	8d 76 00             	lea    0x0(%esi),%esi
80102b58:	83 ec 08             	sub    $0x8,%esp
80102b5b:	68 80 26 11 80       	push   $0x80112680
80102b60:	68 80 26 11 80       	push   $0x80112680
80102b65:	e8 b6 11 00 00       	call   80103d20 <sleep>
80102b6a:	83 c4 10             	add    $0x10,%esp
80102b6d:	a1 c0 26 11 80       	mov    0x801126c0,%eax
80102b72:	85 c0                	test   %eax,%eax
80102b74:	75 e2                	jne    80102b58 <begin_op+0x18>
80102b76:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102b7b:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
80102b81:	83 c0 01             	add    $0x1,%eax
80102b84:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102b87:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102b8a:	83 fa 1e             	cmp    $0x1e,%edx
80102b8d:	7f c9                	jg     80102b58 <begin_op+0x18>
80102b8f:	83 ec 0c             	sub    $0xc,%esp
80102b92:	a3 bc 26 11 80       	mov    %eax,0x801126bc
80102b97:	68 80 26 11 80       	push   $0x80112680
80102b9c:	e8 0f 18 00 00       	call   801043b0 <release>
80102ba1:	83 c4 10             	add    $0x10,%esp
80102ba4:	c9                   	leave  
80102ba5:	c3                   	ret    
80102ba6:	8d 76 00             	lea    0x0(%esi),%esi
80102ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102bb0 <end_op>:
80102bb0:	55                   	push   %ebp
80102bb1:	89 e5                	mov    %esp,%ebp
80102bb3:	57                   	push   %edi
80102bb4:	56                   	push   %esi
80102bb5:	53                   	push   %ebx
80102bb6:	83 ec 18             	sub    $0x18,%esp
80102bb9:	68 80 26 11 80       	push   $0x80112680
80102bbe:	e8 cd 16 00 00       	call   80104290 <acquire>
80102bc3:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102bc8:	8b 1d c0 26 11 80    	mov    0x801126c0,%ebx
80102bce:	83 c4 10             	add    $0x10,%esp
80102bd1:	83 e8 01             	sub    $0x1,%eax
80102bd4:	85 db                	test   %ebx,%ebx
80102bd6:	a3 bc 26 11 80       	mov    %eax,0x801126bc
80102bdb:	0f 85 23 01 00 00    	jne    80102d04 <end_op+0x154>
80102be1:	85 c0                	test   %eax,%eax
80102be3:	0f 85 f7 00 00 00    	jne    80102ce0 <end_op+0x130>
80102be9:	83 ec 0c             	sub    $0xc,%esp
80102bec:	c7 05 c0 26 11 80 01 	movl   $0x1,0x801126c0
80102bf3:	00 00 00 
80102bf6:	31 db                	xor    %ebx,%ebx
80102bf8:	68 80 26 11 80       	push   $0x80112680
80102bfd:	e8 ae 17 00 00       	call   801043b0 <release>
80102c02:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
80102c08:	83 c4 10             	add    $0x10,%esp
80102c0b:	85 c9                	test   %ecx,%ecx
80102c0d:	0f 8e 8a 00 00 00    	jle    80102c9d <end_op+0xed>
80102c13:	90                   	nop
80102c14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102c18:	a1 b4 26 11 80       	mov    0x801126b4,%eax
80102c1d:	83 ec 08             	sub    $0x8,%esp
80102c20:	01 d8                	add    %ebx,%eax
80102c22:	83 c0 01             	add    $0x1,%eax
80102c25:	50                   	push   %eax
80102c26:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102c2c:	e8 9f d4 ff ff       	call   801000d0 <bread>
80102c31:	89 c6                	mov    %eax,%esi
80102c33:	58                   	pop    %eax
80102c34:	5a                   	pop    %edx
80102c35:	ff 34 9d cc 26 11 80 	pushl  -0x7feed934(,%ebx,4)
80102c3c:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102c42:	83 c3 01             	add    $0x1,%ebx
80102c45:	e8 86 d4 ff ff       	call   801000d0 <bread>
80102c4a:	89 c7                	mov    %eax,%edi
80102c4c:	8d 40 5c             	lea    0x5c(%eax),%eax
80102c4f:	83 c4 0c             	add    $0xc,%esp
80102c52:	68 00 02 00 00       	push   $0x200
80102c57:	50                   	push   %eax
80102c58:	8d 46 5c             	lea    0x5c(%esi),%eax
80102c5b:	50                   	push   %eax
80102c5c:	e8 4f 18 00 00       	call   801044b0 <memmove>
80102c61:	89 34 24             	mov    %esi,(%esp)
80102c64:	e8 37 d5 ff ff       	call   801001a0 <bwrite>
80102c69:	89 3c 24             	mov    %edi,(%esp)
80102c6c:	e8 6f d5 ff ff       	call   801001e0 <brelse>
80102c71:	89 34 24             	mov    %esi,(%esp)
80102c74:	e8 67 d5 ff ff       	call   801001e0 <brelse>
80102c79:	83 c4 10             	add    $0x10,%esp
80102c7c:	3b 1d c8 26 11 80    	cmp    0x801126c8,%ebx
80102c82:	7c 94                	jl     80102c18 <end_op+0x68>
80102c84:	e8 b7 fd ff ff       	call   80102a40 <write_head>
80102c89:	e8 12 fd ff ff       	call   801029a0 <install_trans>
80102c8e:	c7 05 c8 26 11 80 00 	movl   $0x0,0x801126c8
80102c95:	00 00 00 
80102c98:	e8 a3 fd ff ff       	call   80102a40 <write_head>
80102c9d:	83 ec 0c             	sub    $0xc,%esp
80102ca0:	68 80 26 11 80       	push   $0x80112680
80102ca5:	e8 e6 15 00 00       	call   80104290 <acquire>
80102caa:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102cb1:	c7 05 c0 26 11 80 00 	movl   $0x0,0x801126c0
80102cb8:	00 00 00 
80102cbb:	e8 10 12 00 00       	call   80103ed0 <wakeup>
80102cc0:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102cc7:	e8 e4 16 00 00       	call   801043b0 <release>
80102ccc:	83 c4 10             	add    $0x10,%esp
80102ccf:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102cd2:	5b                   	pop    %ebx
80102cd3:	5e                   	pop    %esi
80102cd4:	5f                   	pop    %edi
80102cd5:	5d                   	pop    %ebp
80102cd6:	c3                   	ret    
80102cd7:	89 f6                	mov    %esi,%esi
80102cd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102ce0:	83 ec 0c             	sub    $0xc,%esp
80102ce3:	68 80 26 11 80       	push   $0x80112680
80102ce8:	e8 e3 11 00 00       	call   80103ed0 <wakeup>
80102ced:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102cf4:	e8 b7 16 00 00       	call   801043b0 <release>
80102cf9:	83 c4 10             	add    $0x10,%esp
80102cfc:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102cff:	5b                   	pop    %ebx
80102d00:	5e                   	pop    %esi
80102d01:	5f                   	pop    %edi
80102d02:	5d                   	pop    %ebp
80102d03:	c3                   	ret    
80102d04:	83 ec 0c             	sub    $0xc,%esp
80102d07:	68 c4 74 10 80       	push   $0x801074c4
80102d0c:	e8 5f d6 ff ff       	call   80100370 <panic>
80102d11:	eb 0d                	jmp    80102d20 <log_write>
80102d13:	90                   	nop
80102d14:	90                   	nop
80102d15:	90                   	nop
80102d16:	90                   	nop
80102d17:	90                   	nop
80102d18:	90                   	nop
80102d19:	90                   	nop
80102d1a:	90                   	nop
80102d1b:	90                   	nop
80102d1c:	90                   	nop
80102d1d:	90                   	nop
80102d1e:	90                   	nop
80102d1f:	90                   	nop

80102d20 <log_write>:
80102d20:	55                   	push   %ebp
80102d21:	89 e5                	mov    %esp,%ebp
80102d23:	53                   	push   %ebx
80102d24:	83 ec 04             	sub    $0x4,%esp
80102d27:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
80102d2d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102d30:	83 fa 1d             	cmp    $0x1d,%edx
80102d33:	0f 8f 97 00 00 00    	jg     80102dd0 <log_write+0xb0>
80102d39:	a1 b8 26 11 80       	mov    0x801126b8,%eax
80102d3e:	83 e8 01             	sub    $0x1,%eax
80102d41:	39 c2                	cmp    %eax,%edx
80102d43:	0f 8d 87 00 00 00    	jge    80102dd0 <log_write+0xb0>
80102d49:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102d4e:	85 c0                	test   %eax,%eax
80102d50:	0f 8e 87 00 00 00    	jle    80102ddd <log_write+0xbd>
80102d56:	83 ec 0c             	sub    $0xc,%esp
80102d59:	68 80 26 11 80       	push   $0x80112680
80102d5e:	e8 2d 15 00 00       	call   80104290 <acquire>
80102d63:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
80102d69:	83 c4 10             	add    $0x10,%esp
80102d6c:	83 fa 00             	cmp    $0x0,%edx
80102d6f:	7e 50                	jle    80102dc1 <log_write+0xa1>
80102d71:	8b 4b 08             	mov    0x8(%ebx),%ecx
80102d74:	31 c0                	xor    %eax,%eax
80102d76:	3b 0d cc 26 11 80    	cmp    0x801126cc,%ecx
80102d7c:	75 0b                	jne    80102d89 <log_write+0x69>
80102d7e:	eb 38                	jmp    80102db8 <log_write+0x98>
80102d80:	39 0c 85 cc 26 11 80 	cmp    %ecx,-0x7feed934(,%eax,4)
80102d87:	74 2f                	je     80102db8 <log_write+0x98>
80102d89:	83 c0 01             	add    $0x1,%eax
80102d8c:	39 d0                	cmp    %edx,%eax
80102d8e:	75 f0                	jne    80102d80 <log_write+0x60>
80102d90:	89 0c 95 cc 26 11 80 	mov    %ecx,-0x7feed934(,%edx,4)
80102d97:	83 c2 01             	add    $0x1,%edx
80102d9a:	89 15 c8 26 11 80    	mov    %edx,0x801126c8
80102da0:	83 0b 04             	orl    $0x4,(%ebx)
80102da3:	c7 45 08 80 26 11 80 	movl   $0x80112680,0x8(%ebp)
80102daa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102dad:	c9                   	leave  
80102dae:	e9 fd 15 00 00       	jmp    801043b0 <release>
80102db3:	90                   	nop
80102db4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102db8:	89 0c 85 cc 26 11 80 	mov    %ecx,-0x7feed934(,%eax,4)
80102dbf:	eb df                	jmp    80102da0 <log_write+0x80>
80102dc1:	8b 43 08             	mov    0x8(%ebx),%eax
80102dc4:	a3 cc 26 11 80       	mov    %eax,0x801126cc
80102dc9:	75 d5                	jne    80102da0 <log_write+0x80>
80102dcb:	eb ca                	jmp    80102d97 <log_write+0x77>
80102dcd:	8d 76 00             	lea    0x0(%esi),%esi
80102dd0:	83 ec 0c             	sub    $0xc,%esp
80102dd3:	68 d3 74 10 80       	push   $0x801074d3
80102dd8:	e8 93 d5 ff ff       	call   80100370 <panic>
80102ddd:	83 ec 0c             	sub    $0xc,%esp
80102de0:	68 e9 74 10 80       	push   $0x801074e9
80102de5:	e8 86 d5 ff ff       	call   80100370 <panic>
80102dea:	66 90                	xchg   %ax,%ax
80102dec:	66 90                	xchg   %ax,%ax
80102dee:	66 90                	xchg   %ax,%ax

80102df0 <mpmain>:
80102df0:	55                   	push   %ebp
80102df1:	89 e5                	mov    %esp,%ebp
80102df3:	53                   	push   %ebx
80102df4:	83 ec 04             	sub    $0x4,%esp
80102df7:	e8 54 09 00 00       	call   80103750 <cpuid>
80102dfc:	89 c3                	mov    %eax,%ebx
80102dfe:	e8 4d 09 00 00       	call   80103750 <cpuid>
80102e03:	83 ec 04             	sub    $0x4,%esp
80102e06:	53                   	push   %ebx
80102e07:	50                   	push   %eax
80102e08:	68 04 75 10 80       	push   $0x80107504
80102e0d:	e8 4e d8 ff ff       	call   80100660 <cprintf>
80102e12:	e8 39 29 00 00       	call   80105750 <idtinit>
80102e17:	e8 b4 08 00 00       	call   801036d0 <mycpu>
80102e1c:	89 c2                	mov    %eax,%edx
80102e1e:	b8 01 00 00 00       	mov    $0x1,%eax
80102e23:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
80102e2a:	e8 01 0c 00 00       	call   80103a30 <scheduler>
80102e2f:	90                   	nop

80102e30 <mpenter>:
80102e30:	55                   	push   %ebp
80102e31:	89 e5                	mov    %esp,%ebp
80102e33:	83 ec 08             	sub    $0x8,%esp
80102e36:	e8 95 3a 00 00       	call   801068d0 <switchkvm>
80102e3b:	e8 00 39 00 00       	call   80106740 <seginit>
80102e40:	e8 9b f7 ff ff       	call   801025e0 <lapicinit>
80102e45:	e8 a6 ff ff ff       	call   80102df0 <mpmain>
80102e4a:	66 90                	xchg   %ax,%ax
80102e4c:	66 90                	xchg   %ax,%ax
80102e4e:	66 90                	xchg   %ax,%ax

80102e50 <main>:
80102e50:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102e54:	83 e4 f0             	and    $0xfffffff0,%esp
80102e57:	ff 71 fc             	pushl  -0x4(%ecx)
80102e5a:	55                   	push   %ebp
80102e5b:	89 e5                	mov    %esp,%ebp
80102e5d:	53                   	push   %ebx
80102e5e:	51                   	push   %ecx
80102e5f:	bb 80 27 11 80       	mov    $0x80112780,%ebx
80102e64:	83 ec 08             	sub    $0x8,%esp
80102e67:	68 00 00 40 80       	push   $0x80400000
80102e6c:	68 f4 58 11 80       	push   $0x801158f4
80102e71:	e8 3a f5 ff ff       	call   801023b0 <kinit1>
80102e76:	e8 f5 3e 00 00       	call   80106d70 <kvmalloc>
80102e7b:	e8 70 01 00 00       	call   80102ff0 <mpinit>
80102e80:	e8 5b f7 ff ff       	call   801025e0 <lapicinit>
80102e85:	e8 b6 38 00 00       	call   80106740 <seginit>
80102e8a:	e8 31 03 00 00       	call   801031c0 <picinit>
80102e8f:	e8 4c f3 ff ff       	call   801021e0 <ioapicinit>
80102e94:	e8 07 db ff ff       	call   801009a0 <consoleinit>
80102e99:	e8 02 2c 00 00       	call   80105aa0 <uartinit>
80102e9e:	e8 0d 08 00 00       	call   801036b0 <pinit>
80102ea3:	e8 e8 40 00 00       	call   80106f90 <shminit>
80102ea8:	e8 03 28 00 00       	call   801056b0 <tvinit>
80102ead:	e8 8e d1 ff ff       	call   80100040 <binit>
80102eb2:	e8 89 de ff ff       	call   80100d40 <fileinit>
80102eb7:	e8 04 f1 ff ff       	call   80101fc0 <ideinit>
80102ebc:	83 c4 0c             	add    $0xc,%esp
80102ebf:	68 8a 00 00 00       	push   $0x8a
80102ec4:	68 8c a4 10 80       	push   $0x8010a48c
80102ec9:	68 00 70 00 80       	push   $0x80007000
80102ece:	e8 dd 15 00 00       	call   801044b0 <memmove>
80102ed3:	69 05 00 2d 11 80 b0 	imul   $0xb0,0x80112d00,%eax
80102eda:	00 00 00 
80102edd:	83 c4 10             	add    $0x10,%esp
80102ee0:	05 80 27 11 80       	add    $0x80112780,%eax
80102ee5:	39 d8                	cmp    %ebx,%eax
80102ee7:	76 6a                	jbe    80102f53 <main+0x103>
80102ee9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102ef0:	e8 db 07 00 00       	call   801036d0 <mycpu>
80102ef5:	39 d8                	cmp    %ebx,%eax
80102ef7:	74 41                	je     80102f3a <main+0xea>
80102ef9:	e8 82 f5 ff ff       	call   80102480 <kalloc>
80102efe:	05 00 10 00 00       	add    $0x1000,%eax
80102f03:	c7 05 f8 6f 00 80 30 	movl   $0x80102e30,0x80006ff8
80102f0a:	2e 10 80 
80102f0d:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80102f14:	90 10 00 
80102f17:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
80102f1c:	0f b6 03             	movzbl (%ebx),%eax
80102f1f:	83 ec 08             	sub    $0x8,%esp
80102f22:	68 00 70 00 00       	push   $0x7000
80102f27:	50                   	push   %eax
80102f28:	e8 03 f8 ff ff       	call   80102730 <lapicstartap>
80102f2d:	83 c4 10             	add    $0x10,%esp
80102f30:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80102f36:	85 c0                	test   %eax,%eax
80102f38:	74 f6                	je     80102f30 <main+0xe0>
80102f3a:	69 05 00 2d 11 80 b0 	imul   $0xb0,0x80112d00,%eax
80102f41:	00 00 00 
80102f44:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80102f4a:	05 80 27 11 80       	add    $0x80112780,%eax
80102f4f:	39 c3                	cmp    %eax,%ebx
80102f51:	72 9d                	jb     80102ef0 <main+0xa0>
80102f53:	83 ec 08             	sub    $0x8,%esp
80102f56:	68 00 00 00 8e       	push   $0x8e000000
80102f5b:	68 00 00 40 80       	push   $0x80400000
80102f60:	e8 bb f4 ff ff       	call   80102420 <kinit2>
80102f65:	e8 36 08 00 00       	call   801037a0 <userinit>
80102f6a:	e8 81 fe ff ff       	call   80102df0 <mpmain>
80102f6f:	90                   	nop

80102f70 <mpsearch1>:
80102f70:	55                   	push   %ebp
80102f71:	89 e5                	mov    %esp,%ebp
80102f73:	57                   	push   %edi
80102f74:	56                   	push   %esi
80102f75:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
80102f7b:	53                   	push   %ebx
80102f7c:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
80102f7f:	83 ec 0c             	sub    $0xc,%esp
80102f82:	39 de                	cmp    %ebx,%esi
80102f84:	73 48                	jae    80102fce <mpsearch1+0x5e>
80102f86:	8d 76 00             	lea    0x0(%esi),%esi
80102f89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102f90:	83 ec 04             	sub    $0x4,%esp
80102f93:	8d 7e 10             	lea    0x10(%esi),%edi
80102f96:	6a 04                	push   $0x4
80102f98:	68 18 75 10 80       	push   $0x80107518
80102f9d:	56                   	push   %esi
80102f9e:	e8 ad 14 00 00       	call   80104450 <memcmp>
80102fa3:	83 c4 10             	add    $0x10,%esp
80102fa6:	85 c0                	test   %eax,%eax
80102fa8:	75 1e                	jne    80102fc8 <mpsearch1+0x58>
80102faa:	8d 7e 10             	lea    0x10(%esi),%edi
80102fad:	89 f2                	mov    %esi,%edx
80102faf:	31 c9                	xor    %ecx,%ecx
80102fb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102fb8:	0f b6 02             	movzbl (%edx),%eax
80102fbb:	83 c2 01             	add    $0x1,%edx
80102fbe:	01 c1                	add    %eax,%ecx
80102fc0:	39 fa                	cmp    %edi,%edx
80102fc2:	75 f4                	jne    80102fb8 <mpsearch1+0x48>
80102fc4:	84 c9                	test   %cl,%cl
80102fc6:	74 10                	je     80102fd8 <mpsearch1+0x68>
80102fc8:	39 fb                	cmp    %edi,%ebx
80102fca:	89 fe                	mov    %edi,%esi
80102fcc:	77 c2                	ja     80102f90 <mpsearch1+0x20>
80102fce:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102fd1:	31 c0                	xor    %eax,%eax
80102fd3:	5b                   	pop    %ebx
80102fd4:	5e                   	pop    %esi
80102fd5:	5f                   	pop    %edi
80102fd6:	5d                   	pop    %ebp
80102fd7:	c3                   	ret    
80102fd8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102fdb:	89 f0                	mov    %esi,%eax
80102fdd:	5b                   	pop    %ebx
80102fde:	5e                   	pop    %esi
80102fdf:	5f                   	pop    %edi
80102fe0:	5d                   	pop    %ebp
80102fe1:	c3                   	ret    
80102fe2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102fe9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102ff0 <mpinit>:
80102ff0:	55                   	push   %ebp
80102ff1:	89 e5                	mov    %esp,%ebp
80102ff3:	57                   	push   %edi
80102ff4:	56                   	push   %esi
80102ff5:	53                   	push   %ebx
80102ff6:	83 ec 1c             	sub    $0x1c,%esp
80102ff9:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103000:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103007:	c1 e0 08             	shl    $0x8,%eax
8010300a:	09 d0                	or     %edx,%eax
8010300c:	c1 e0 04             	shl    $0x4,%eax
8010300f:	85 c0                	test   %eax,%eax
80103011:	75 1b                	jne    8010302e <mpinit+0x3e>
80103013:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
8010301a:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103021:	c1 e0 08             	shl    $0x8,%eax
80103024:	09 d0                	or     %edx,%eax
80103026:	c1 e0 0a             	shl    $0xa,%eax
80103029:	2d 00 04 00 00       	sub    $0x400,%eax
8010302e:	ba 00 04 00 00       	mov    $0x400,%edx
80103033:	e8 38 ff ff ff       	call   80102f70 <mpsearch1>
80103038:	85 c0                	test   %eax,%eax
8010303a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010303d:	0f 84 37 01 00 00    	je     8010317a <mpinit+0x18a>
80103043:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103046:	8b 58 04             	mov    0x4(%eax),%ebx
80103049:	85 db                	test   %ebx,%ebx
8010304b:	0f 84 43 01 00 00    	je     80103194 <mpinit+0x1a4>
80103051:	8d b3 00 00 00 80    	lea    -0x80000000(%ebx),%esi
80103057:	83 ec 04             	sub    $0x4,%esp
8010305a:	6a 04                	push   $0x4
8010305c:	68 1d 75 10 80       	push   $0x8010751d
80103061:	56                   	push   %esi
80103062:	e8 e9 13 00 00       	call   80104450 <memcmp>
80103067:	83 c4 10             	add    $0x10,%esp
8010306a:	85 c0                	test   %eax,%eax
8010306c:	0f 85 22 01 00 00    	jne    80103194 <mpinit+0x1a4>
80103072:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
80103079:	3c 01                	cmp    $0x1,%al
8010307b:	74 08                	je     80103085 <mpinit+0x95>
8010307d:	3c 04                	cmp    $0x4,%al
8010307f:	0f 85 0f 01 00 00    	jne    80103194 <mpinit+0x1a4>
80103085:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
8010308c:	85 ff                	test   %edi,%edi
8010308e:	74 21                	je     801030b1 <mpinit+0xc1>
80103090:	31 d2                	xor    %edx,%edx
80103092:	31 c0                	xor    %eax,%eax
80103094:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103098:	0f b6 8c 03 00 00 00 	movzbl -0x80000000(%ebx,%eax,1),%ecx
8010309f:	80 
801030a0:	83 c0 01             	add    $0x1,%eax
801030a3:	01 ca                	add    %ecx,%edx
801030a5:	39 c7                	cmp    %eax,%edi
801030a7:	75 ef                	jne    80103098 <mpinit+0xa8>
801030a9:	84 d2                	test   %dl,%dl
801030ab:	0f 85 e3 00 00 00    	jne    80103194 <mpinit+0x1a4>
801030b1:	85 f6                	test   %esi,%esi
801030b3:	0f 84 db 00 00 00    	je     80103194 <mpinit+0x1a4>
801030b9:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
801030bf:	a3 7c 26 11 80       	mov    %eax,0x8011267c
801030c4:	0f b7 93 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edx
801030cb:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
801030d1:	bb 01 00 00 00       	mov    $0x1,%ebx
801030d6:	01 d6                	add    %edx,%esi
801030d8:	90                   	nop
801030d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801030e0:	39 c6                	cmp    %eax,%esi
801030e2:	76 23                	jbe    80103107 <mpinit+0x117>
801030e4:	0f b6 10             	movzbl (%eax),%edx
801030e7:	80 fa 04             	cmp    $0x4,%dl
801030ea:	0f 87 c0 00 00 00    	ja     801031b0 <mpinit+0x1c0>
801030f0:	ff 24 95 5c 75 10 80 	jmp    *-0x7fef8aa4(,%edx,4)
801030f7:	89 f6                	mov    %esi,%esi
801030f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80103100:	83 c0 08             	add    $0x8,%eax
80103103:	39 c6                	cmp    %eax,%esi
80103105:	77 dd                	ja     801030e4 <mpinit+0xf4>
80103107:	85 db                	test   %ebx,%ebx
80103109:	0f 84 92 00 00 00    	je     801031a1 <mpinit+0x1b1>
8010310f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103112:	80 78 0c 00          	cmpb   $0x0,0xc(%eax)
80103116:	74 15                	je     8010312d <mpinit+0x13d>
80103118:	ba 22 00 00 00       	mov    $0x22,%edx
8010311d:	b8 70 00 00 00       	mov    $0x70,%eax
80103122:	ee                   	out    %al,(%dx)
80103123:	ba 23 00 00 00       	mov    $0x23,%edx
80103128:	ec                   	in     (%dx),%al
80103129:	83 c8 01             	or     $0x1,%eax
8010312c:	ee                   	out    %al,(%dx)
8010312d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103130:	5b                   	pop    %ebx
80103131:	5e                   	pop    %esi
80103132:	5f                   	pop    %edi
80103133:	5d                   	pop    %ebp
80103134:	c3                   	ret    
80103135:	8d 76 00             	lea    0x0(%esi),%esi
80103138:	8b 0d 00 2d 11 80    	mov    0x80112d00,%ecx
8010313e:	83 f9 07             	cmp    $0x7,%ecx
80103141:	7f 19                	jg     8010315c <mpinit+0x16c>
80103143:	0f b6 50 01          	movzbl 0x1(%eax),%edx
80103147:	69 f9 b0 00 00 00    	imul   $0xb0,%ecx,%edi
8010314d:	83 c1 01             	add    $0x1,%ecx
80103150:	89 0d 00 2d 11 80    	mov    %ecx,0x80112d00
80103156:	88 97 80 27 11 80    	mov    %dl,-0x7feed880(%edi)
8010315c:	83 c0 14             	add    $0x14,%eax
8010315f:	e9 7c ff ff ff       	jmp    801030e0 <mpinit+0xf0>
80103164:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103168:	0f b6 50 01          	movzbl 0x1(%eax),%edx
8010316c:	83 c0 08             	add    $0x8,%eax
8010316f:	88 15 60 27 11 80    	mov    %dl,0x80112760
80103175:	e9 66 ff ff ff       	jmp    801030e0 <mpinit+0xf0>
8010317a:	ba 00 00 01 00       	mov    $0x10000,%edx
8010317f:	b8 00 00 0f 00       	mov    $0xf0000,%eax
80103184:	e8 e7 fd ff ff       	call   80102f70 <mpsearch1>
80103189:	85 c0                	test   %eax,%eax
8010318b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010318e:	0f 85 af fe ff ff    	jne    80103043 <mpinit+0x53>
80103194:	83 ec 0c             	sub    $0xc,%esp
80103197:	68 22 75 10 80       	push   $0x80107522
8010319c:	e8 cf d1 ff ff       	call   80100370 <panic>
801031a1:	83 ec 0c             	sub    $0xc,%esp
801031a4:	68 3c 75 10 80       	push   $0x8010753c
801031a9:	e8 c2 d1 ff ff       	call   80100370 <panic>
801031ae:	66 90                	xchg   %ax,%ax
801031b0:	31 db                	xor    %ebx,%ebx
801031b2:	e9 30 ff ff ff       	jmp    801030e7 <mpinit+0xf7>
801031b7:	66 90                	xchg   %ax,%ax
801031b9:	66 90                	xchg   %ax,%ax
801031bb:	66 90                	xchg   %ax,%ax
801031bd:	66 90                	xchg   %ax,%ax
801031bf:	90                   	nop

801031c0 <picinit>:
801031c0:	55                   	push   %ebp
801031c1:	ba 21 00 00 00       	mov    $0x21,%edx
801031c6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801031cb:	89 e5                	mov    %esp,%ebp
801031cd:	ee                   	out    %al,(%dx)
801031ce:	ba a1 00 00 00       	mov    $0xa1,%edx
801031d3:	ee                   	out    %al,(%dx)
801031d4:	5d                   	pop    %ebp
801031d5:	c3                   	ret    
801031d6:	66 90                	xchg   %ax,%ax
801031d8:	66 90                	xchg   %ax,%ax
801031da:	66 90                	xchg   %ax,%ax
801031dc:	66 90                	xchg   %ax,%ax
801031de:	66 90                	xchg   %ax,%ax

801031e0 <pipealloc>:
801031e0:	55                   	push   %ebp
801031e1:	89 e5                	mov    %esp,%ebp
801031e3:	57                   	push   %edi
801031e4:	56                   	push   %esi
801031e5:	53                   	push   %ebx
801031e6:	83 ec 0c             	sub    $0xc,%esp
801031e9:	8b 75 08             	mov    0x8(%ebp),%esi
801031ec:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801031ef:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801031f5:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
801031fb:	e8 60 db ff ff       	call   80100d60 <filealloc>
80103200:	85 c0                	test   %eax,%eax
80103202:	89 06                	mov    %eax,(%esi)
80103204:	0f 84 a8 00 00 00    	je     801032b2 <pipealloc+0xd2>
8010320a:	e8 51 db ff ff       	call   80100d60 <filealloc>
8010320f:	85 c0                	test   %eax,%eax
80103211:	89 03                	mov    %eax,(%ebx)
80103213:	0f 84 87 00 00 00    	je     801032a0 <pipealloc+0xc0>
80103219:	e8 62 f2 ff ff       	call   80102480 <kalloc>
8010321e:	85 c0                	test   %eax,%eax
80103220:	89 c7                	mov    %eax,%edi
80103222:	0f 84 b0 00 00 00    	je     801032d8 <pipealloc+0xf8>
80103228:	83 ec 08             	sub    $0x8,%esp
8010322b:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
80103232:	00 00 00 
80103235:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
8010323c:	00 00 00 
8010323f:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80103246:	00 00 00 
80103249:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103250:	00 00 00 
80103253:	68 70 75 10 80       	push   $0x80107570
80103258:	50                   	push   %eax
80103259:	e8 32 0f 00 00       	call   80104190 <initlock>
8010325e:	8b 06                	mov    (%esi),%eax
80103260:	83 c4 10             	add    $0x10,%esp
80103263:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
80103269:	8b 06                	mov    (%esi),%eax
8010326b:	c6 40 08 01          	movb   $0x1,0x8(%eax)
8010326f:	8b 06                	mov    (%esi),%eax
80103271:	c6 40 09 00          	movb   $0x0,0x9(%eax)
80103275:	8b 06                	mov    (%esi),%eax
80103277:	89 78 0c             	mov    %edi,0xc(%eax)
8010327a:	8b 03                	mov    (%ebx),%eax
8010327c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
80103282:	8b 03                	mov    (%ebx),%eax
80103284:	c6 40 08 00          	movb   $0x0,0x8(%eax)
80103288:	8b 03                	mov    (%ebx),%eax
8010328a:	c6 40 09 01          	movb   $0x1,0x9(%eax)
8010328e:	8b 03                	mov    (%ebx),%eax
80103290:	89 78 0c             	mov    %edi,0xc(%eax)
80103293:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103296:	31 c0                	xor    %eax,%eax
80103298:	5b                   	pop    %ebx
80103299:	5e                   	pop    %esi
8010329a:	5f                   	pop    %edi
8010329b:	5d                   	pop    %ebp
8010329c:	c3                   	ret    
8010329d:	8d 76 00             	lea    0x0(%esi),%esi
801032a0:	8b 06                	mov    (%esi),%eax
801032a2:	85 c0                	test   %eax,%eax
801032a4:	74 1e                	je     801032c4 <pipealloc+0xe4>
801032a6:	83 ec 0c             	sub    $0xc,%esp
801032a9:	50                   	push   %eax
801032aa:	e8 71 db ff ff       	call   80100e20 <fileclose>
801032af:	83 c4 10             	add    $0x10,%esp
801032b2:	8b 03                	mov    (%ebx),%eax
801032b4:	85 c0                	test   %eax,%eax
801032b6:	74 0c                	je     801032c4 <pipealloc+0xe4>
801032b8:	83 ec 0c             	sub    $0xc,%esp
801032bb:	50                   	push   %eax
801032bc:	e8 5f db ff ff       	call   80100e20 <fileclose>
801032c1:	83 c4 10             	add    $0x10,%esp
801032c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
801032c7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801032cc:	5b                   	pop    %ebx
801032cd:	5e                   	pop    %esi
801032ce:	5f                   	pop    %edi
801032cf:	5d                   	pop    %ebp
801032d0:	c3                   	ret    
801032d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801032d8:	8b 06                	mov    (%esi),%eax
801032da:	85 c0                	test   %eax,%eax
801032dc:	75 c8                	jne    801032a6 <pipealloc+0xc6>
801032de:	eb d2                	jmp    801032b2 <pipealloc+0xd2>

801032e0 <pipeclose>:
801032e0:	55                   	push   %ebp
801032e1:	89 e5                	mov    %esp,%ebp
801032e3:	56                   	push   %esi
801032e4:	53                   	push   %ebx
801032e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801032e8:	8b 75 0c             	mov    0xc(%ebp),%esi
801032eb:	83 ec 0c             	sub    $0xc,%esp
801032ee:	53                   	push   %ebx
801032ef:	e8 9c 0f 00 00       	call   80104290 <acquire>
801032f4:	83 c4 10             	add    $0x10,%esp
801032f7:	85 f6                	test   %esi,%esi
801032f9:	74 45                	je     80103340 <pipeclose+0x60>
801032fb:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103301:	83 ec 0c             	sub    $0xc,%esp
80103304:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010330b:	00 00 00 
8010330e:	50                   	push   %eax
8010330f:	e8 bc 0b 00 00       	call   80103ed0 <wakeup>
80103314:	83 c4 10             	add    $0x10,%esp
80103317:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010331d:	85 d2                	test   %edx,%edx
8010331f:	75 0a                	jne    8010332b <pipeclose+0x4b>
80103321:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80103327:	85 c0                	test   %eax,%eax
80103329:	74 35                	je     80103360 <pipeclose+0x80>
8010332b:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010332e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103331:	5b                   	pop    %ebx
80103332:	5e                   	pop    %esi
80103333:	5d                   	pop    %ebp
80103334:	e9 77 10 00 00       	jmp    801043b0 <release>
80103339:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103340:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103346:	83 ec 0c             	sub    $0xc,%esp
80103349:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103350:	00 00 00 
80103353:	50                   	push   %eax
80103354:	e8 77 0b 00 00       	call   80103ed0 <wakeup>
80103359:	83 c4 10             	add    $0x10,%esp
8010335c:	eb b9                	jmp    80103317 <pipeclose+0x37>
8010335e:	66 90                	xchg   %ax,%ax
80103360:	83 ec 0c             	sub    $0xc,%esp
80103363:	53                   	push   %ebx
80103364:	e8 47 10 00 00       	call   801043b0 <release>
80103369:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010336c:	83 c4 10             	add    $0x10,%esp
8010336f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103372:	5b                   	pop    %ebx
80103373:	5e                   	pop    %esi
80103374:	5d                   	pop    %ebp
80103375:	e9 56 ef ff ff       	jmp    801022d0 <kfree>
8010337a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103380 <pipewrite>:
80103380:	55                   	push   %ebp
80103381:	89 e5                	mov    %esp,%ebp
80103383:	57                   	push   %edi
80103384:	56                   	push   %esi
80103385:	53                   	push   %ebx
80103386:	83 ec 28             	sub    $0x28,%esp
80103389:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010338c:	53                   	push   %ebx
8010338d:	e8 fe 0e 00 00       	call   80104290 <acquire>
80103392:	8b 45 10             	mov    0x10(%ebp),%eax
80103395:	83 c4 10             	add    $0x10,%esp
80103398:	85 c0                	test   %eax,%eax
8010339a:	0f 8e b9 00 00 00    	jle    80103459 <pipewrite+0xd9>
801033a0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801033a3:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
801033a9:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
801033af:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
801033b5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801033b8:	03 4d 10             	add    0x10(%ebp),%ecx
801033bb:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801033be:	8b 8b 34 02 00 00    	mov    0x234(%ebx),%ecx
801033c4:	8d 91 00 02 00 00    	lea    0x200(%ecx),%edx
801033ca:	39 d0                	cmp    %edx,%eax
801033cc:	74 38                	je     80103406 <pipewrite+0x86>
801033ce:	eb 59                	jmp    80103429 <pipewrite+0xa9>
801033d0:	e8 9b 03 00 00       	call   80103770 <myproc>
801033d5:	8b 48 24             	mov    0x24(%eax),%ecx
801033d8:	85 c9                	test   %ecx,%ecx
801033da:	75 34                	jne    80103410 <pipewrite+0x90>
801033dc:	83 ec 0c             	sub    $0xc,%esp
801033df:	57                   	push   %edi
801033e0:	e8 eb 0a 00 00       	call   80103ed0 <wakeup>
801033e5:	58                   	pop    %eax
801033e6:	5a                   	pop    %edx
801033e7:	53                   	push   %ebx
801033e8:	56                   	push   %esi
801033e9:	e8 32 09 00 00       	call   80103d20 <sleep>
801033ee:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
801033f4:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
801033fa:	83 c4 10             	add    $0x10,%esp
801033fd:	05 00 02 00 00       	add    $0x200,%eax
80103402:	39 c2                	cmp    %eax,%edx
80103404:	75 2a                	jne    80103430 <pipewrite+0xb0>
80103406:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
8010340c:	85 c0                	test   %eax,%eax
8010340e:	75 c0                	jne    801033d0 <pipewrite+0x50>
80103410:	83 ec 0c             	sub    $0xc,%esp
80103413:	53                   	push   %ebx
80103414:	e8 97 0f 00 00       	call   801043b0 <release>
80103419:	83 c4 10             	add    $0x10,%esp
8010341c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103421:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103424:	5b                   	pop    %ebx
80103425:	5e                   	pop    %esi
80103426:	5f                   	pop    %edi
80103427:	5d                   	pop    %ebp
80103428:	c3                   	ret    
80103429:	89 c2                	mov    %eax,%edx
8010342b:	90                   	nop
8010342c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103430:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103433:	8d 42 01             	lea    0x1(%edx),%eax
80103436:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
8010343a:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
80103440:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
80103446:	0f b6 09             	movzbl (%ecx),%ecx
80103449:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
8010344d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103450:	3b 4d e0             	cmp    -0x20(%ebp),%ecx
80103453:	0f 85 65 ff ff ff    	jne    801033be <pipewrite+0x3e>
80103459:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
8010345f:	83 ec 0c             	sub    $0xc,%esp
80103462:	50                   	push   %eax
80103463:	e8 68 0a 00 00       	call   80103ed0 <wakeup>
80103468:	89 1c 24             	mov    %ebx,(%esp)
8010346b:	e8 40 0f 00 00       	call   801043b0 <release>
80103470:	83 c4 10             	add    $0x10,%esp
80103473:	8b 45 10             	mov    0x10(%ebp),%eax
80103476:	eb a9                	jmp    80103421 <pipewrite+0xa1>
80103478:	90                   	nop
80103479:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103480 <piperead>:
80103480:	55                   	push   %ebp
80103481:	89 e5                	mov    %esp,%ebp
80103483:	57                   	push   %edi
80103484:	56                   	push   %esi
80103485:	53                   	push   %ebx
80103486:	83 ec 18             	sub    $0x18,%esp
80103489:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010348c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010348f:	53                   	push   %ebx
80103490:	e8 fb 0d 00 00       	call   80104290 <acquire>
80103495:	83 c4 10             	add    $0x10,%esp
80103498:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010349e:	39 83 38 02 00 00    	cmp    %eax,0x238(%ebx)
801034a4:	75 6a                	jne    80103510 <piperead+0x90>
801034a6:	8b b3 40 02 00 00    	mov    0x240(%ebx),%esi
801034ac:	85 f6                	test   %esi,%esi
801034ae:	0f 84 cc 00 00 00    	je     80103580 <piperead+0x100>
801034b4:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
801034ba:	eb 2d                	jmp    801034e9 <piperead+0x69>
801034bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801034c0:	83 ec 08             	sub    $0x8,%esp
801034c3:	53                   	push   %ebx
801034c4:	56                   	push   %esi
801034c5:	e8 56 08 00 00       	call   80103d20 <sleep>
801034ca:	83 c4 10             	add    $0x10,%esp
801034cd:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
801034d3:	39 83 34 02 00 00    	cmp    %eax,0x234(%ebx)
801034d9:	75 35                	jne    80103510 <piperead+0x90>
801034db:	8b 93 40 02 00 00    	mov    0x240(%ebx),%edx
801034e1:	85 d2                	test   %edx,%edx
801034e3:	0f 84 97 00 00 00    	je     80103580 <piperead+0x100>
801034e9:	e8 82 02 00 00       	call   80103770 <myproc>
801034ee:	8b 48 24             	mov    0x24(%eax),%ecx
801034f1:	85 c9                	test   %ecx,%ecx
801034f3:	74 cb                	je     801034c0 <piperead+0x40>
801034f5:	83 ec 0c             	sub    $0xc,%esp
801034f8:	53                   	push   %ebx
801034f9:	e8 b2 0e 00 00       	call   801043b0 <release>
801034fe:	83 c4 10             	add    $0x10,%esp
80103501:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103504:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103509:	5b                   	pop    %ebx
8010350a:	5e                   	pop    %esi
8010350b:	5f                   	pop    %edi
8010350c:	5d                   	pop    %ebp
8010350d:	c3                   	ret    
8010350e:	66 90                	xchg   %ax,%ax
80103510:	8b 45 10             	mov    0x10(%ebp),%eax
80103513:	85 c0                	test   %eax,%eax
80103515:	7e 69                	jle    80103580 <piperead+0x100>
80103517:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010351d:	31 c9                	xor    %ecx,%ecx
8010351f:	eb 15                	jmp    80103536 <piperead+0xb6>
80103521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103528:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010352e:	3b 83 38 02 00 00    	cmp    0x238(%ebx),%eax
80103534:	74 5a                	je     80103590 <piperead+0x110>
80103536:	8d 70 01             	lea    0x1(%eax),%esi
80103539:	25 ff 01 00 00       	and    $0x1ff,%eax
8010353e:	89 b3 34 02 00 00    	mov    %esi,0x234(%ebx)
80103544:	0f b6 44 03 34       	movzbl 0x34(%ebx,%eax,1),%eax
80103549:	88 04 0f             	mov    %al,(%edi,%ecx,1)
8010354c:	83 c1 01             	add    $0x1,%ecx
8010354f:	39 4d 10             	cmp    %ecx,0x10(%ebp)
80103552:	75 d4                	jne    80103528 <piperead+0xa8>
80103554:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
8010355a:	83 ec 0c             	sub    $0xc,%esp
8010355d:	50                   	push   %eax
8010355e:	e8 6d 09 00 00       	call   80103ed0 <wakeup>
80103563:	89 1c 24             	mov    %ebx,(%esp)
80103566:	e8 45 0e 00 00       	call   801043b0 <release>
8010356b:	8b 45 10             	mov    0x10(%ebp),%eax
8010356e:	83 c4 10             	add    $0x10,%esp
80103571:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103574:	5b                   	pop    %ebx
80103575:	5e                   	pop    %esi
80103576:	5f                   	pop    %edi
80103577:	5d                   	pop    %ebp
80103578:	c3                   	ret    
80103579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103580:	c7 45 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
80103587:	eb cb                	jmp    80103554 <piperead+0xd4>
80103589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103590:	89 4d 10             	mov    %ecx,0x10(%ebp)
80103593:	eb bf                	jmp    80103554 <piperead+0xd4>
80103595:	66 90                	xchg   %ax,%ax
80103597:	66 90                	xchg   %ax,%ax
80103599:	66 90                	xchg   %ax,%ax
8010359b:	66 90                	xchg   %ax,%ax
8010359d:	66 90                	xchg   %ax,%ax
8010359f:	90                   	nop

801035a0 <allocproc>:
801035a0:	55                   	push   %ebp
801035a1:	89 e5                	mov    %esp,%ebp
801035a3:	53                   	push   %ebx
801035a4:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
801035a9:	83 ec 10             	sub    $0x10,%esp
801035ac:	68 20 2d 11 80       	push   $0x80112d20
801035b1:	e8 da 0c 00 00       	call   80104290 <acquire>
801035b6:	83 c4 10             	add    $0x10,%esp
801035b9:	eb 10                	jmp    801035cb <allocproc+0x2b>
801035bb:	90                   	nop
801035bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801035c0:	83 eb 80             	sub    $0xffffff80,%ebx
801035c3:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
801035c9:	74 75                	je     80103640 <allocproc+0xa0>
801035cb:	8b 43 0c             	mov    0xc(%ebx),%eax
801035ce:	85 c0                	test   %eax,%eax
801035d0:	75 ee                	jne    801035c0 <allocproc+0x20>
801035d2:	a1 04 a0 10 80       	mov    0x8010a004,%eax
801035d7:	83 ec 0c             	sub    $0xc,%esp
801035da:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
801035e1:	68 20 2d 11 80       	push   $0x80112d20
801035e6:	8d 50 01             	lea    0x1(%eax),%edx
801035e9:	89 43 10             	mov    %eax,0x10(%ebx)
801035ec:	89 15 04 a0 10 80    	mov    %edx,0x8010a004
801035f2:	e8 b9 0d 00 00       	call   801043b0 <release>
801035f7:	e8 84 ee ff ff       	call   80102480 <kalloc>
801035fc:	83 c4 10             	add    $0x10,%esp
801035ff:	85 c0                	test   %eax,%eax
80103601:	89 43 08             	mov    %eax,0x8(%ebx)
80103604:	74 51                	je     80103657 <allocproc+0xb7>
80103606:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
8010360c:	83 ec 04             	sub    $0x4,%esp
8010360f:	05 9c 0f 00 00       	add    $0xf9c,%eax
80103614:	89 53 18             	mov    %edx,0x18(%ebx)
80103617:	c7 40 14 a2 56 10 80 	movl   $0x801056a2,0x14(%eax)
8010361e:	6a 14                	push   $0x14
80103620:	6a 00                	push   $0x0
80103622:	50                   	push   %eax
80103623:	89 43 1c             	mov    %eax,0x1c(%ebx)
80103626:	e8 d5 0d 00 00       	call   80104400 <memset>
8010362b:	8b 43 1c             	mov    0x1c(%ebx),%eax
8010362e:	83 c4 10             	add    $0x10,%esp
80103631:	c7 40 10 60 36 10 80 	movl   $0x80103660,0x10(%eax)
80103638:	89 d8                	mov    %ebx,%eax
8010363a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010363d:	c9                   	leave  
8010363e:	c3                   	ret    
8010363f:	90                   	nop
80103640:	83 ec 0c             	sub    $0xc,%esp
80103643:	68 20 2d 11 80       	push   $0x80112d20
80103648:	e8 63 0d 00 00       	call   801043b0 <release>
8010364d:	83 c4 10             	add    $0x10,%esp
80103650:	31 c0                	xor    %eax,%eax
80103652:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103655:	c9                   	leave  
80103656:	c3                   	ret    
80103657:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
8010365e:	eb da                	jmp    8010363a <allocproc+0x9a>

80103660 <forkret>:
80103660:	55                   	push   %ebp
80103661:	89 e5                	mov    %esp,%ebp
80103663:	83 ec 14             	sub    $0x14,%esp
80103666:	68 20 2d 11 80       	push   $0x80112d20
8010366b:	e8 40 0d 00 00       	call   801043b0 <release>
80103670:	a1 00 a0 10 80       	mov    0x8010a000,%eax
80103675:	83 c4 10             	add    $0x10,%esp
80103678:	85 c0                	test   %eax,%eax
8010367a:	75 04                	jne    80103680 <forkret+0x20>
8010367c:	c9                   	leave  
8010367d:	c3                   	ret    
8010367e:	66 90                	xchg   %ax,%ax
80103680:	83 ec 0c             	sub    $0xc,%esp
80103683:	c7 05 00 a0 10 80 00 	movl   $0x0,0x8010a000
8010368a:	00 00 00 
8010368d:	6a 01                	push   $0x1
8010368f:	e8 cc dd ff ff       	call   80101460 <iinit>
80103694:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010369b:	e8 00 f4 ff ff       	call   80102aa0 <initlog>
801036a0:	83 c4 10             	add    $0x10,%esp
801036a3:	c9                   	leave  
801036a4:	c3                   	ret    
801036a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801036a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801036b0 <pinit>:
801036b0:	55                   	push   %ebp
801036b1:	89 e5                	mov    %esp,%ebp
801036b3:	83 ec 10             	sub    $0x10,%esp
801036b6:	68 75 75 10 80       	push   $0x80107575
801036bb:	68 20 2d 11 80       	push   $0x80112d20
801036c0:	e8 cb 0a 00 00       	call   80104190 <initlock>
801036c5:	83 c4 10             	add    $0x10,%esp
801036c8:	c9                   	leave  
801036c9:	c3                   	ret    
801036ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801036d0 <mycpu>:
801036d0:	55                   	push   %ebp
801036d1:	89 e5                	mov    %esp,%ebp
801036d3:	56                   	push   %esi
801036d4:	53                   	push   %ebx
801036d5:	9c                   	pushf  
801036d6:	58                   	pop    %eax
801036d7:	f6 c4 02             	test   $0x2,%ah
801036da:	75 5b                	jne    80103737 <mycpu+0x67>
801036dc:	e8 ff ef ff ff       	call   801026e0 <lapicid>
801036e1:	8b 35 00 2d 11 80    	mov    0x80112d00,%esi
801036e7:	85 f6                	test   %esi,%esi
801036e9:	7e 3f                	jle    8010372a <mycpu+0x5a>
801036eb:	0f b6 15 80 27 11 80 	movzbl 0x80112780,%edx
801036f2:	39 d0                	cmp    %edx,%eax
801036f4:	74 30                	je     80103726 <mycpu+0x56>
801036f6:	b9 30 28 11 80       	mov    $0x80112830,%ecx
801036fb:	31 d2                	xor    %edx,%edx
801036fd:	8d 76 00             	lea    0x0(%esi),%esi
80103700:	83 c2 01             	add    $0x1,%edx
80103703:	39 f2                	cmp    %esi,%edx
80103705:	74 23                	je     8010372a <mycpu+0x5a>
80103707:	0f b6 19             	movzbl (%ecx),%ebx
8010370a:	81 c1 b0 00 00 00    	add    $0xb0,%ecx
80103710:	39 d8                	cmp    %ebx,%eax
80103712:	75 ec                	jne    80103700 <mycpu+0x30>
80103714:	69 c2 b0 00 00 00    	imul   $0xb0,%edx,%eax
8010371a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010371d:	5b                   	pop    %ebx
8010371e:	05 80 27 11 80       	add    $0x80112780,%eax
80103723:	5e                   	pop    %esi
80103724:	5d                   	pop    %ebp
80103725:	c3                   	ret    
80103726:	31 d2                	xor    %edx,%edx
80103728:	eb ea                	jmp    80103714 <mycpu+0x44>
8010372a:	83 ec 0c             	sub    $0xc,%esp
8010372d:	68 7c 75 10 80       	push   $0x8010757c
80103732:	e8 39 cc ff ff       	call   80100370 <panic>
80103737:	83 ec 0c             	sub    $0xc,%esp
8010373a:	68 58 76 10 80       	push   $0x80107658
8010373f:	e8 2c cc ff ff       	call   80100370 <panic>
80103744:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010374a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103750 <cpuid>:
80103750:	55                   	push   %ebp
80103751:	89 e5                	mov    %esp,%ebp
80103753:	83 ec 08             	sub    $0x8,%esp
80103756:	e8 75 ff ff ff       	call   801036d0 <mycpu>
8010375b:	2d 80 27 11 80       	sub    $0x80112780,%eax
80103760:	c9                   	leave  
80103761:	c1 f8 04             	sar    $0x4,%eax
80103764:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
8010376a:	c3                   	ret    
8010376b:	90                   	nop
8010376c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103770 <myproc>:
80103770:	55                   	push   %ebp
80103771:	89 e5                	mov    %esp,%ebp
80103773:	53                   	push   %ebx
80103774:	83 ec 04             	sub    $0x4,%esp
80103777:	e8 d4 0a 00 00       	call   80104250 <pushcli>
8010377c:	e8 4f ff ff ff       	call   801036d0 <mycpu>
80103781:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103787:	e8 b4 0b 00 00       	call   80104340 <popcli>
8010378c:	83 c4 04             	add    $0x4,%esp
8010378f:	89 d8                	mov    %ebx,%eax
80103791:	5b                   	pop    %ebx
80103792:	5d                   	pop    %ebp
80103793:	c3                   	ret    
80103794:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010379a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801037a0 <userinit>:
801037a0:	55                   	push   %ebp
801037a1:	89 e5                	mov    %esp,%ebp
801037a3:	53                   	push   %ebx
801037a4:	83 ec 04             	sub    $0x4,%esp
801037a7:	e8 f4 fd ff ff       	call   801035a0 <allocproc>
801037ac:	89 c3                	mov    %eax,%ebx
801037ae:	a3 b8 a5 10 80       	mov    %eax,0x8010a5b8
801037b3:	e8 38 35 00 00       	call   80106cf0 <setupkvm>
801037b8:	85 c0                	test   %eax,%eax
801037ba:	89 43 04             	mov    %eax,0x4(%ebx)
801037bd:	0f 84 bd 00 00 00    	je     80103880 <userinit+0xe0>
801037c3:	83 ec 04             	sub    $0x4,%esp
801037c6:	68 2c 00 00 00       	push   $0x2c
801037cb:	68 60 a4 10 80       	push   $0x8010a460
801037d0:	50                   	push   %eax
801037d1:	e8 2a 32 00 00       	call   80106a00 <inituvm>
801037d6:	83 c4 0c             	add    $0xc,%esp
801037d9:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
801037df:	6a 4c                	push   $0x4c
801037e1:	6a 00                	push   $0x0
801037e3:	ff 73 18             	pushl  0x18(%ebx)
801037e6:	e8 15 0c 00 00       	call   80104400 <memset>
801037eb:	8b 43 18             	mov    0x18(%ebx),%eax
801037ee:	ba 1b 00 00 00       	mov    $0x1b,%edx
801037f3:	b9 23 00 00 00       	mov    $0x23,%ecx
801037f8:	83 c4 0c             	add    $0xc,%esp
801037fb:	66 89 50 3c          	mov    %dx,0x3c(%eax)
801037ff:	8b 43 18             	mov    0x18(%ebx),%eax
80103802:	66 89 48 2c          	mov    %cx,0x2c(%eax)
80103806:	8b 43 18             	mov    0x18(%ebx),%eax
80103809:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
8010380d:	66 89 50 28          	mov    %dx,0x28(%eax)
80103811:	8b 43 18             	mov    0x18(%ebx),%eax
80103814:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103818:	66 89 50 48          	mov    %dx,0x48(%eax)
8010381c:	8b 43 18             	mov    0x18(%ebx),%eax
8010381f:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
80103826:	8b 43 18             	mov    0x18(%ebx),%eax
80103829:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
80103830:	8b 43 18             	mov    0x18(%ebx),%eax
80103833:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
8010383a:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010383d:	6a 10                	push   $0x10
8010383f:	68 a5 75 10 80       	push   $0x801075a5
80103844:	50                   	push   %eax
80103845:	e8 b6 0d 00 00       	call   80104600 <safestrcpy>
8010384a:	c7 04 24 ae 75 10 80 	movl   $0x801075ae,(%esp)
80103851:	e8 5a e6 ff ff       	call   80101eb0 <namei>
80103856:	89 43 68             	mov    %eax,0x68(%ebx)
80103859:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103860:	e8 2b 0a 00 00       	call   80104290 <acquire>
80103865:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
8010386c:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103873:	e8 38 0b 00 00       	call   801043b0 <release>
80103878:	83 c4 10             	add    $0x10,%esp
8010387b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010387e:	c9                   	leave  
8010387f:	c3                   	ret    
80103880:	83 ec 0c             	sub    $0xc,%esp
80103883:	68 8c 75 10 80       	push   $0x8010758c
80103888:	e8 e3 ca ff ff       	call   80100370 <panic>
8010388d:	8d 76 00             	lea    0x0(%esi),%esi

80103890 <growproc>:
80103890:	55                   	push   %ebp
80103891:	89 e5                	mov    %esp,%ebp
80103893:	56                   	push   %esi
80103894:	53                   	push   %ebx
80103895:	8b 75 08             	mov    0x8(%ebp),%esi
80103898:	e8 b3 09 00 00       	call   80104250 <pushcli>
8010389d:	e8 2e fe ff ff       	call   801036d0 <mycpu>
801038a2:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
801038a8:	e8 93 0a 00 00       	call   80104340 <popcli>
801038ad:	83 fe 00             	cmp    $0x0,%esi
801038b0:	8b 03                	mov    (%ebx),%eax
801038b2:	7e 34                	jle    801038e8 <growproc+0x58>
801038b4:	83 ec 04             	sub    $0x4,%esp
801038b7:	01 c6                	add    %eax,%esi
801038b9:	56                   	push   %esi
801038ba:	50                   	push   %eax
801038bb:	ff 73 04             	pushl  0x4(%ebx)
801038be:	e8 7d 32 00 00       	call   80106b40 <allocuvm>
801038c3:	83 c4 10             	add    $0x10,%esp
801038c6:	85 c0                	test   %eax,%eax
801038c8:	74 36                	je     80103900 <growproc+0x70>
801038ca:	83 ec 0c             	sub    $0xc,%esp
801038cd:	89 03                	mov    %eax,(%ebx)
801038cf:	53                   	push   %ebx
801038d0:	e8 1b 30 00 00       	call   801068f0 <switchuvm>
801038d5:	83 c4 10             	add    $0x10,%esp
801038d8:	31 c0                	xor    %eax,%eax
801038da:	8d 65 f8             	lea    -0x8(%ebp),%esp
801038dd:	5b                   	pop    %ebx
801038de:	5e                   	pop    %esi
801038df:	5d                   	pop    %ebp
801038e0:	c3                   	ret    
801038e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801038e8:	74 e0                	je     801038ca <growproc+0x3a>
801038ea:	83 ec 04             	sub    $0x4,%esp
801038ed:	01 c6                	add    %eax,%esi
801038ef:	56                   	push   %esi
801038f0:	50                   	push   %eax
801038f1:	ff 73 04             	pushl  0x4(%ebx)
801038f4:	e8 47 33 00 00       	call   80106c40 <deallocuvm>
801038f9:	83 c4 10             	add    $0x10,%esp
801038fc:	85 c0                	test   %eax,%eax
801038fe:	75 ca                	jne    801038ca <growproc+0x3a>
80103900:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103905:	eb d3                	jmp    801038da <growproc+0x4a>
80103907:	89 f6                	mov    %esi,%esi
80103909:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103910 <fork>:
80103910:	55                   	push   %ebp
80103911:	89 e5                	mov    %esp,%ebp
80103913:	57                   	push   %edi
80103914:	56                   	push   %esi
80103915:	53                   	push   %ebx
80103916:	83 ec 1c             	sub    $0x1c,%esp
80103919:	e8 32 09 00 00       	call   80104250 <pushcli>
8010391e:	e8 ad fd ff ff       	call   801036d0 <mycpu>
80103923:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103929:	e8 12 0a 00 00       	call   80104340 <popcli>
8010392e:	e8 6d fc ff ff       	call   801035a0 <allocproc>
80103933:	85 c0                	test   %eax,%eax
80103935:	89 c7                	mov    %eax,%edi
80103937:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010393a:	0f 84 b5 00 00 00    	je     801039f5 <fork+0xe5>
80103940:	83 ec 08             	sub    $0x8,%esp
80103943:	ff 33                	pushl  (%ebx)
80103945:	ff 73 04             	pushl  0x4(%ebx)
80103948:	e8 73 34 00 00       	call   80106dc0 <copyuvm>
8010394d:	83 c4 10             	add    $0x10,%esp
80103950:	85 c0                	test   %eax,%eax
80103952:	89 47 04             	mov    %eax,0x4(%edi)
80103955:	0f 84 a1 00 00 00    	je     801039fc <fork+0xec>
8010395b:	8b 03                	mov    (%ebx),%eax
8010395d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103960:	89 01                	mov    %eax,(%ecx)
80103962:	89 59 14             	mov    %ebx,0x14(%ecx)
80103965:	89 c8                	mov    %ecx,%eax
80103967:	8b 79 18             	mov    0x18(%ecx),%edi
8010396a:	8b 73 18             	mov    0x18(%ebx),%esi
8010396d:	b9 13 00 00 00       	mov    $0x13,%ecx
80103972:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
80103974:	31 f6                	xor    %esi,%esi
80103976:	8b 40 18             	mov    0x18(%eax),%eax
80103979:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
80103980:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80103984:	85 c0                	test   %eax,%eax
80103986:	74 13                	je     8010399b <fork+0x8b>
80103988:	83 ec 0c             	sub    $0xc,%esp
8010398b:	50                   	push   %eax
8010398c:	e8 3f d4 ff ff       	call   80100dd0 <filedup>
80103991:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103994:	83 c4 10             	add    $0x10,%esp
80103997:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
8010399b:	83 c6 01             	add    $0x1,%esi
8010399e:	83 fe 10             	cmp    $0x10,%esi
801039a1:	75 dd                	jne    80103980 <fork+0x70>
801039a3:	83 ec 0c             	sub    $0xc,%esp
801039a6:	ff 73 68             	pushl  0x68(%ebx)
801039a9:	83 c3 6c             	add    $0x6c,%ebx
801039ac:	e8 7f dc ff ff       	call   80101630 <idup>
801039b1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801039b4:	83 c4 0c             	add    $0xc,%esp
801039b7:	89 47 68             	mov    %eax,0x68(%edi)
801039ba:	8d 47 6c             	lea    0x6c(%edi),%eax
801039bd:	6a 10                	push   $0x10
801039bf:	53                   	push   %ebx
801039c0:	50                   	push   %eax
801039c1:	e8 3a 0c 00 00       	call   80104600 <safestrcpy>
801039c6:	8b 5f 10             	mov    0x10(%edi),%ebx
801039c9:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
801039d0:	e8 bb 08 00 00       	call   80104290 <acquire>
801039d5:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)
801039dc:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
801039e3:	e8 c8 09 00 00       	call   801043b0 <release>
801039e8:	83 c4 10             	add    $0x10,%esp
801039eb:	89 d8                	mov    %ebx,%eax
801039ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
801039f0:	5b                   	pop    %ebx
801039f1:	5e                   	pop    %esi
801039f2:	5f                   	pop    %edi
801039f3:	5d                   	pop    %ebp
801039f4:	c3                   	ret    
801039f5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801039fa:	eb f1                	jmp    801039ed <fork+0xdd>
801039fc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801039ff:	83 ec 0c             	sub    $0xc,%esp
80103a02:	ff 77 08             	pushl  0x8(%edi)
80103a05:	e8 c6 e8 ff ff       	call   801022d0 <kfree>
80103a0a:	c7 47 08 00 00 00 00 	movl   $0x0,0x8(%edi)
80103a11:	c7 47 0c 00 00 00 00 	movl   $0x0,0xc(%edi)
80103a18:	83 c4 10             	add    $0x10,%esp
80103a1b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103a20:	eb cb                	jmp    801039ed <fork+0xdd>
80103a22:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103a29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103a30 <scheduler>:
80103a30:	55                   	push   %ebp
80103a31:	89 e5                	mov    %esp,%ebp
80103a33:	57                   	push   %edi
80103a34:	56                   	push   %esi
80103a35:	53                   	push   %ebx
80103a36:	83 ec 0c             	sub    $0xc,%esp
80103a39:	e8 92 fc ff ff       	call   801036d0 <mycpu>
80103a3e:	8d 78 04             	lea    0x4(%eax),%edi
80103a41:	89 c6                	mov    %eax,%esi
80103a43:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103a4a:	00 00 00 
80103a4d:	8d 76 00             	lea    0x0(%esi),%esi
80103a50:	fb                   	sti    
80103a51:	83 ec 0c             	sub    $0xc,%esp
80103a54:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
80103a59:	68 20 2d 11 80       	push   $0x80112d20
80103a5e:	e8 2d 08 00 00       	call   80104290 <acquire>
80103a63:	83 c4 10             	add    $0x10,%esp
80103a66:	eb 13                	jmp    80103a7b <scheduler+0x4b>
80103a68:	90                   	nop
80103a69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103a70:	83 eb 80             	sub    $0xffffff80,%ebx
80103a73:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
80103a79:	74 45                	je     80103ac0 <scheduler+0x90>
80103a7b:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103a7f:	75 ef                	jne    80103a70 <scheduler+0x40>
80103a81:	83 ec 0c             	sub    $0xc,%esp
80103a84:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
80103a8a:	53                   	push   %ebx
80103a8b:	83 eb 80             	sub    $0xffffff80,%ebx
80103a8e:	e8 5d 2e 00 00       	call   801068f0 <switchuvm>
80103a93:	58                   	pop    %eax
80103a94:	5a                   	pop    %edx
80103a95:	ff 73 9c             	pushl  -0x64(%ebx)
80103a98:	57                   	push   %edi
80103a99:	c7 43 8c 04 00 00 00 	movl   $0x4,-0x74(%ebx)
80103aa0:	e8 b6 0b 00 00       	call   8010465b <swtch>
80103aa5:	e8 26 2e 00 00       	call   801068d0 <switchkvm>
80103aaa:	83 c4 10             	add    $0x10,%esp
80103aad:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
80103ab3:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
80103aba:	00 00 00 
80103abd:	75 bc                	jne    80103a7b <scheduler+0x4b>
80103abf:	90                   	nop
80103ac0:	83 ec 0c             	sub    $0xc,%esp
80103ac3:	68 20 2d 11 80       	push   $0x80112d20
80103ac8:	e8 e3 08 00 00       	call   801043b0 <release>
80103acd:	83 c4 10             	add    $0x10,%esp
80103ad0:	e9 7b ff ff ff       	jmp    80103a50 <scheduler+0x20>
80103ad5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103ad9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103ae0 <sched>:
80103ae0:	55                   	push   %ebp
80103ae1:	89 e5                	mov    %esp,%ebp
80103ae3:	56                   	push   %esi
80103ae4:	53                   	push   %ebx
80103ae5:	e8 66 07 00 00       	call   80104250 <pushcli>
80103aea:	e8 e1 fb ff ff       	call   801036d0 <mycpu>
80103aef:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103af5:	e8 46 08 00 00       	call   80104340 <popcli>
80103afa:	83 ec 0c             	sub    $0xc,%esp
80103afd:	68 20 2d 11 80       	push   $0x80112d20
80103b02:	e8 09 07 00 00       	call   80104210 <holding>
80103b07:	83 c4 10             	add    $0x10,%esp
80103b0a:	85 c0                	test   %eax,%eax
80103b0c:	74 4f                	je     80103b5d <sched+0x7d>
80103b0e:	e8 bd fb ff ff       	call   801036d0 <mycpu>
80103b13:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103b1a:	75 68                	jne    80103b84 <sched+0xa4>
80103b1c:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103b20:	74 55                	je     80103b77 <sched+0x97>
80103b22:	9c                   	pushf  
80103b23:	58                   	pop    %eax
80103b24:	f6 c4 02             	test   $0x2,%ah
80103b27:	75 41                	jne    80103b6a <sched+0x8a>
80103b29:	e8 a2 fb ff ff       	call   801036d0 <mycpu>
80103b2e:	83 c3 1c             	add    $0x1c,%ebx
80103b31:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
80103b37:	e8 94 fb ff ff       	call   801036d0 <mycpu>
80103b3c:	83 ec 08             	sub    $0x8,%esp
80103b3f:	ff 70 04             	pushl  0x4(%eax)
80103b42:	53                   	push   %ebx
80103b43:	e8 13 0b 00 00       	call   8010465b <swtch>
80103b48:	e8 83 fb ff ff       	call   801036d0 <mycpu>
80103b4d:	83 c4 10             	add    $0x10,%esp
80103b50:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
80103b56:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103b59:	5b                   	pop    %ebx
80103b5a:	5e                   	pop    %esi
80103b5b:	5d                   	pop    %ebp
80103b5c:	c3                   	ret    
80103b5d:	83 ec 0c             	sub    $0xc,%esp
80103b60:	68 b0 75 10 80       	push   $0x801075b0
80103b65:	e8 06 c8 ff ff       	call   80100370 <panic>
80103b6a:	83 ec 0c             	sub    $0xc,%esp
80103b6d:	68 dc 75 10 80       	push   $0x801075dc
80103b72:	e8 f9 c7 ff ff       	call   80100370 <panic>
80103b77:	83 ec 0c             	sub    $0xc,%esp
80103b7a:	68 ce 75 10 80       	push   $0x801075ce
80103b7f:	e8 ec c7 ff ff       	call   80100370 <panic>
80103b84:	83 ec 0c             	sub    $0xc,%esp
80103b87:	68 c2 75 10 80       	push   $0x801075c2
80103b8c:	e8 df c7 ff ff       	call   80100370 <panic>
80103b91:	eb 0d                	jmp    80103ba0 <exit>
80103b93:	90                   	nop
80103b94:	90                   	nop
80103b95:	90                   	nop
80103b96:	90                   	nop
80103b97:	90                   	nop
80103b98:	90                   	nop
80103b99:	90                   	nop
80103b9a:	90                   	nop
80103b9b:	90                   	nop
80103b9c:	90                   	nop
80103b9d:	90                   	nop
80103b9e:	90                   	nop
80103b9f:	90                   	nop

80103ba0 <exit>:
80103ba0:	55                   	push   %ebp
80103ba1:	89 e5                	mov    %esp,%ebp
80103ba3:	57                   	push   %edi
80103ba4:	56                   	push   %esi
80103ba5:	53                   	push   %ebx
80103ba6:	83 ec 0c             	sub    $0xc,%esp
80103ba9:	e8 a2 06 00 00       	call   80104250 <pushcli>
80103bae:	e8 1d fb ff ff       	call   801036d0 <mycpu>
80103bb3:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
80103bb9:	e8 82 07 00 00       	call   80104340 <popcli>
80103bbe:	39 35 b8 a5 10 80    	cmp    %esi,0x8010a5b8
80103bc4:	8d 5e 28             	lea    0x28(%esi),%ebx
80103bc7:	8d 7e 68             	lea    0x68(%esi),%edi
80103bca:	0f 84 e7 00 00 00    	je     80103cb7 <exit+0x117>
80103bd0:	8b 03                	mov    (%ebx),%eax
80103bd2:	85 c0                	test   %eax,%eax
80103bd4:	74 12                	je     80103be8 <exit+0x48>
80103bd6:	83 ec 0c             	sub    $0xc,%esp
80103bd9:	50                   	push   %eax
80103bda:	e8 41 d2 ff ff       	call   80100e20 <fileclose>
80103bdf:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103be5:	83 c4 10             	add    $0x10,%esp
80103be8:	83 c3 04             	add    $0x4,%ebx
80103beb:	39 df                	cmp    %ebx,%edi
80103bed:	75 e1                	jne    80103bd0 <exit+0x30>
80103bef:	e8 4c ef ff ff       	call   80102b40 <begin_op>
80103bf4:	83 ec 0c             	sub    $0xc,%esp
80103bf7:	ff 76 68             	pushl  0x68(%esi)
80103bfa:	e8 91 db ff ff       	call   80101790 <iput>
80103bff:	e8 ac ef ff ff       	call   80102bb0 <end_op>
80103c04:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)
80103c0b:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103c12:	e8 79 06 00 00       	call   80104290 <acquire>
80103c17:	8b 56 14             	mov    0x14(%esi),%edx
80103c1a:	83 c4 10             	add    $0x10,%esp
80103c1d:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103c22:	eb 0e                	jmp    80103c32 <exit+0x92>
80103c24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103c28:	83 e8 80             	sub    $0xffffff80,%eax
80103c2b:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80103c30:	74 1c                	je     80103c4e <exit+0xae>
80103c32:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103c36:	75 f0                	jne    80103c28 <exit+0x88>
80103c38:	3b 50 20             	cmp    0x20(%eax),%edx
80103c3b:	75 eb                	jne    80103c28 <exit+0x88>
80103c3d:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103c44:	83 e8 80             	sub    $0xffffff80,%eax
80103c47:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80103c4c:	75 e4                	jne    80103c32 <exit+0x92>
80103c4e:	8b 0d b8 a5 10 80    	mov    0x8010a5b8,%ecx
80103c54:	ba 54 2d 11 80       	mov    $0x80112d54,%edx
80103c59:	eb 10                	jmp    80103c6b <exit+0xcb>
80103c5b:	90                   	nop
80103c5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103c60:	83 ea 80             	sub    $0xffffff80,%edx
80103c63:	81 fa 54 4d 11 80    	cmp    $0x80114d54,%edx
80103c69:	74 33                	je     80103c9e <exit+0xfe>
80103c6b:	39 72 14             	cmp    %esi,0x14(%edx)
80103c6e:	75 f0                	jne    80103c60 <exit+0xc0>
80103c70:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
80103c74:	89 4a 14             	mov    %ecx,0x14(%edx)
80103c77:	75 e7                	jne    80103c60 <exit+0xc0>
80103c79:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103c7e:	eb 0a                	jmp    80103c8a <exit+0xea>
80103c80:	83 e8 80             	sub    $0xffffff80,%eax
80103c83:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80103c88:	74 d6                	je     80103c60 <exit+0xc0>
80103c8a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103c8e:	75 f0                	jne    80103c80 <exit+0xe0>
80103c90:	3b 48 20             	cmp    0x20(%eax),%ecx
80103c93:	75 eb                	jne    80103c80 <exit+0xe0>
80103c95:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103c9c:	eb e2                	jmp    80103c80 <exit+0xe0>
80103c9e:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
80103ca5:	e8 36 fe ff ff       	call   80103ae0 <sched>
80103caa:	83 ec 0c             	sub    $0xc,%esp
80103cad:	68 fd 75 10 80       	push   $0x801075fd
80103cb2:	e8 b9 c6 ff ff       	call   80100370 <panic>
80103cb7:	83 ec 0c             	sub    $0xc,%esp
80103cba:	68 f0 75 10 80       	push   $0x801075f0
80103cbf:	e8 ac c6 ff ff       	call   80100370 <panic>
80103cc4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103cca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103cd0 <yield>:
80103cd0:	55                   	push   %ebp
80103cd1:	89 e5                	mov    %esp,%ebp
80103cd3:	53                   	push   %ebx
80103cd4:	83 ec 10             	sub    $0x10,%esp
80103cd7:	68 20 2d 11 80       	push   $0x80112d20
80103cdc:	e8 af 05 00 00       	call   80104290 <acquire>
80103ce1:	e8 6a 05 00 00       	call   80104250 <pushcli>
80103ce6:	e8 e5 f9 ff ff       	call   801036d0 <mycpu>
80103ceb:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103cf1:	e8 4a 06 00 00       	call   80104340 <popcli>
80103cf6:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
80103cfd:	e8 de fd ff ff       	call   80103ae0 <sched>
80103d02:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103d09:	e8 a2 06 00 00       	call   801043b0 <release>
80103d0e:	83 c4 10             	add    $0x10,%esp
80103d11:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103d14:	c9                   	leave  
80103d15:	c3                   	ret    
80103d16:	8d 76 00             	lea    0x0(%esi),%esi
80103d19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103d20 <sleep>:
80103d20:	55                   	push   %ebp
80103d21:	89 e5                	mov    %esp,%ebp
80103d23:	57                   	push   %edi
80103d24:	56                   	push   %esi
80103d25:	53                   	push   %ebx
80103d26:	83 ec 0c             	sub    $0xc,%esp
80103d29:	8b 7d 08             	mov    0x8(%ebp),%edi
80103d2c:	8b 75 0c             	mov    0xc(%ebp),%esi
80103d2f:	e8 1c 05 00 00       	call   80104250 <pushcli>
80103d34:	e8 97 f9 ff ff       	call   801036d0 <mycpu>
80103d39:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103d3f:	e8 fc 05 00 00       	call   80104340 <popcli>
80103d44:	85 db                	test   %ebx,%ebx
80103d46:	0f 84 87 00 00 00    	je     80103dd3 <sleep+0xb3>
80103d4c:	85 f6                	test   %esi,%esi
80103d4e:	74 76                	je     80103dc6 <sleep+0xa6>
80103d50:	81 fe 20 2d 11 80    	cmp    $0x80112d20,%esi
80103d56:	74 50                	je     80103da8 <sleep+0x88>
80103d58:	83 ec 0c             	sub    $0xc,%esp
80103d5b:	68 20 2d 11 80       	push   $0x80112d20
80103d60:	e8 2b 05 00 00       	call   80104290 <acquire>
80103d65:	89 34 24             	mov    %esi,(%esp)
80103d68:	e8 43 06 00 00       	call   801043b0 <release>
80103d6d:	89 7b 20             	mov    %edi,0x20(%ebx)
80103d70:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
80103d77:	e8 64 fd ff ff       	call   80103ae0 <sched>
80103d7c:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
80103d83:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103d8a:	e8 21 06 00 00       	call   801043b0 <release>
80103d8f:	89 75 08             	mov    %esi,0x8(%ebp)
80103d92:	83 c4 10             	add    $0x10,%esp
80103d95:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103d98:	5b                   	pop    %ebx
80103d99:	5e                   	pop    %esi
80103d9a:	5f                   	pop    %edi
80103d9b:	5d                   	pop    %ebp
80103d9c:	e9 ef 04 00 00       	jmp    80104290 <acquire>
80103da1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103da8:	89 7b 20             	mov    %edi,0x20(%ebx)
80103dab:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
80103db2:	e8 29 fd ff ff       	call   80103ae0 <sched>
80103db7:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
80103dbe:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103dc1:	5b                   	pop    %ebx
80103dc2:	5e                   	pop    %esi
80103dc3:	5f                   	pop    %edi
80103dc4:	5d                   	pop    %ebp
80103dc5:	c3                   	ret    
80103dc6:	83 ec 0c             	sub    $0xc,%esp
80103dc9:	68 0f 76 10 80       	push   $0x8010760f
80103dce:	e8 9d c5 ff ff       	call   80100370 <panic>
80103dd3:	83 ec 0c             	sub    $0xc,%esp
80103dd6:	68 09 76 10 80       	push   $0x80107609
80103ddb:	e8 90 c5 ff ff       	call   80100370 <panic>

80103de0 <wait>:
80103de0:	55                   	push   %ebp
80103de1:	89 e5                	mov    %esp,%ebp
80103de3:	56                   	push   %esi
80103de4:	53                   	push   %ebx
80103de5:	e8 66 04 00 00       	call   80104250 <pushcli>
80103dea:	e8 e1 f8 ff ff       	call   801036d0 <mycpu>
80103def:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
80103df5:	e8 46 05 00 00       	call   80104340 <popcli>
80103dfa:	83 ec 0c             	sub    $0xc,%esp
80103dfd:	68 20 2d 11 80       	push   $0x80112d20
80103e02:	e8 89 04 00 00       	call   80104290 <acquire>
80103e07:	83 c4 10             	add    $0x10,%esp
80103e0a:	31 c0                	xor    %eax,%eax
80103e0c:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
80103e11:	eb 10                	jmp    80103e23 <wait+0x43>
80103e13:	90                   	nop
80103e14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103e18:	83 eb 80             	sub    $0xffffff80,%ebx
80103e1b:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
80103e21:	74 1d                	je     80103e40 <wait+0x60>
80103e23:	39 73 14             	cmp    %esi,0x14(%ebx)
80103e26:	75 f0                	jne    80103e18 <wait+0x38>
80103e28:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103e2c:	74 30                	je     80103e5e <wait+0x7e>
80103e2e:	83 eb 80             	sub    $0xffffff80,%ebx
80103e31:	b8 01 00 00 00       	mov    $0x1,%eax
80103e36:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
80103e3c:	75 e5                	jne    80103e23 <wait+0x43>
80103e3e:	66 90                	xchg   %ax,%ax
80103e40:	85 c0                	test   %eax,%eax
80103e42:	74 70                	je     80103eb4 <wait+0xd4>
80103e44:	8b 46 24             	mov    0x24(%esi),%eax
80103e47:	85 c0                	test   %eax,%eax
80103e49:	75 69                	jne    80103eb4 <wait+0xd4>
80103e4b:	83 ec 08             	sub    $0x8,%esp
80103e4e:	68 20 2d 11 80       	push   $0x80112d20
80103e53:	56                   	push   %esi
80103e54:	e8 c7 fe ff ff       	call   80103d20 <sleep>
80103e59:	83 c4 10             	add    $0x10,%esp
80103e5c:	eb ac                	jmp    80103e0a <wait+0x2a>
80103e5e:	83 ec 0c             	sub    $0xc,%esp
80103e61:	ff 73 08             	pushl  0x8(%ebx)
80103e64:	8b 73 10             	mov    0x10(%ebx),%esi
80103e67:	e8 64 e4 ff ff       	call   801022d0 <kfree>
80103e6c:	5a                   	pop    %edx
80103e6d:	ff 73 04             	pushl  0x4(%ebx)
80103e70:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80103e77:	e8 f4 2d 00 00       	call   80106c70 <freevm>
80103e7c:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
80103e83:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
80103e8a:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
80103e8e:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
80103e95:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80103e9c:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103ea3:	e8 08 05 00 00       	call   801043b0 <release>
80103ea8:	83 c4 10             	add    $0x10,%esp
80103eab:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103eae:	89 f0                	mov    %esi,%eax
80103eb0:	5b                   	pop    %ebx
80103eb1:	5e                   	pop    %esi
80103eb2:	5d                   	pop    %ebp
80103eb3:	c3                   	ret    
80103eb4:	83 ec 0c             	sub    $0xc,%esp
80103eb7:	68 20 2d 11 80       	push   $0x80112d20
80103ebc:	e8 ef 04 00 00       	call   801043b0 <release>
80103ec1:	83 c4 10             	add    $0x10,%esp
80103ec4:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103ec7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103ecc:	5b                   	pop    %ebx
80103ecd:	5e                   	pop    %esi
80103ece:	5d                   	pop    %ebp
80103ecf:	c3                   	ret    

80103ed0 <wakeup>:
80103ed0:	55                   	push   %ebp
80103ed1:	89 e5                	mov    %esp,%ebp
80103ed3:	53                   	push   %ebx
80103ed4:	83 ec 10             	sub    $0x10,%esp
80103ed7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103eda:	68 20 2d 11 80       	push   $0x80112d20
80103edf:	e8 ac 03 00 00       	call   80104290 <acquire>
80103ee4:	83 c4 10             	add    $0x10,%esp
80103ee7:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103eec:	eb 0c                	jmp    80103efa <wakeup+0x2a>
80103eee:	66 90                	xchg   %ax,%ax
80103ef0:	83 e8 80             	sub    $0xffffff80,%eax
80103ef3:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80103ef8:	74 1c                	je     80103f16 <wakeup+0x46>
80103efa:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103efe:	75 f0                	jne    80103ef0 <wakeup+0x20>
80103f00:	3b 58 20             	cmp    0x20(%eax),%ebx
80103f03:	75 eb                	jne    80103ef0 <wakeup+0x20>
80103f05:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103f0c:	83 e8 80             	sub    $0xffffff80,%eax
80103f0f:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80103f14:	75 e4                	jne    80103efa <wakeup+0x2a>
80103f16:	c7 45 08 20 2d 11 80 	movl   $0x80112d20,0x8(%ebp)
80103f1d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103f20:	c9                   	leave  
80103f21:	e9 8a 04 00 00       	jmp    801043b0 <release>
80103f26:	8d 76 00             	lea    0x0(%esi),%esi
80103f29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103f30 <kill>:
80103f30:	55                   	push   %ebp
80103f31:	89 e5                	mov    %esp,%ebp
80103f33:	53                   	push   %ebx
80103f34:	83 ec 10             	sub    $0x10,%esp
80103f37:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103f3a:	68 20 2d 11 80       	push   $0x80112d20
80103f3f:	e8 4c 03 00 00       	call   80104290 <acquire>
80103f44:	83 c4 10             	add    $0x10,%esp
80103f47:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103f4c:	eb 0c                	jmp    80103f5a <kill+0x2a>
80103f4e:	66 90                	xchg   %ax,%ax
80103f50:	83 e8 80             	sub    $0xffffff80,%eax
80103f53:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80103f58:	74 3e                	je     80103f98 <kill+0x68>
80103f5a:	39 58 10             	cmp    %ebx,0x10(%eax)
80103f5d:	75 f1                	jne    80103f50 <kill+0x20>
80103f5f:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103f63:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
80103f6a:	74 1c                	je     80103f88 <kill+0x58>
80103f6c:	83 ec 0c             	sub    $0xc,%esp
80103f6f:	68 20 2d 11 80       	push   $0x80112d20
80103f74:	e8 37 04 00 00       	call   801043b0 <release>
80103f79:	83 c4 10             	add    $0x10,%esp
80103f7c:	31 c0                	xor    %eax,%eax
80103f7e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103f81:	c9                   	leave  
80103f82:	c3                   	ret    
80103f83:	90                   	nop
80103f84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103f88:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103f8f:	eb db                	jmp    80103f6c <kill+0x3c>
80103f91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103f98:	83 ec 0c             	sub    $0xc,%esp
80103f9b:	68 20 2d 11 80       	push   $0x80112d20
80103fa0:	e8 0b 04 00 00       	call   801043b0 <release>
80103fa5:	83 c4 10             	add    $0x10,%esp
80103fa8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103fad:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103fb0:	c9                   	leave  
80103fb1:	c3                   	ret    
80103fb2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103fb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103fc0 <procdump>:
80103fc0:	55                   	push   %ebp
80103fc1:	89 e5                	mov    %esp,%ebp
80103fc3:	57                   	push   %edi
80103fc4:	56                   	push   %esi
80103fc5:	53                   	push   %ebx
80103fc6:	8d 75 e8             	lea    -0x18(%ebp),%esi
80103fc9:	bb c0 2d 11 80       	mov    $0x80112dc0,%ebx
80103fce:	83 ec 3c             	sub    $0x3c,%esp
80103fd1:	eb 24                	jmp    80103ff7 <procdump+0x37>
80103fd3:	90                   	nop
80103fd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103fd8:	83 ec 0c             	sub    $0xc,%esp
80103fdb:	68 e7 79 10 80       	push   $0x801079e7
80103fe0:	e8 7b c6 ff ff       	call   80100660 <cprintf>
80103fe5:	83 c4 10             	add    $0x10,%esp
80103fe8:	83 eb 80             	sub    $0xffffff80,%ebx
80103feb:	81 fb c0 4d 11 80    	cmp    $0x80114dc0,%ebx
80103ff1:	0f 84 81 00 00 00    	je     80104078 <procdump+0xb8>
80103ff7:	8b 43 a0             	mov    -0x60(%ebx),%eax
80103ffa:	85 c0                	test   %eax,%eax
80103ffc:	74 ea                	je     80103fe8 <procdump+0x28>
80103ffe:	83 f8 05             	cmp    $0x5,%eax
80104001:	ba 20 76 10 80       	mov    $0x80107620,%edx
80104006:	77 11                	ja     80104019 <procdump+0x59>
80104008:	8b 14 85 80 76 10 80 	mov    -0x7fef8980(,%eax,4),%edx
8010400f:	b8 20 76 10 80       	mov    $0x80107620,%eax
80104014:	85 d2                	test   %edx,%edx
80104016:	0f 44 d0             	cmove  %eax,%edx
80104019:	53                   	push   %ebx
8010401a:	52                   	push   %edx
8010401b:	ff 73 a4             	pushl  -0x5c(%ebx)
8010401e:	68 24 76 10 80       	push   $0x80107624
80104023:	e8 38 c6 ff ff       	call   80100660 <cprintf>
80104028:	83 c4 10             	add    $0x10,%esp
8010402b:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
8010402f:	75 a7                	jne    80103fd8 <procdump+0x18>
80104031:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104034:	83 ec 08             	sub    $0x8,%esp
80104037:	8d 7d c0             	lea    -0x40(%ebp),%edi
8010403a:	50                   	push   %eax
8010403b:	8b 43 b0             	mov    -0x50(%ebx),%eax
8010403e:	8b 40 0c             	mov    0xc(%eax),%eax
80104041:	83 c0 08             	add    $0x8,%eax
80104044:	50                   	push   %eax
80104045:	e8 66 01 00 00       	call   801041b0 <getcallerpcs>
8010404a:	83 c4 10             	add    $0x10,%esp
8010404d:	8d 76 00             	lea    0x0(%esi),%esi
80104050:	8b 17                	mov    (%edi),%edx
80104052:	85 d2                	test   %edx,%edx
80104054:	74 82                	je     80103fd8 <procdump+0x18>
80104056:	83 ec 08             	sub    $0x8,%esp
80104059:	83 c7 04             	add    $0x4,%edi
8010405c:	52                   	push   %edx
8010405d:	68 61 70 10 80       	push   $0x80107061
80104062:	e8 f9 c5 ff ff       	call   80100660 <cprintf>
80104067:	83 c4 10             	add    $0x10,%esp
8010406a:	39 f7                	cmp    %esi,%edi
8010406c:	75 e2                	jne    80104050 <procdump+0x90>
8010406e:	e9 65 ff ff ff       	jmp    80103fd8 <procdump+0x18>
80104073:	90                   	nop
80104074:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104078:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010407b:	5b                   	pop    %ebx
8010407c:	5e                   	pop    %esi
8010407d:	5f                   	pop    %edi
8010407e:	5d                   	pop    %ebp
8010407f:	c3                   	ret    

80104080 <initsleeplock>:
80104080:	55                   	push   %ebp
80104081:	89 e5                	mov    %esp,%ebp
80104083:	53                   	push   %ebx
80104084:	83 ec 0c             	sub    $0xc,%esp
80104087:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010408a:	68 98 76 10 80       	push   $0x80107698
8010408f:	8d 43 04             	lea    0x4(%ebx),%eax
80104092:	50                   	push   %eax
80104093:	e8 f8 00 00 00       	call   80104190 <initlock>
80104098:	8b 45 0c             	mov    0xc(%ebp),%eax
8010409b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801040a1:	83 c4 10             	add    $0x10,%esp
801040a4:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
801040ab:	89 43 38             	mov    %eax,0x38(%ebx)
801040ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801040b1:	c9                   	leave  
801040b2:	c3                   	ret    
801040b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801040b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801040c0 <acquiresleep>:
801040c0:	55                   	push   %ebp
801040c1:	89 e5                	mov    %esp,%ebp
801040c3:	56                   	push   %esi
801040c4:	53                   	push   %ebx
801040c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801040c8:	83 ec 0c             	sub    $0xc,%esp
801040cb:	8d 73 04             	lea    0x4(%ebx),%esi
801040ce:	56                   	push   %esi
801040cf:	e8 bc 01 00 00       	call   80104290 <acquire>
801040d4:	8b 13                	mov    (%ebx),%edx
801040d6:	83 c4 10             	add    $0x10,%esp
801040d9:	85 d2                	test   %edx,%edx
801040db:	74 16                	je     801040f3 <acquiresleep+0x33>
801040dd:	8d 76 00             	lea    0x0(%esi),%esi
801040e0:	83 ec 08             	sub    $0x8,%esp
801040e3:	56                   	push   %esi
801040e4:	53                   	push   %ebx
801040e5:	e8 36 fc ff ff       	call   80103d20 <sleep>
801040ea:	8b 03                	mov    (%ebx),%eax
801040ec:	83 c4 10             	add    $0x10,%esp
801040ef:	85 c0                	test   %eax,%eax
801040f1:	75 ed                	jne    801040e0 <acquiresleep+0x20>
801040f3:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
801040f9:	e8 72 f6 ff ff       	call   80103770 <myproc>
801040fe:	8b 40 10             	mov    0x10(%eax),%eax
80104101:	89 43 3c             	mov    %eax,0x3c(%ebx)
80104104:	89 75 08             	mov    %esi,0x8(%ebp)
80104107:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010410a:	5b                   	pop    %ebx
8010410b:	5e                   	pop    %esi
8010410c:	5d                   	pop    %ebp
8010410d:	e9 9e 02 00 00       	jmp    801043b0 <release>
80104112:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104120 <releasesleep>:
80104120:	55                   	push   %ebp
80104121:	89 e5                	mov    %esp,%ebp
80104123:	56                   	push   %esi
80104124:	53                   	push   %ebx
80104125:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104128:	83 ec 0c             	sub    $0xc,%esp
8010412b:	8d 73 04             	lea    0x4(%ebx),%esi
8010412e:	56                   	push   %esi
8010412f:	e8 5c 01 00 00       	call   80104290 <acquire>
80104134:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010413a:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
80104141:	89 1c 24             	mov    %ebx,(%esp)
80104144:	e8 87 fd ff ff       	call   80103ed0 <wakeup>
80104149:	89 75 08             	mov    %esi,0x8(%ebp)
8010414c:	83 c4 10             	add    $0x10,%esp
8010414f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104152:	5b                   	pop    %ebx
80104153:	5e                   	pop    %esi
80104154:	5d                   	pop    %ebp
80104155:	e9 56 02 00 00       	jmp    801043b0 <release>
8010415a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104160 <holdingsleep>:
80104160:	55                   	push   %ebp
80104161:	89 e5                	mov    %esp,%ebp
80104163:	56                   	push   %esi
80104164:	53                   	push   %ebx
80104165:	8b 75 08             	mov    0x8(%ebp),%esi
80104168:	83 ec 0c             	sub    $0xc,%esp
8010416b:	8d 5e 04             	lea    0x4(%esi),%ebx
8010416e:	53                   	push   %ebx
8010416f:	e8 1c 01 00 00       	call   80104290 <acquire>
80104174:	8b 36                	mov    (%esi),%esi
80104176:	89 1c 24             	mov    %ebx,(%esp)
80104179:	e8 32 02 00 00       	call   801043b0 <release>
8010417e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104181:	89 f0                	mov    %esi,%eax
80104183:	5b                   	pop    %ebx
80104184:	5e                   	pop    %esi
80104185:	5d                   	pop    %ebp
80104186:	c3                   	ret    
80104187:	66 90                	xchg   %ax,%ax
80104189:	66 90                	xchg   %ax,%ax
8010418b:	66 90                	xchg   %ax,%ax
8010418d:	66 90                	xchg   %ax,%ax
8010418f:	90                   	nop

80104190 <initlock>:
80104190:	55                   	push   %ebp
80104191:	89 e5                	mov    %esp,%ebp
80104193:	8b 45 08             	mov    0x8(%ebp),%eax
80104196:	8b 55 0c             	mov    0xc(%ebp),%edx
80104199:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
8010419f:	89 50 04             	mov    %edx,0x4(%eax)
801041a2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
801041a9:	5d                   	pop    %ebp
801041aa:	c3                   	ret    
801041ab:	90                   	nop
801041ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801041b0 <getcallerpcs>:
801041b0:	55                   	push   %ebp
801041b1:	89 e5                	mov    %esp,%ebp
801041b3:	53                   	push   %ebx
801041b4:	8b 45 08             	mov    0x8(%ebp),%eax
801041b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801041ba:	8d 50 f8             	lea    -0x8(%eax),%edx
801041bd:	31 c0                	xor    %eax,%eax
801041bf:	90                   	nop
801041c0:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
801041c6:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801041cc:	77 1a                	ja     801041e8 <getcallerpcs+0x38>
801041ce:	8b 5a 04             	mov    0x4(%edx),%ebx
801041d1:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
801041d4:	83 c0 01             	add    $0x1,%eax
801041d7:	8b 12                	mov    (%edx),%edx
801041d9:	83 f8 0a             	cmp    $0xa,%eax
801041dc:	75 e2                	jne    801041c0 <getcallerpcs+0x10>
801041de:	5b                   	pop    %ebx
801041df:	5d                   	pop    %ebp
801041e0:	c3                   	ret    
801041e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801041e8:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
801041ef:	83 c0 01             	add    $0x1,%eax
801041f2:	83 f8 0a             	cmp    $0xa,%eax
801041f5:	74 e7                	je     801041de <getcallerpcs+0x2e>
801041f7:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
801041fe:	83 c0 01             	add    $0x1,%eax
80104201:	83 f8 0a             	cmp    $0xa,%eax
80104204:	75 e2                	jne    801041e8 <getcallerpcs+0x38>
80104206:	eb d6                	jmp    801041de <getcallerpcs+0x2e>
80104208:	90                   	nop
80104209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104210 <holding>:
80104210:	55                   	push   %ebp
80104211:	89 e5                	mov    %esp,%ebp
80104213:	53                   	push   %ebx
80104214:	83 ec 04             	sub    $0x4,%esp
80104217:	8b 55 08             	mov    0x8(%ebp),%edx
8010421a:	8b 02                	mov    (%edx),%eax
8010421c:	85 c0                	test   %eax,%eax
8010421e:	75 10                	jne    80104230 <holding+0x20>
80104220:	83 c4 04             	add    $0x4,%esp
80104223:	31 c0                	xor    %eax,%eax
80104225:	5b                   	pop    %ebx
80104226:	5d                   	pop    %ebp
80104227:	c3                   	ret    
80104228:	90                   	nop
80104229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104230:	8b 5a 08             	mov    0x8(%edx),%ebx
80104233:	e8 98 f4 ff ff       	call   801036d0 <mycpu>
80104238:	39 c3                	cmp    %eax,%ebx
8010423a:	0f 94 c0             	sete   %al
8010423d:	83 c4 04             	add    $0x4,%esp
80104240:	0f b6 c0             	movzbl %al,%eax
80104243:	5b                   	pop    %ebx
80104244:	5d                   	pop    %ebp
80104245:	c3                   	ret    
80104246:	8d 76 00             	lea    0x0(%esi),%esi
80104249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104250 <pushcli>:
80104250:	55                   	push   %ebp
80104251:	89 e5                	mov    %esp,%ebp
80104253:	53                   	push   %ebx
80104254:	83 ec 04             	sub    $0x4,%esp
80104257:	9c                   	pushf  
80104258:	5b                   	pop    %ebx
80104259:	fa                   	cli    
8010425a:	e8 71 f4 ff ff       	call   801036d0 <mycpu>
8010425f:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
80104265:	85 c0                	test   %eax,%eax
80104267:	75 11                	jne    8010427a <pushcli+0x2a>
80104269:	81 e3 00 02 00 00    	and    $0x200,%ebx
8010426f:	e8 5c f4 ff ff       	call   801036d0 <mycpu>
80104274:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
8010427a:	e8 51 f4 ff ff       	call   801036d0 <mycpu>
8010427f:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
80104286:	83 c4 04             	add    $0x4,%esp
80104289:	5b                   	pop    %ebx
8010428a:	5d                   	pop    %ebp
8010428b:	c3                   	ret    
8010428c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104290 <acquire>:
80104290:	55                   	push   %ebp
80104291:	89 e5                	mov    %esp,%ebp
80104293:	56                   	push   %esi
80104294:	53                   	push   %ebx
80104295:	e8 b6 ff ff ff       	call   80104250 <pushcli>
8010429a:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010429d:	8b 03                	mov    (%ebx),%eax
8010429f:	85 c0                	test   %eax,%eax
801042a1:	75 7d                	jne    80104320 <acquire+0x90>
801042a3:	ba 01 00 00 00       	mov    $0x1,%edx
801042a8:	eb 09                	jmp    801042b3 <acquire+0x23>
801042aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801042b0:	8b 5d 08             	mov    0x8(%ebp),%ebx
801042b3:	89 d0                	mov    %edx,%eax
801042b5:	f0 87 03             	lock xchg %eax,(%ebx)
801042b8:	85 c0                	test   %eax,%eax
801042ba:	75 f4                	jne    801042b0 <acquire+0x20>
801042bc:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
801042c1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801042c4:	e8 07 f4 ff ff       	call   801036d0 <mycpu>
801042c9:	89 ea                	mov    %ebp,%edx
801042cb:	8d 4b 0c             	lea    0xc(%ebx),%ecx
801042ce:	89 43 08             	mov    %eax,0x8(%ebx)
801042d1:	31 c0                	xor    %eax,%eax
801042d3:	90                   	nop
801042d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801042d8:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
801042de:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801042e4:	77 1a                	ja     80104300 <acquire+0x70>
801042e6:	8b 5a 04             	mov    0x4(%edx),%ebx
801042e9:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
801042ec:	83 c0 01             	add    $0x1,%eax
801042ef:	8b 12                	mov    (%edx),%edx
801042f1:	83 f8 0a             	cmp    $0xa,%eax
801042f4:	75 e2                	jne    801042d8 <acquire+0x48>
801042f6:	8d 65 f8             	lea    -0x8(%ebp),%esp
801042f9:	5b                   	pop    %ebx
801042fa:	5e                   	pop    %esi
801042fb:	5d                   	pop    %ebp
801042fc:	c3                   	ret    
801042fd:	8d 76 00             	lea    0x0(%esi),%esi
80104300:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
80104307:	83 c0 01             	add    $0x1,%eax
8010430a:	83 f8 0a             	cmp    $0xa,%eax
8010430d:	74 e7                	je     801042f6 <acquire+0x66>
8010430f:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
80104316:	83 c0 01             	add    $0x1,%eax
80104319:	83 f8 0a             	cmp    $0xa,%eax
8010431c:	75 e2                	jne    80104300 <acquire+0x70>
8010431e:	eb d6                	jmp    801042f6 <acquire+0x66>
80104320:	8b 73 08             	mov    0x8(%ebx),%esi
80104323:	e8 a8 f3 ff ff       	call   801036d0 <mycpu>
80104328:	39 c6                	cmp    %eax,%esi
8010432a:	0f 85 73 ff ff ff    	jne    801042a3 <acquire+0x13>
80104330:	83 ec 0c             	sub    $0xc,%esp
80104333:	68 a3 76 10 80       	push   $0x801076a3
80104338:	e8 33 c0 ff ff       	call   80100370 <panic>
8010433d:	8d 76 00             	lea    0x0(%esi),%esi

80104340 <popcli>:
80104340:	55                   	push   %ebp
80104341:	89 e5                	mov    %esp,%ebp
80104343:	83 ec 08             	sub    $0x8,%esp
80104346:	9c                   	pushf  
80104347:	58                   	pop    %eax
80104348:	f6 c4 02             	test   $0x2,%ah
8010434b:	75 52                	jne    8010439f <popcli+0x5f>
8010434d:	e8 7e f3 ff ff       	call   801036d0 <mycpu>
80104352:	8b 88 a4 00 00 00    	mov    0xa4(%eax),%ecx
80104358:	8d 51 ff             	lea    -0x1(%ecx),%edx
8010435b:	85 d2                	test   %edx,%edx
8010435d:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
80104363:	78 2d                	js     80104392 <popcli+0x52>
80104365:	e8 66 f3 ff ff       	call   801036d0 <mycpu>
8010436a:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80104370:	85 d2                	test   %edx,%edx
80104372:	74 0c                	je     80104380 <popcli+0x40>
80104374:	c9                   	leave  
80104375:	c3                   	ret    
80104376:	8d 76 00             	lea    0x0(%esi),%esi
80104379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104380:	e8 4b f3 ff ff       	call   801036d0 <mycpu>
80104385:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
8010438b:	85 c0                	test   %eax,%eax
8010438d:	74 e5                	je     80104374 <popcli+0x34>
8010438f:	fb                   	sti    
80104390:	c9                   	leave  
80104391:	c3                   	ret    
80104392:	83 ec 0c             	sub    $0xc,%esp
80104395:	68 c2 76 10 80       	push   $0x801076c2
8010439a:	e8 d1 bf ff ff       	call   80100370 <panic>
8010439f:	83 ec 0c             	sub    $0xc,%esp
801043a2:	68 ab 76 10 80       	push   $0x801076ab
801043a7:	e8 c4 bf ff ff       	call   80100370 <panic>
801043ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801043b0 <release>:
801043b0:	55                   	push   %ebp
801043b1:	89 e5                	mov    %esp,%ebp
801043b3:	56                   	push   %esi
801043b4:	53                   	push   %ebx
801043b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801043b8:	8b 03                	mov    (%ebx),%eax
801043ba:	85 c0                	test   %eax,%eax
801043bc:	75 12                	jne    801043d0 <release+0x20>
801043be:	83 ec 0c             	sub    $0xc,%esp
801043c1:	68 c9 76 10 80       	push   $0x801076c9
801043c6:	e8 a5 bf ff ff       	call   80100370 <panic>
801043cb:	90                   	nop
801043cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801043d0:	8b 73 08             	mov    0x8(%ebx),%esi
801043d3:	e8 f8 f2 ff ff       	call   801036d0 <mycpu>
801043d8:	39 c6                	cmp    %eax,%esi
801043da:	75 e2                	jne    801043be <release+0xe>
801043dc:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
801043e3:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
801043ea:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
801043ef:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801043f5:	8d 65 f8             	lea    -0x8(%ebp),%esp
801043f8:	5b                   	pop    %ebx
801043f9:	5e                   	pop    %esi
801043fa:	5d                   	pop    %ebp
801043fb:	e9 40 ff ff ff       	jmp    80104340 <popcli>

80104400 <memset>:
80104400:	55                   	push   %ebp
80104401:	89 e5                	mov    %esp,%ebp
80104403:	57                   	push   %edi
80104404:	53                   	push   %ebx
80104405:	8b 55 08             	mov    0x8(%ebp),%edx
80104408:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010440b:	f6 c2 03             	test   $0x3,%dl
8010440e:	75 05                	jne    80104415 <memset+0x15>
80104410:	f6 c1 03             	test   $0x3,%cl
80104413:	74 13                	je     80104428 <memset+0x28>
80104415:	89 d7                	mov    %edx,%edi
80104417:	8b 45 0c             	mov    0xc(%ebp),%eax
8010441a:	fc                   	cld    
8010441b:	f3 aa                	rep stos %al,%es:(%edi)
8010441d:	5b                   	pop    %ebx
8010441e:	89 d0                	mov    %edx,%eax
80104420:	5f                   	pop    %edi
80104421:	5d                   	pop    %ebp
80104422:	c3                   	ret    
80104423:	90                   	nop
80104424:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104428:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
8010442c:	c1 e9 02             	shr    $0x2,%ecx
8010442f:	89 fb                	mov    %edi,%ebx
80104431:	89 f8                	mov    %edi,%eax
80104433:	c1 e3 18             	shl    $0x18,%ebx
80104436:	c1 e0 10             	shl    $0x10,%eax
80104439:	09 d8                	or     %ebx,%eax
8010443b:	09 f8                	or     %edi,%eax
8010443d:	c1 e7 08             	shl    $0x8,%edi
80104440:	09 f8                	or     %edi,%eax
80104442:	89 d7                	mov    %edx,%edi
80104444:	fc                   	cld    
80104445:	f3 ab                	rep stos %eax,%es:(%edi)
80104447:	5b                   	pop    %ebx
80104448:	89 d0                	mov    %edx,%eax
8010444a:	5f                   	pop    %edi
8010444b:	5d                   	pop    %ebp
8010444c:	c3                   	ret    
8010444d:	8d 76 00             	lea    0x0(%esi),%esi

80104450 <memcmp>:
80104450:	55                   	push   %ebp
80104451:	89 e5                	mov    %esp,%ebp
80104453:	57                   	push   %edi
80104454:	56                   	push   %esi
80104455:	8b 45 10             	mov    0x10(%ebp),%eax
80104458:	53                   	push   %ebx
80104459:	8b 75 0c             	mov    0xc(%ebp),%esi
8010445c:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010445f:	85 c0                	test   %eax,%eax
80104461:	74 29                	je     8010448c <memcmp+0x3c>
80104463:	0f b6 13             	movzbl (%ebx),%edx
80104466:	0f b6 0e             	movzbl (%esi),%ecx
80104469:	38 d1                	cmp    %dl,%cl
8010446b:	75 2b                	jne    80104498 <memcmp+0x48>
8010446d:	8d 78 ff             	lea    -0x1(%eax),%edi
80104470:	31 c0                	xor    %eax,%eax
80104472:	eb 14                	jmp    80104488 <memcmp+0x38>
80104474:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104478:	0f b6 54 03 01       	movzbl 0x1(%ebx,%eax,1),%edx
8010447d:	83 c0 01             	add    $0x1,%eax
80104480:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
80104484:	38 ca                	cmp    %cl,%dl
80104486:	75 10                	jne    80104498 <memcmp+0x48>
80104488:	39 f8                	cmp    %edi,%eax
8010448a:	75 ec                	jne    80104478 <memcmp+0x28>
8010448c:	5b                   	pop    %ebx
8010448d:	31 c0                	xor    %eax,%eax
8010448f:	5e                   	pop    %esi
80104490:	5f                   	pop    %edi
80104491:	5d                   	pop    %ebp
80104492:	c3                   	ret    
80104493:	90                   	nop
80104494:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104498:	0f b6 c2             	movzbl %dl,%eax
8010449b:	5b                   	pop    %ebx
8010449c:	29 c8                	sub    %ecx,%eax
8010449e:	5e                   	pop    %esi
8010449f:	5f                   	pop    %edi
801044a0:	5d                   	pop    %ebp
801044a1:	c3                   	ret    
801044a2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801044a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801044b0 <memmove>:
801044b0:	55                   	push   %ebp
801044b1:	89 e5                	mov    %esp,%ebp
801044b3:	56                   	push   %esi
801044b4:	53                   	push   %ebx
801044b5:	8b 45 08             	mov    0x8(%ebp),%eax
801044b8:	8b 75 0c             	mov    0xc(%ebp),%esi
801044bb:	8b 5d 10             	mov    0x10(%ebp),%ebx
801044be:	39 c6                	cmp    %eax,%esi
801044c0:	73 2e                	jae    801044f0 <memmove+0x40>
801044c2:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
801044c5:	39 c8                	cmp    %ecx,%eax
801044c7:	73 27                	jae    801044f0 <memmove+0x40>
801044c9:	85 db                	test   %ebx,%ebx
801044cb:	8d 53 ff             	lea    -0x1(%ebx),%edx
801044ce:	74 17                	je     801044e7 <memmove+0x37>
801044d0:	29 d9                	sub    %ebx,%ecx
801044d2:	89 cb                	mov    %ecx,%ebx
801044d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801044d8:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
801044dc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
801044df:	83 ea 01             	sub    $0x1,%edx
801044e2:	83 fa ff             	cmp    $0xffffffff,%edx
801044e5:	75 f1                	jne    801044d8 <memmove+0x28>
801044e7:	5b                   	pop    %ebx
801044e8:	5e                   	pop    %esi
801044e9:	5d                   	pop    %ebp
801044ea:	c3                   	ret    
801044eb:	90                   	nop
801044ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801044f0:	31 d2                	xor    %edx,%edx
801044f2:	85 db                	test   %ebx,%ebx
801044f4:	74 f1                	je     801044e7 <memmove+0x37>
801044f6:	8d 76 00             	lea    0x0(%esi),%esi
801044f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104500:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
80104504:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104507:	83 c2 01             	add    $0x1,%edx
8010450a:	39 d3                	cmp    %edx,%ebx
8010450c:	75 f2                	jne    80104500 <memmove+0x50>
8010450e:	5b                   	pop    %ebx
8010450f:	5e                   	pop    %esi
80104510:	5d                   	pop    %ebp
80104511:	c3                   	ret    
80104512:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104520 <memcpy>:
80104520:	55                   	push   %ebp
80104521:	89 e5                	mov    %esp,%ebp
80104523:	5d                   	pop    %ebp
80104524:	eb 8a                	jmp    801044b0 <memmove>
80104526:	8d 76 00             	lea    0x0(%esi),%esi
80104529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104530 <strncmp>:
80104530:	55                   	push   %ebp
80104531:	89 e5                	mov    %esp,%ebp
80104533:	57                   	push   %edi
80104534:	56                   	push   %esi
80104535:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104538:	53                   	push   %ebx
80104539:	8b 7d 08             	mov    0x8(%ebp),%edi
8010453c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010453f:	85 c9                	test   %ecx,%ecx
80104541:	74 37                	je     8010457a <strncmp+0x4a>
80104543:	0f b6 17             	movzbl (%edi),%edx
80104546:	0f b6 1e             	movzbl (%esi),%ebx
80104549:	84 d2                	test   %dl,%dl
8010454b:	74 3f                	je     8010458c <strncmp+0x5c>
8010454d:	38 d3                	cmp    %dl,%bl
8010454f:	75 3b                	jne    8010458c <strncmp+0x5c>
80104551:	8d 47 01             	lea    0x1(%edi),%eax
80104554:	01 cf                	add    %ecx,%edi
80104556:	eb 1b                	jmp    80104573 <strncmp+0x43>
80104558:	90                   	nop
80104559:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104560:	0f b6 10             	movzbl (%eax),%edx
80104563:	84 d2                	test   %dl,%dl
80104565:	74 21                	je     80104588 <strncmp+0x58>
80104567:	0f b6 19             	movzbl (%ecx),%ebx
8010456a:	83 c0 01             	add    $0x1,%eax
8010456d:	89 ce                	mov    %ecx,%esi
8010456f:	38 da                	cmp    %bl,%dl
80104571:	75 19                	jne    8010458c <strncmp+0x5c>
80104573:	39 c7                	cmp    %eax,%edi
80104575:	8d 4e 01             	lea    0x1(%esi),%ecx
80104578:	75 e6                	jne    80104560 <strncmp+0x30>
8010457a:	5b                   	pop    %ebx
8010457b:	31 c0                	xor    %eax,%eax
8010457d:	5e                   	pop    %esi
8010457e:	5f                   	pop    %edi
8010457f:	5d                   	pop    %ebp
80104580:	c3                   	ret    
80104581:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104588:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
8010458c:	0f b6 c2             	movzbl %dl,%eax
8010458f:	29 d8                	sub    %ebx,%eax
80104591:	5b                   	pop    %ebx
80104592:	5e                   	pop    %esi
80104593:	5f                   	pop    %edi
80104594:	5d                   	pop    %ebp
80104595:	c3                   	ret    
80104596:	8d 76 00             	lea    0x0(%esi),%esi
80104599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801045a0 <strncpy>:
801045a0:	55                   	push   %ebp
801045a1:	89 e5                	mov    %esp,%ebp
801045a3:	56                   	push   %esi
801045a4:	53                   	push   %ebx
801045a5:	8b 45 08             	mov    0x8(%ebp),%eax
801045a8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801045ab:	8b 4d 10             	mov    0x10(%ebp),%ecx
801045ae:	89 c2                	mov    %eax,%edx
801045b0:	eb 19                	jmp    801045cb <strncpy+0x2b>
801045b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801045b8:	83 c3 01             	add    $0x1,%ebx
801045bb:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
801045bf:	83 c2 01             	add    $0x1,%edx
801045c2:	84 c9                	test   %cl,%cl
801045c4:	88 4a ff             	mov    %cl,-0x1(%edx)
801045c7:	74 09                	je     801045d2 <strncpy+0x32>
801045c9:	89 f1                	mov    %esi,%ecx
801045cb:	85 c9                	test   %ecx,%ecx
801045cd:	8d 71 ff             	lea    -0x1(%ecx),%esi
801045d0:	7f e6                	jg     801045b8 <strncpy+0x18>
801045d2:	31 c9                	xor    %ecx,%ecx
801045d4:	85 f6                	test   %esi,%esi
801045d6:	7e 17                	jle    801045ef <strncpy+0x4f>
801045d8:	90                   	nop
801045d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801045e0:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
801045e4:	89 f3                	mov    %esi,%ebx
801045e6:	83 c1 01             	add    $0x1,%ecx
801045e9:	29 cb                	sub    %ecx,%ebx
801045eb:	85 db                	test   %ebx,%ebx
801045ed:	7f f1                	jg     801045e0 <strncpy+0x40>
801045ef:	5b                   	pop    %ebx
801045f0:	5e                   	pop    %esi
801045f1:	5d                   	pop    %ebp
801045f2:	c3                   	ret    
801045f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801045f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104600 <safestrcpy>:
80104600:	55                   	push   %ebp
80104601:	89 e5                	mov    %esp,%ebp
80104603:	56                   	push   %esi
80104604:	53                   	push   %ebx
80104605:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104608:	8b 45 08             	mov    0x8(%ebp),%eax
8010460b:	8b 55 0c             	mov    0xc(%ebp),%edx
8010460e:	85 c9                	test   %ecx,%ecx
80104610:	7e 26                	jle    80104638 <safestrcpy+0x38>
80104612:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104616:	89 c1                	mov    %eax,%ecx
80104618:	eb 17                	jmp    80104631 <safestrcpy+0x31>
8010461a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104620:	83 c2 01             	add    $0x1,%edx
80104623:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
80104627:	83 c1 01             	add    $0x1,%ecx
8010462a:	84 db                	test   %bl,%bl
8010462c:	88 59 ff             	mov    %bl,-0x1(%ecx)
8010462f:	74 04                	je     80104635 <safestrcpy+0x35>
80104631:	39 f2                	cmp    %esi,%edx
80104633:	75 eb                	jne    80104620 <safestrcpy+0x20>
80104635:	c6 01 00             	movb   $0x0,(%ecx)
80104638:	5b                   	pop    %ebx
80104639:	5e                   	pop    %esi
8010463a:	5d                   	pop    %ebp
8010463b:	c3                   	ret    
8010463c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104640 <strlen>:
80104640:	55                   	push   %ebp
80104641:	31 c0                	xor    %eax,%eax
80104643:	89 e5                	mov    %esp,%ebp
80104645:	8b 55 08             	mov    0x8(%ebp),%edx
80104648:	80 3a 00             	cmpb   $0x0,(%edx)
8010464b:	74 0c                	je     80104659 <strlen+0x19>
8010464d:	8d 76 00             	lea    0x0(%esi),%esi
80104650:	83 c0 01             	add    $0x1,%eax
80104653:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80104657:	75 f7                	jne    80104650 <strlen+0x10>
80104659:	5d                   	pop    %ebp
8010465a:	c3                   	ret    

8010465b <swtch>:
8010465b:	8b 44 24 04          	mov    0x4(%esp),%eax
8010465f:	8b 54 24 08          	mov    0x8(%esp),%edx
80104663:	55                   	push   %ebp
80104664:	53                   	push   %ebx
80104665:	56                   	push   %esi
80104666:	57                   	push   %edi
80104667:	89 20                	mov    %esp,(%eax)
80104669:	89 d4                	mov    %edx,%esp
8010466b:	5f                   	pop    %edi
8010466c:	5e                   	pop    %esi
8010466d:	5b                   	pop    %ebx
8010466e:	5d                   	pop    %ebp
8010466f:	c3                   	ret    

80104670 <fetchint>:
80104670:	55                   	push   %ebp
80104671:	89 e5                	mov    %esp,%ebp
80104673:	53                   	push   %ebx
80104674:	83 ec 04             	sub    $0x4,%esp
80104677:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010467a:	e8 f1 f0 ff ff       	call   80103770 <myproc>
8010467f:	8b 00                	mov    (%eax),%eax
80104681:	39 d8                	cmp    %ebx,%eax
80104683:	76 1b                	jbe    801046a0 <fetchint+0x30>
80104685:	8d 53 04             	lea    0x4(%ebx),%edx
80104688:	39 d0                	cmp    %edx,%eax
8010468a:	72 14                	jb     801046a0 <fetchint+0x30>
8010468c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010468f:	8b 13                	mov    (%ebx),%edx
80104691:	89 10                	mov    %edx,(%eax)
80104693:	31 c0                	xor    %eax,%eax
80104695:	83 c4 04             	add    $0x4,%esp
80104698:	5b                   	pop    %ebx
80104699:	5d                   	pop    %ebp
8010469a:	c3                   	ret    
8010469b:	90                   	nop
8010469c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801046a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801046a5:	eb ee                	jmp    80104695 <fetchint+0x25>
801046a7:	89 f6                	mov    %esi,%esi
801046a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801046b0 <fetchstr>:
801046b0:	55                   	push   %ebp
801046b1:	89 e5                	mov    %esp,%ebp
801046b3:	53                   	push   %ebx
801046b4:	83 ec 04             	sub    $0x4,%esp
801046b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801046ba:	e8 b1 f0 ff ff       	call   80103770 <myproc>
801046bf:	39 18                	cmp    %ebx,(%eax)
801046c1:	76 29                	jbe    801046ec <fetchstr+0x3c>
801046c3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801046c6:	89 da                	mov    %ebx,%edx
801046c8:	89 19                	mov    %ebx,(%ecx)
801046ca:	8b 00                	mov    (%eax),%eax
801046cc:	39 c3                	cmp    %eax,%ebx
801046ce:	73 1c                	jae    801046ec <fetchstr+0x3c>
801046d0:	80 3b 00             	cmpb   $0x0,(%ebx)
801046d3:	75 10                	jne    801046e5 <fetchstr+0x35>
801046d5:	eb 29                	jmp    80104700 <fetchstr+0x50>
801046d7:	89 f6                	mov    %esi,%esi
801046d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801046e0:	80 3a 00             	cmpb   $0x0,(%edx)
801046e3:	74 1b                	je     80104700 <fetchstr+0x50>
801046e5:	83 c2 01             	add    $0x1,%edx
801046e8:	39 d0                	cmp    %edx,%eax
801046ea:	77 f4                	ja     801046e0 <fetchstr+0x30>
801046ec:	83 c4 04             	add    $0x4,%esp
801046ef:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801046f4:	5b                   	pop    %ebx
801046f5:	5d                   	pop    %ebp
801046f6:	c3                   	ret    
801046f7:	89 f6                	mov    %esi,%esi
801046f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104700:	83 c4 04             	add    $0x4,%esp
80104703:	89 d0                	mov    %edx,%eax
80104705:	29 d8                	sub    %ebx,%eax
80104707:	5b                   	pop    %ebx
80104708:	5d                   	pop    %ebp
80104709:	c3                   	ret    
8010470a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104710 <argint>:
80104710:	55                   	push   %ebp
80104711:	89 e5                	mov    %esp,%ebp
80104713:	56                   	push   %esi
80104714:	53                   	push   %ebx
80104715:	e8 56 f0 ff ff       	call   80103770 <myproc>
8010471a:	8b 40 18             	mov    0x18(%eax),%eax
8010471d:	8b 55 08             	mov    0x8(%ebp),%edx
80104720:	8b 40 44             	mov    0x44(%eax),%eax
80104723:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
80104726:	e8 45 f0 ff ff       	call   80103770 <myproc>
8010472b:	8b 00                	mov    (%eax),%eax
8010472d:	8d 73 04             	lea    0x4(%ebx),%esi
80104730:	39 c6                	cmp    %eax,%esi
80104732:	73 1c                	jae    80104750 <argint+0x40>
80104734:	8d 53 08             	lea    0x8(%ebx),%edx
80104737:	39 d0                	cmp    %edx,%eax
80104739:	72 15                	jb     80104750 <argint+0x40>
8010473b:	8b 45 0c             	mov    0xc(%ebp),%eax
8010473e:	8b 53 04             	mov    0x4(%ebx),%edx
80104741:	89 10                	mov    %edx,(%eax)
80104743:	31 c0                	xor    %eax,%eax
80104745:	5b                   	pop    %ebx
80104746:	5e                   	pop    %esi
80104747:	5d                   	pop    %ebp
80104748:	c3                   	ret    
80104749:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104750:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104755:	eb ee                	jmp    80104745 <argint+0x35>
80104757:	89 f6                	mov    %esi,%esi
80104759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104760 <argptr>:
80104760:	55                   	push   %ebp
80104761:	89 e5                	mov    %esp,%ebp
80104763:	56                   	push   %esi
80104764:	53                   	push   %ebx
80104765:	83 ec 10             	sub    $0x10,%esp
80104768:	8b 5d 10             	mov    0x10(%ebp),%ebx
8010476b:	e8 00 f0 ff ff       	call   80103770 <myproc>
80104770:	89 c6                	mov    %eax,%esi
80104772:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104775:	83 ec 08             	sub    $0x8,%esp
80104778:	50                   	push   %eax
80104779:	ff 75 08             	pushl  0x8(%ebp)
8010477c:	e8 8f ff ff ff       	call   80104710 <argint>
80104781:	c1 e8 1f             	shr    $0x1f,%eax
80104784:	83 c4 10             	add    $0x10,%esp
80104787:	84 c0                	test   %al,%al
80104789:	75 2d                	jne    801047b8 <argptr+0x58>
8010478b:	89 d8                	mov    %ebx,%eax
8010478d:	c1 e8 1f             	shr    $0x1f,%eax
80104790:	84 c0                	test   %al,%al
80104792:	75 24                	jne    801047b8 <argptr+0x58>
80104794:	8b 16                	mov    (%esi),%edx
80104796:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104799:	39 c2                	cmp    %eax,%edx
8010479b:	76 1b                	jbe    801047b8 <argptr+0x58>
8010479d:	01 c3                	add    %eax,%ebx
8010479f:	39 da                	cmp    %ebx,%edx
801047a1:	72 15                	jb     801047b8 <argptr+0x58>
801047a3:	8b 55 0c             	mov    0xc(%ebp),%edx
801047a6:	89 02                	mov    %eax,(%edx)
801047a8:	31 c0                	xor    %eax,%eax
801047aa:	8d 65 f8             	lea    -0x8(%ebp),%esp
801047ad:	5b                   	pop    %ebx
801047ae:	5e                   	pop    %esi
801047af:	5d                   	pop    %ebp
801047b0:	c3                   	ret    
801047b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801047b8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801047bd:	eb eb                	jmp    801047aa <argptr+0x4a>
801047bf:	90                   	nop

801047c0 <argstr>:
801047c0:	55                   	push   %ebp
801047c1:	89 e5                	mov    %esp,%ebp
801047c3:	83 ec 20             	sub    $0x20,%esp
801047c6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801047c9:	50                   	push   %eax
801047ca:	ff 75 08             	pushl  0x8(%ebp)
801047cd:	e8 3e ff ff ff       	call   80104710 <argint>
801047d2:	83 c4 10             	add    $0x10,%esp
801047d5:	85 c0                	test   %eax,%eax
801047d7:	78 17                	js     801047f0 <argstr+0x30>
801047d9:	83 ec 08             	sub    $0x8,%esp
801047dc:	ff 75 0c             	pushl  0xc(%ebp)
801047df:	ff 75 f4             	pushl  -0xc(%ebp)
801047e2:	e8 c9 fe ff ff       	call   801046b0 <fetchstr>
801047e7:	83 c4 10             	add    $0x10,%esp
801047ea:	c9                   	leave  
801047eb:	c3                   	ret    
801047ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801047f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801047f5:	c9                   	leave  
801047f6:	c3                   	ret    
801047f7:	89 f6                	mov    %esi,%esi
801047f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104800 <syscall>:
80104800:	55                   	push   %ebp
80104801:	89 e5                	mov    %esp,%ebp
80104803:	56                   	push   %esi
80104804:	53                   	push   %ebx
80104805:	e8 66 ef ff ff       	call   80103770 <myproc>
8010480a:	8b 70 18             	mov    0x18(%eax),%esi
8010480d:	89 c3                	mov    %eax,%ebx
8010480f:	8b 46 1c             	mov    0x1c(%esi),%eax
80104812:	8d 50 ff             	lea    -0x1(%eax),%edx
80104815:	83 fa 16             	cmp    $0x16,%edx
80104818:	77 1e                	ja     80104838 <syscall+0x38>
8010481a:	8b 14 85 00 77 10 80 	mov    -0x7fef8900(,%eax,4),%edx
80104821:	85 d2                	test   %edx,%edx
80104823:	74 13                	je     80104838 <syscall+0x38>
80104825:	ff d2                	call   *%edx
80104827:	89 46 1c             	mov    %eax,0x1c(%esi)
8010482a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010482d:	5b                   	pop    %ebx
8010482e:	5e                   	pop    %esi
8010482f:	5d                   	pop    %ebp
80104830:	c3                   	ret    
80104831:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104838:	50                   	push   %eax
80104839:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010483c:	50                   	push   %eax
8010483d:	ff 73 10             	pushl  0x10(%ebx)
80104840:	68 d1 76 10 80       	push   $0x801076d1
80104845:	e8 16 be ff ff       	call   80100660 <cprintf>
8010484a:	8b 43 18             	mov    0x18(%ebx),%eax
8010484d:	83 c4 10             	add    $0x10,%esp
80104850:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
80104857:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010485a:	5b                   	pop    %ebx
8010485b:	5e                   	pop    %esi
8010485c:	5d                   	pop    %ebp
8010485d:	c3                   	ret    
8010485e:	66 90                	xchg   %ax,%ax

80104860 <create>:
80104860:	55                   	push   %ebp
80104861:	89 e5                	mov    %esp,%ebp
80104863:	57                   	push   %edi
80104864:	56                   	push   %esi
80104865:	53                   	push   %ebx
80104866:	8d 75 da             	lea    -0x26(%ebp),%esi
80104869:	83 ec 44             	sub    $0x44,%esp
8010486c:	89 4d c0             	mov    %ecx,-0x40(%ebp)
8010486f:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104872:	56                   	push   %esi
80104873:	50                   	push   %eax
80104874:	89 55 c4             	mov    %edx,-0x3c(%ebp)
80104877:	89 4d bc             	mov    %ecx,-0x44(%ebp)
8010487a:	e8 51 d6 ff ff       	call   80101ed0 <nameiparent>
8010487f:	83 c4 10             	add    $0x10,%esp
80104882:	85 c0                	test   %eax,%eax
80104884:	0f 84 f6 00 00 00    	je     80104980 <create+0x120>
8010488a:	83 ec 0c             	sub    $0xc,%esp
8010488d:	89 c7                	mov    %eax,%edi
8010488f:	50                   	push   %eax
80104890:	e8 cb cd ff ff       	call   80101660 <ilock>
80104895:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104898:	83 c4 0c             	add    $0xc,%esp
8010489b:	50                   	push   %eax
8010489c:	56                   	push   %esi
8010489d:	57                   	push   %edi
8010489e:	e8 ed d2 ff ff       	call   80101b90 <dirlookup>
801048a3:	83 c4 10             	add    $0x10,%esp
801048a6:	85 c0                	test   %eax,%eax
801048a8:	89 c3                	mov    %eax,%ebx
801048aa:	74 54                	je     80104900 <create+0xa0>
801048ac:	83 ec 0c             	sub    $0xc,%esp
801048af:	57                   	push   %edi
801048b0:	e8 3b d0 ff ff       	call   801018f0 <iunlockput>
801048b5:	89 1c 24             	mov    %ebx,(%esp)
801048b8:	e8 a3 cd ff ff       	call   80101660 <ilock>
801048bd:	83 c4 10             	add    $0x10,%esp
801048c0:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
801048c5:	75 19                	jne    801048e0 <create+0x80>
801048c7:	66 83 7b 50 02       	cmpw   $0x2,0x50(%ebx)
801048cc:	89 d8                	mov    %ebx,%eax
801048ce:	75 10                	jne    801048e0 <create+0x80>
801048d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801048d3:	5b                   	pop    %ebx
801048d4:	5e                   	pop    %esi
801048d5:	5f                   	pop    %edi
801048d6:	5d                   	pop    %ebp
801048d7:	c3                   	ret    
801048d8:	90                   	nop
801048d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801048e0:	83 ec 0c             	sub    $0xc,%esp
801048e3:	53                   	push   %ebx
801048e4:	e8 07 d0 ff ff       	call   801018f0 <iunlockput>
801048e9:	83 c4 10             	add    $0x10,%esp
801048ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
801048ef:	31 c0                	xor    %eax,%eax
801048f1:	5b                   	pop    %ebx
801048f2:	5e                   	pop    %esi
801048f3:	5f                   	pop    %edi
801048f4:	5d                   	pop    %ebp
801048f5:	c3                   	ret    
801048f6:	8d 76 00             	lea    0x0(%esi),%esi
801048f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104900:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
80104904:	83 ec 08             	sub    $0x8,%esp
80104907:	50                   	push   %eax
80104908:	ff 37                	pushl  (%edi)
8010490a:	e8 e1 cb ff ff       	call   801014f0 <ialloc>
8010490f:	83 c4 10             	add    $0x10,%esp
80104912:	85 c0                	test   %eax,%eax
80104914:	89 c3                	mov    %eax,%ebx
80104916:	0f 84 cc 00 00 00    	je     801049e8 <create+0x188>
8010491c:	83 ec 0c             	sub    $0xc,%esp
8010491f:	50                   	push   %eax
80104920:	e8 3b cd ff ff       	call   80101660 <ilock>
80104925:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80104929:	66 89 43 52          	mov    %ax,0x52(%ebx)
8010492d:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
80104931:	66 89 43 54          	mov    %ax,0x54(%ebx)
80104935:	b8 01 00 00 00       	mov    $0x1,%eax
8010493a:	66 89 43 56          	mov    %ax,0x56(%ebx)
8010493e:	89 1c 24             	mov    %ebx,(%esp)
80104941:	e8 6a cc ff ff       	call   801015b0 <iupdate>
80104946:	83 c4 10             	add    $0x10,%esp
80104949:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
8010494e:	74 40                	je     80104990 <create+0x130>
80104950:	83 ec 04             	sub    $0x4,%esp
80104953:	ff 73 04             	pushl  0x4(%ebx)
80104956:	56                   	push   %esi
80104957:	57                   	push   %edi
80104958:	e8 93 d4 ff ff       	call   80101df0 <dirlink>
8010495d:	83 c4 10             	add    $0x10,%esp
80104960:	85 c0                	test   %eax,%eax
80104962:	78 77                	js     801049db <create+0x17b>
80104964:	83 ec 0c             	sub    $0xc,%esp
80104967:	57                   	push   %edi
80104968:	e8 83 cf ff ff       	call   801018f0 <iunlockput>
8010496d:	83 c4 10             	add    $0x10,%esp
80104970:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104973:	89 d8                	mov    %ebx,%eax
80104975:	5b                   	pop    %ebx
80104976:	5e                   	pop    %esi
80104977:	5f                   	pop    %edi
80104978:	5d                   	pop    %ebp
80104979:	c3                   	ret    
8010497a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104980:	31 c0                	xor    %eax,%eax
80104982:	e9 49 ff ff ff       	jmp    801048d0 <create+0x70>
80104987:	89 f6                	mov    %esi,%esi
80104989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104990:	66 83 47 56 01       	addw   $0x1,0x56(%edi)
80104995:	83 ec 0c             	sub    $0xc,%esp
80104998:	57                   	push   %edi
80104999:	e8 12 cc ff ff       	call   801015b0 <iupdate>
8010499e:	83 c4 0c             	add    $0xc,%esp
801049a1:	ff 73 04             	pushl  0x4(%ebx)
801049a4:	68 7c 77 10 80       	push   $0x8010777c
801049a9:	53                   	push   %ebx
801049aa:	e8 41 d4 ff ff       	call   80101df0 <dirlink>
801049af:	83 c4 10             	add    $0x10,%esp
801049b2:	85 c0                	test   %eax,%eax
801049b4:	78 18                	js     801049ce <create+0x16e>
801049b6:	83 ec 04             	sub    $0x4,%esp
801049b9:	ff 77 04             	pushl  0x4(%edi)
801049bc:	68 7b 77 10 80       	push   $0x8010777b
801049c1:	53                   	push   %ebx
801049c2:	e8 29 d4 ff ff       	call   80101df0 <dirlink>
801049c7:	83 c4 10             	add    $0x10,%esp
801049ca:	85 c0                	test   %eax,%eax
801049cc:	79 82                	jns    80104950 <create+0xf0>
801049ce:	83 ec 0c             	sub    $0xc,%esp
801049d1:	68 6f 77 10 80       	push   $0x8010776f
801049d6:	e8 95 b9 ff ff       	call   80100370 <panic>
801049db:	83 ec 0c             	sub    $0xc,%esp
801049de:	68 7e 77 10 80       	push   $0x8010777e
801049e3:	e8 88 b9 ff ff       	call   80100370 <panic>
801049e8:	83 ec 0c             	sub    $0xc,%esp
801049eb:	68 60 77 10 80       	push   $0x80107760
801049f0:	e8 7b b9 ff ff       	call   80100370 <panic>
801049f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801049f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104a00 <argfd.constprop.0>:
80104a00:	55                   	push   %ebp
80104a01:	89 e5                	mov    %esp,%ebp
80104a03:	56                   	push   %esi
80104a04:	53                   	push   %ebx
80104a05:	89 c6                	mov    %eax,%esi
80104a07:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104a0a:	89 d3                	mov    %edx,%ebx
80104a0c:	83 ec 18             	sub    $0x18,%esp
80104a0f:	50                   	push   %eax
80104a10:	6a 00                	push   $0x0
80104a12:	e8 f9 fc ff ff       	call   80104710 <argint>
80104a17:	83 c4 10             	add    $0x10,%esp
80104a1a:	85 c0                	test   %eax,%eax
80104a1c:	78 32                	js     80104a50 <argfd.constprop.0+0x50>
80104a1e:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104a22:	77 2c                	ja     80104a50 <argfd.constprop.0+0x50>
80104a24:	e8 47 ed ff ff       	call   80103770 <myproc>
80104a29:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104a2c:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
80104a30:	85 c0                	test   %eax,%eax
80104a32:	74 1c                	je     80104a50 <argfd.constprop.0+0x50>
80104a34:	85 f6                	test   %esi,%esi
80104a36:	74 02                	je     80104a3a <argfd.constprop.0+0x3a>
80104a38:	89 16                	mov    %edx,(%esi)
80104a3a:	85 db                	test   %ebx,%ebx
80104a3c:	74 22                	je     80104a60 <argfd.constprop.0+0x60>
80104a3e:	89 03                	mov    %eax,(%ebx)
80104a40:	31 c0                	xor    %eax,%eax
80104a42:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104a45:	5b                   	pop    %ebx
80104a46:	5e                   	pop    %esi
80104a47:	5d                   	pop    %ebp
80104a48:	c3                   	ret    
80104a49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104a50:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104a53:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104a58:	5b                   	pop    %ebx
80104a59:	5e                   	pop    %esi
80104a5a:	5d                   	pop    %ebp
80104a5b:	c3                   	ret    
80104a5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104a60:	31 c0                	xor    %eax,%eax
80104a62:	eb de                	jmp    80104a42 <argfd.constprop.0+0x42>
80104a64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104a6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104a70 <sys_dup>:
80104a70:	55                   	push   %ebp
80104a71:	31 c0                	xor    %eax,%eax
80104a73:	89 e5                	mov    %esp,%ebp
80104a75:	56                   	push   %esi
80104a76:	53                   	push   %ebx
80104a77:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104a7a:	83 ec 10             	sub    $0x10,%esp
80104a7d:	e8 7e ff ff ff       	call   80104a00 <argfd.constprop.0>
80104a82:	85 c0                	test   %eax,%eax
80104a84:	78 1a                	js     80104aa0 <sys_dup+0x30>
80104a86:	31 db                	xor    %ebx,%ebx
80104a88:	8b 75 f4             	mov    -0xc(%ebp),%esi
80104a8b:	e8 e0 ec ff ff       	call   80103770 <myproc>
80104a90:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80104a94:	85 d2                	test   %edx,%edx
80104a96:	74 18                	je     80104ab0 <sys_dup+0x40>
80104a98:	83 c3 01             	add    $0x1,%ebx
80104a9b:	83 fb 10             	cmp    $0x10,%ebx
80104a9e:	75 f0                	jne    80104a90 <sys_dup+0x20>
80104aa0:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104aa3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104aa8:	5b                   	pop    %ebx
80104aa9:	5e                   	pop    %esi
80104aaa:	5d                   	pop    %ebp
80104aab:	c3                   	ret    
80104aac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104ab0:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)
80104ab4:	83 ec 0c             	sub    $0xc,%esp
80104ab7:	ff 75 f4             	pushl  -0xc(%ebp)
80104aba:	e8 11 c3 ff ff       	call   80100dd0 <filedup>
80104abf:	83 c4 10             	add    $0x10,%esp
80104ac2:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104ac5:	89 d8                	mov    %ebx,%eax
80104ac7:	5b                   	pop    %ebx
80104ac8:	5e                   	pop    %esi
80104ac9:	5d                   	pop    %ebp
80104aca:	c3                   	ret    
80104acb:	90                   	nop
80104acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104ad0 <sys_read>:
80104ad0:	55                   	push   %ebp
80104ad1:	31 c0                	xor    %eax,%eax
80104ad3:	89 e5                	mov    %esp,%ebp
80104ad5:	83 ec 18             	sub    $0x18,%esp
80104ad8:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104adb:	e8 20 ff ff ff       	call   80104a00 <argfd.constprop.0>
80104ae0:	85 c0                	test   %eax,%eax
80104ae2:	78 4c                	js     80104b30 <sys_read+0x60>
80104ae4:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104ae7:	83 ec 08             	sub    $0x8,%esp
80104aea:	50                   	push   %eax
80104aeb:	6a 02                	push   $0x2
80104aed:	e8 1e fc ff ff       	call   80104710 <argint>
80104af2:	83 c4 10             	add    $0x10,%esp
80104af5:	85 c0                	test   %eax,%eax
80104af7:	78 37                	js     80104b30 <sys_read+0x60>
80104af9:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104afc:	83 ec 04             	sub    $0x4,%esp
80104aff:	ff 75 f0             	pushl  -0x10(%ebp)
80104b02:	50                   	push   %eax
80104b03:	6a 01                	push   $0x1
80104b05:	e8 56 fc ff ff       	call   80104760 <argptr>
80104b0a:	83 c4 10             	add    $0x10,%esp
80104b0d:	85 c0                	test   %eax,%eax
80104b0f:	78 1f                	js     80104b30 <sys_read+0x60>
80104b11:	83 ec 04             	sub    $0x4,%esp
80104b14:	ff 75 f0             	pushl  -0x10(%ebp)
80104b17:	ff 75 f4             	pushl  -0xc(%ebp)
80104b1a:	ff 75 ec             	pushl  -0x14(%ebp)
80104b1d:	e8 1e c4 ff ff       	call   80100f40 <fileread>
80104b22:	83 c4 10             	add    $0x10,%esp
80104b25:	c9                   	leave  
80104b26:	c3                   	ret    
80104b27:	89 f6                	mov    %esi,%esi
80104b29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104b30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b35:	c9                   	leave  
80104b36:	c3                   	ret    
80104b37:	89 f6                	mov    %esi,%esi
80104b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104b40 <sys_write>:
80104b40:	55                   	push   %ebp
80104b41:	31 c0                	xor    %eax,%eax
80104b43:	89 e5                	mov    %esp,%ebp
80104b45:	83 ec 18             	sub    $0x18,%esp
80104b48:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104b4b:	e8 b0 fe ff ff       	call   80104a00 <argfd.constprop.0>
80104b50:	85 c0                	test   %eax,%eax
80104b52:	78 4c                	js     80104ba0 <sys_write+0x60>
80104b54:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104b57:	83 ec 08             	sub    $0x8,%esp
80104b5a:	50                   	push   %eax
80104b5b:	6a 02                	push   $0x2
80104b5d:	e8 ae fb ff ff       	call   80104710 <argint>
80104b62:	83 c4 10             	add    $0x10,%esp
80104b65:	85 c0                	test   %eax,%eax
80104b67:	78 37                	js     80104ba0 <sys_write+0x60>
80104b69:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104b6c:	83 ec 04             	sub    $0x4,%esp
80104b6f:	ff 75 f0             	pushl  -0x10(%ebp)
80104b72:	50                   	push   %eax
80104b73:	6a 01                	push   $0x1
80104b75:	e8 e6 fb ff ff       	call   80104760 <argptr>
80104b7a:	83 c4 10             	add    $0x10,%esp
80104b7d:	85 c0                	test   %eax,%eax
80104b7f:	78 1f                	js     80104ba0 <sys_write+0x60>
80104b81:	83 ec 04             	sub    $0x4,%esp
80104b84:	ff 75 f0             	pushl  -0x10(%ebp)
80104b87:	ff 75 f4             	pushl  -0xc(%ebp)
80104b8a:	ff 75 ec             	pushl  -0x14(%ebp)
80104b8d:	e8 3e c4 ff ff       	call   80100fd0 <filewrite>
80104b92:	83 c4 10             	add    $0x10,%esp
80104b95:	c9                   	leave  
80104b96:	c3                   	ret    
80104b97:	89 f6                	mov    %esi,%esi
80104b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104ba0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ba5:	c9                   	leave  
80104ba6:	c3                   	ret    
80104ba7:	89 f6                	mov    %esi,%esi
80104ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104bb0 <sys_close>:
80104bb0:	55                   	push   %ebp
80104bb1:	89 e5                	mov    %esp,%ebp
80104bb3:	83 ec 18             	sub    $0x18,%esp
80104bb6:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104bb9:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104bbc:	e8 3f fe ff ff       	call   80104a00 <argfd.constprop.0>
80104bc1:	85 c0                	test   %eax,%eax
80104bc3:	78 2b                	js     80104bf0 <sys_close+0x40>
80104bc5:	e8 a6 eb ff ff       	call   80103770 <myproc>
80104bca:	8b 55 f0             	mov    -0x10(%ebp),%edx
80104bcd:	83 ec 0c             	sub    $0xc,%esp
80104bd0:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104bd7:	00 
80104bd8:	ff 75 f4             	pushl  -0xc(%ebp)
80104bdb:	e8 40 c2 ff ff       	call   80100e20 <fileclose>
80104be0:	83 c4 10             	add    $0x10,%esp
80104be3:	31 c0                	xor    %eax,%eax
80104be5:	c9                   	leave  
80104be6:	c3                   	ret    
80104be7:	89 f6                	mov    %esi,%esi
80104be9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104bf0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104bf5:	c9                   	leave  
80104bf6:	c3                   	ret    
80104bf7:	89 f6                	mov    %esi,%esi
80104bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c00 <sys_fstat>:
80104c00:	55                   	push   %ebp
80104c01:	31 c0                	xor    %eax,%eax
80104c03:	89 e5                	mov    %esp,%ebp
80104c05:	83 ec 18             	sub    $0x18,%esp
80104c08:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104c0b:	e8 f0 fd ff ff       	call   80104a00 <argfd.constprop.0>
80104c10:	85 c0                	test   %eax,%eax
80104c12:	78 2c                	js     80104c40 <sys_fstat+0x40>
80104c14:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c17:	83 ec 04             	sub    $0x4,%esp
80104c1a:	6a 14                	push   $0x14
80104c1c:	50                   	push   %eax
80104c1d:	6a 01                	push   $0x1
80104c1f:	e8 3c fb ff ff       	call   80104760 <argptr>
80104c24:	83 c4 10             	add    $0x10,%esp
80104c27:	85 c0                	test   %eax,%eax
80104c29:	78 15                	js     80104c40 <sys_fstat+0x40>
80104c2b:	83 ec 08             	sub    $0x8,%esp
80104c2e:	ff 75 f4             	pushl  -0xc(%ebp)
80104c31:	ff 75 f0             	pushl  -0x10(%ebp)
80104c34:	e8 b7 c2 ff ff       	call   80100ef0 <filestat>
80104c39:	83 c4 10             	add    $0x10,%esp
80104c3c:	c9                   	leave  
80104c3d:	c3                   	ret    
80104c3e:	66 90                	xchg   %ax,%ax
80104c40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c45:	c9                   	leave  
80104c46:	c3                   	ret    
80104c47:	89 f6                	mov    %esi,%esi
80104c49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c50 <sys_link>:
80104c50:	55                   	push   %ebp
80104c51:	89 e5                	mov    %esp,%ebp
80104c53:	57                   	push   %edi
80104c54:	56                   	push   %esi
80104c55:	53                   	push   %ebx
80104c56:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104c59:	83 ec 34             	sub    $0x34,%esp
80104c5c:	50                   	push   %eax
80104c5d:	6a 00                	push   $0x0
80104c5f:	e8 5c fb ff ff       	call   801047c0 <argstr>
80104c64:	83 c4 10             	add    $0x10,%esp
80104c67:	85 c0                	test   %eax,%eax
80104c69:	0f 88 fb 00 00 00    	js     80104d6a <sys_link+0x11a>
80104c6f:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104c72:	83 ec 08             	sub    $0x8,%esp
80104c75:	50                   	push   %eax
80104c76:	6a 01                	push   $0x1
80104c78:	e8 43 fb ff ff       	call   801047c0 <argstr>
80104c7d:	83 c4 10             	add    $0x10,%esp
80104c80:	85 c0                	test   %eax,%eax
80104c82:	0f 88 e2 00 00 00    	js     80104d6a <sys_link+0x11a>
80104c88:	e8 b3 de ff ff       	call   80102b40 <begin_op>
80104c8d:	83 ec 0c             	sub    $0xc,%esp
80104c90:	ff 75 d4             	pushl  -0x2c(%ebp)
80104c93:	e8 18 d2 ff ff       	call   80101eb0 <namei>
80104c98:	83 c4 10             	add    $0x10,%esp
80104c9b:	85 c0                	test   %eax,%eax
80104c9d:	89 c3                	mov    %eax,%ebx
80104c9f:	0f 84 f3 00 00 00    	je     80104d98 <sys_link+0x148>
80104ca5:	83 ec 0c             	sub    $0xc,%esp
80104ca8:	50                   	push   %eax
80104ca9:	e8 b2 c9 ff ff       	call   80101660 <ilock>
80104cae:	83 c4 10             	add    $0x10,%esp
80104cb1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104cb6:	0f 84 c4 00 00 00    	je     80104d80 <sys_link+0x130>
80104cbc:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
80104cc1:	83 ec 0c             	sub    $0xc,%esp
80104cc4:	8d 7d da             	lea    -0x26(%ebp),%edi
80104cc7:	53                   	push   %ebx
80104cc8:	e8 e3 c8 ff ff       	call   801015b0 <iupdate>
80104ccd:	89 1c 24             	mov    %ebx,(%esp)
80104cd0:	e8 6b ca ff ff       	call   80101740 <iunlock>
80104cd5:	58                   	pop    %eax
80104cd6:	5a                   	pop    %edx
80104cd7:	57                   	push   %edi
80104cd8:	ff 75 d0             	pushl  -0x30(%ebp)
80104cdb:	e8 f0 d1 ff ff       	call   80101ed0 <nameiparent>
80104ce0:	83 c4 10             	add    $0x10,%esp
80104ce3:	85 c0                	test   %eax,%eax
80104ce5:	89 c6                	mov    %eax,%esi
80104ce7:	74 5b                	je     80104d44 <sys_link+0xf4>
80104ce9:	83 ec 0c             	sub    $0xc,%esp
80104cec:	50                   	push   %eax
80104ced:	e8 6e c9 ff ff       	call   80101660 <ilock>
80104cf2:	83 c4 10             	add    $0x10,%esp
80104cf5:	8b 03                	mov    (%ebx),%eax
80104cf7:	39 06                	cmp    %eax,(%esi)
80104cf9:	75 3d                	jne    80104d38 <sys_link+0xe8>
80104cfb:	83 ec 04             	sub    $0x4,%esp
80104cfe:	ff 73 04             	pushl  0x4(%ebx)
80104d01:	57                   	push   %edi
80104d02:	56                   	push   %esi
80104d03:	e8 e8 d0 ff ff       	call   80101df0 <dirlink>
80104d08:	83 c4 10             	add    $0x10,%esp
80104d0b:	85 c0                	test   %eax,%eax
80104d0d:	78 29                	js     80104d38 <sys_link+0xe8>
80104d0f:	83 ec 0c             	sub    $0xc,%esp
80104d12:	56                   	push   %esi
80104d13:	e8 d8 cb ff ff       	call   801018f0 <iunlockput>
80104d18:	89 1c 24             	mov    %ebx,(%esp)
80104d1b:	e8 70 ca ff ff       	call   80101790 <iput>
80104d20:	e8 8b de ff ff       	call   80102bb0 <end_op>
80104d25:	83 c4 10             	add    $0x10,%esp
80104d28:	31 c0                	xor    %eax,%eax
80104d2a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104d2d:	5b                   	pop    %ebx
80104d2e:	5e                   	pop    %esi
80104d2f:	5f                   	pop    %edi
80104d30:	5d                   	pop    %ebp
80104d31:	c3                   	ret    
80104d32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104d38:	83 ec 0c             	sub    $0xc,%esp
80104d3b:	56                   	push   %esi
80104d3c:	e8 af cb ff ff       	call   801018f0 <iunlockput>
80104d41:	83 c4 10             	add    $0x10,%esp
80104d44:	83 ec 0c             	sub    $0xc,%esp
80104d47:	53                   	push   %ebx
80104d48:	e8 13 c9 ff ff       	call   80101660 <ilock>
80104d4d:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80104d52:	89 1c 24             	mov    %ebx,(%esp)
80104d55:	e8 56 c8 ff ff       	call   801015b0 <iupdate>
80104d5a:	89 1c 24             	mov    %ebx,(%esp)
80104d5d:	e8 8e cb ff ff       	call   801018f0 <iunlockput>
80104d62:	e8 49 de ff ff       	call   80102bb0 <end_op>
80104d67:	83 c4 10             	add    $0x10,%esp
80104d6a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104d6d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104d72:	5b                   	pop    %ebx
80104d73:	5e                   	pop    %esi
80104d74:	5f                   	pop    %edi
80104d75:	5d                   	pop    %ebp
80104d76:	c3                   	ret    
80104d77:	89 f6                	mov    %esi,%esi
80104d79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104d80:	83 ec 0c             	sub    $0xc,%esp
80104d83:	53                   	push   %ebx
80104d84:	e8 67 cb ff ff       	call   801018f0 <iunlockput>
80104d89:	e8 22 de ff ff       	call   80102bb0 <end_op>
80104d8e:	83 c4 10             	add    $0x10,%esp
80104d91:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104d96:	eb 92                	jmp    80104d2a <sys_link+0xda>
80104d98:	e8 13 de ff ff       	call   80102bb0 <end_op>
80104d9d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104da2:	eb 86                	jmp    80104d2a <sys_link+0xda>
80104da4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104daa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104db0 <sys_unlink>:
80104db0:	55                   	push   %ebp
80104db1:	89 e5                	mov    %esp,%ebp
80104db3:	57                   	push   %edi
80104db4:	56                   	push   %esi
80104db5:	53                   	push   %ebx
80104db6:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104db9:	83 ec 54             	sub    $0x54,%esp
80104dbc:	50                   	push   %eax
80104dbd:	6a 00                	push   $0x0
80104dbf:	e8 fc f9 ff ff       	call   801047c0 <argstr>
80104dc4:	83 c4 10             	add    $0x10,%esp
80104dc7:	85 c0                	test   %eax,%eax
80104dc9:	0f 88 82 01 00 00    	js     80104f51 <sys_unlink+0x1a1>
80104dcf:	8d 5d ca             	lea    -0x36(%ebp),%ebx
80104dd2:	e8 69 dd ff ff       	call   80102b40 <begin_op>
80104dd7:	83 ec 08             	sub    $0x8,%esp
80104dda:	53                   	push   %ebx
80104ddb:	ff 75 c0             	pushl  -0x40(%ebp)
80104dde:	e8 ed d0 ff ff       	call   80101ed0 <nameiparent>
80104de3:	83 c4 10             	add    $0x10,%esp
80104de6:	85 c0                	test   %eax,%eax
80104de8:	89 45 b4             	mov    %eax,-0x4c(%ebp)
80104deb:	0f 84 6a 01 00 00    	je     80104f5b <sys_unlink+0x1ab>
80104df1:	8b 75 b4             	mov    -0x4c(%ebp),%esi
80104df4:	83 ec 0c             	sub    $0xc,%esp
80104df7:	56                   	push   %esi
80104df8:	e8 63 c8 ff ff       	call   80101660 <ilock>
80104dfd:	58                   	pop    %eax
80104dfe:	5a                   	pop    %edx
80104dff:	68 7c 77 10 80       	push   $0x8010777c
80104e04:	53                   	push   %ebx
80104e05:	e8 66 cd ff ff       	call   80101b70 <namecmp>
80104e0a:	83 c4 10             	add    $0x10,%esp
80104e0d:	85 c0                	test   %eax,%eax
80104e0f:	0f 84 fc 00 00 00    	je     80104f11 <sys_unlink+0x161>
80104e15:	83 ec 08             	sub    $0x8,%esp
80104e18:	68 7b 77 10 80       	push   $0x8010777b
80104e1d:	53                   	push   %ebx
80104e1e:	e8 4d cd ff ff       	call   80101b70 <namecmp>
80104e23:	83 c4 10             	add    $0x10,%esp
80104e26:	85 c0                	test   %eax,%eax
80104e28:	0f 84 e3 00 00 00    	je     80104f11 <sys_unlink+0x161>
80104e2e:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80104e31:	83 ec 04             	sub    $0x4,%esp
80104e34:	50                   	push   %eax
80104e35:	53                   	push   %ebx
80104e36:	56                   	push   %esi
80104e37:	e8 54 cd ff ff       	call   80101b90 <dirlookup>
80104e3c:	83 c4 10             	add    $0x10,%esp
80104e3f:	85 c0                	test   %eax,%eax
80104e41:	89 c3                	mov    %eax,%ebx
80104e43:	0f 84 c8 00 00 00    	je     80104f11 <sys_unlink+0x161>
80104e49:	83 ec 0c             	sub    $0xc,%esp
80104e4c:	50                   	push   %eax
80104e4d:	e8 0e c8 ff ff       	call   80101660 <ilock>
80104e52:	83 c4 10             	add    $0x10,%esp
80104e55:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80104e5a:	0f 8e 24 01 00 00    	jle    80104f84 <sys_unlink+0x1d4>
80104e60:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104e65:	8d 75 d8             	lea    -0x28(%ebp),%esi
80104e68:	74 66                	je     80104ed0 <sys_unlink+0x120>
80104e6a:	83 ec 04             	sub    $0x4,%esp
80104e6d:	6a 10                	push   $0x10
80104e6f:	6a 00                	push   $0x0
80104e71:	56                   	push   %esi
80104e72:	e8 89 f5 ff ff       	call   80104400 <memset>
80104e77:	6a 10                	push   $0x10
80104e79:	ff 75 c4             	pushl  -0x3c(%ebp)
80104e7c:	56                   	push   %esi
80104e7d:	ff 75 b4             	pushl  -0x4c(%ebp)
80104e80:	e8 bb cb ff ff       	call   80101a40 <writei>
80104e85:	83 c4 20             	add    $0x20,%esp
80104e88:	83 f8 10             	cmp    $0x10,%eax
80104e8b:	0f 85 e6 00 00 00    	jne    80104f77 <sys_unlink+0x1c7>
80104e91:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104e96:	0f 84 9c 00 00 00    	je     80104f38 <sys_unlink+0x188>
80104e9c:	83 ec 0c             	sub    $0xc,%esp
80104e9f:	ff 75 b4             	pushl  -0x4c(%ebp)
80104ea2:	e8 49 ca ff ff       	call   801018f0 <iunlockput>
80104ea7:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80104eac:	89 1c 24             	mov    %ebx,(%esp)
80104eaf:	e8 fc c6 ff ff       	call   801015b0 <iupdate>
80104eb4:	89 1c 24             	mov    %ebx,(%esp)
80104eb7:	e8 34 ca ff ff       	call   801018f0 <iunlockput>
80104ebc:	e8 ef dc ff ff       	call   80102bb0 <end_op>
80104ec1:	83 c4 10             	add    $0x10,%esp
80104ec4:	31 c0                	xor    %eax,%eax
80104ec6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104ec9:	5b                   	pop    %ebx
80104eca:	5e                   	pop    %esi
80104ecb:	5f                   	pop    %edi
80104ecc:	5d                   	pop    %ebp
80104ecd:	c3                   	ret    
80104ece:	66 90                	xchg   %ax,%ax
80104ed0:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80104ed4:	76 94                	jbe    80104e6a <sys_unlink+0xba>
80104ed6:	bf 20 00 00 00       	mov    $0x20,%edi
80104edb:	eb 0f                	jmp    80104eec <sys_unlink+0x13c>
80104edd:	8d 76 00             	lea    0x0(%esi),%esi
80104ee0:	83 c7 10             	add    $0x10,%edi
80104ee3:	3b 7b 58             	cmp    0x58(%ebx),%edi
80104ee6:	0f 83 7e ff ff ff    	jae    80104e6a <sys_unlink+0xba>
80104eec:	6a 10                	push   $0x10
80104eee:	57                   	push   %edi
80104eef:	56                   	push   %esi
80104ef0:	53                   	push   %ebx
80104ef1:	e8 4a ca ff ff       	call   80101940 <readi>
80104ef6:	83 c4 10             	add    $0x10,%esp
80104ef9:	83 f8 10             	cmp    $0x10,%eax
80104efc:	75 6c                	jne    80104f6a <sys_unlink+0x1ba>
80104efe:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80104f03:	74 db                	je     80104ee0 <sys_unlink+0x130>
80104f05:	83 ec 0c             	sub    $0xc,%esp
80104f08:	53                   	push   %ebx
80104f09:	e8 e2 c9 ff ff       	call   801018f0 <iunlockput>
80104f0e:	83 c4 10             	add    $0x10,%esp
80104f11:	83 ec 0c             	sub    $0xc,%esp
80104f14:	ff 75 b4             	pushl  -0x4c(%ebp)
80104f17:	e8 d4 c9 ff ff       	call   801018f0 <iunlockput>
80104f1c:	e8 8f dc ff ff       	call   80102bb0 <end_op>
80104f21:	83 c4 10             	add    $0x10,%esp
80104f24:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104f27:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f2c:	5b                   	pop    %ebx
80104f2d:	5e                   	pop    %esi
80104f2e:	5f                   	pop    %edi
80104f2f:	5d                   	pop    %ebp
80104f30:	c3                   	ret    
80104f31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104f38:	8b 45 b4             	mov    -0x4c(%ebp),%eax
80104f3b:	83 ec 0c             	sub    $0xc,%esp
80104f3e:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
80104f43:	50                   	push   %eax
80104f44:	e8 67 c6 ff ff       	call   801015b0 <iupdate>
80104f49:	83 c4 10             	add    $0x10,%esp
80104f4c:	e9 4b ff ff ff       	jmp    80104e9c <sys_unlink+0xec>
80104f51:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f56:	e9 6b ff ff ff       	jmp    80104ec6 <sys_unlink+0x116>
80104f5b:	e8 50 dc ff ff       	call   80102bb0 <end_op>
80104f60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f65:	e9 5c ff ff ff       	jmp    80104ec6 <sys_unlink+0x116>
80104f6a:	83 ec 0c             	sub    $0xc,%esp
80104f6d:	68 a0 77 10 80       	push   $0x801077a0
80104f72:	e8 f9 b3 ff ff       	call   80100370 <panic>
80104f77:	83 ec 0c             	sub    $0xc,%esp
80104f7a:	68 b2 77 10 80       	push   $0x801077b2
80104f7f:	e8 ec b3 ff ff       	call   80100370 <panic>
80104f84:	83 ec 0c             	sub    $0xc,%esp
80104f87:	68 8e 77 10 80       	push   $0x8010778e
80104f8c:	e8 df b3 ff ff       	call   80100370 <panic>
80104f91:	eb 0d                	jmp    80104fa0 <sys_open>
80104f93:	90                   	nop
80104f94:	90                   	nop
80104f95:	90                   	nop
80104f96:	90                   	nop
80104f97:	90                   	nop
80104f98:	90                   	nop
80104f99:	90                   	nop
80104f9a:	90                   	nop
80104f9b:	90                   	nop
80104f9c:	90                   	nop
80104f9d:	90                   	nop
80104f9e:	90                   	nop
80104f9f:	90                   	nop

80104fa0 <sys_open>:
80104fa0:	55                   	push   %ebp
80104fa1:	89 e5                	mov    %esp,%ebp
80104fa3:	57                   	push   %edi
80104fa4:	56                   	push   %esi
80104fa5:	53                   	push   %ebx
80104fa6:	8d 45 e0             	lea    -0x20(%ebp),%eax
80104fa9:	83 ec 24             	sub    $0x24,%esp
80104fac:	50                   	push   %eax
80104fad:	6a 00                	push   $0x0
80104faf:	e8 0c f8 ff ff       	call   801047c0 <argstr>
80104fb4:	83 c4 10             	add    $0x10,%esp
80104fb7:	85 c0                	test   %eax,%eax
80104fb9:	0f 88 9e 00 00 00    	js     8010505d <sys_open+0xbd>
80104fbf:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80104fc2:	83 ec 08             	sub    $0x8,%esp
80104fc5:	50                   	push   %eax
80104fc6:	6a 01                	push   $0x1
80104fc8:	e8 43 f7 ff ff       	call   80104710 <argint>
80104fcd:	83 c4 10             	add    $0x10,%esp
80104fd0:	85 c0                	test   %eax,%eax
80104fd2:	0f 88 85 00 00 00    	js     8010505d <sys_open+0xbd>
80104fd8:	e8 63 db ff ff       	call   80102b40 <begin_op>
80104fdd:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80104fe1:	0f 85 89 00 00 00    	jne    80105070 <sys_open+0xd0>
80104fe7:	83 ec 0c             	sub    $0xc,%esp
80104fea:	ff 75 e0             	pushl  -0x20(%ebp)
80104fed:	e8 be ce ff ff       	call   80101eb0 <namei>
80104ff2:	83 c4 10             	add    $0x10,%esp
80104ff5:	85 c0                	test   %eax,%eax
80104ff7:	89 c6                	mov    %eax,%esi
80104ff9:	0f 84 8e 00 00 00    	je     8010508d <sys_open+0xed>
80104fff:	83 ec 0c             	sub    $0xc,%esp
80105002:	50                   	push   %eax
80105003:	e8 58 c6 ff ff       	call   80101660 <ilock>
80105008:	83 c4 10             	add    $0x10,%esp
8010500b:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80105010:	0f 84 d2 00 00 00    	je     801050e8 <sys_open+0x148>
80105016:	e8 45 bd ff ff       	call   80100d60 <filealloc>
8010501b:	85 c0                	test   %eax,%eax
8010501d:	89 c7                	mov    %eax,%edi
8010501f:	74 2b                	je     8010504c <sys_open+0xac>
80105021:	31 db                	xor    %ebx,%ebx
80105023:	e8 48 e7 ff ff       	call   80103770 <myproc>
80105028:	90                   	nop
80105029:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105030:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80105034:	85 d2                	test   %edx,%edx
80105036:	74 68                	je     801050a0 <sys_open+0x100>
80105038:	83 c3 01             	add    $0x1,%ebx
8010503b:	83 fb 10             	cmp    $0x10,%ebx
8010503e:	75 f0                	jne    80105030 <sys_open+0x90>
80105040:	83 ec 0c             	sub    $0xc,%esp
80105043:	57                   	push   %edi
80105044:	e8 d7 bd ff ff       	call   80100e20 <fileclose>
80105049:	83 c4 10             	add    $0x10,%esp
8010504c:	83 ec 0c             	sub    $0xc,%esp
8010504f:	56                   	push   %esi
80105050:	e8 9b c8 ff ff       	call   801018f0 <iunlockput>
80105055:	e8 56 db ff ff       	call   80102bb0 <end_op>
8010505a:	83 c4 10             	add    $0x10,%esp
8010505d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105060:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105065:	5b                   	pop    %ebx
80105066:	5e                   	pop    %esi
80105067:	5f                   	pop    %edi
80105068:	5d                   	pop    %ebp
80105069:	c3                   	ret    
8010506a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105070:	83 ec 0c             	sub    $0xc,%esp
80105073:	8b 45 e0             	mov    -0x20(%ebp),%eax
80105076:	31 c9                	xor    %ecx,%ecx
80105078:	6a 00                	push   $0x0
8010507a:	ba 02 00 00 00       	mov    $0x2,%edx
8010507f:	e8 dc f7 ff ff       	call   80104860 <create>
80105084:	83 c4 10             	add    $0x10,%esp
80105087:	85 c0                	test   %eax,%eax
80105089:	89 c6                	mov    %eax,%esi
8010508b:	75 89                	jne    80105016 <sys_open+0x76>
8010508d:	e8 1e db ff ff       	call   80102bb0 <end_op>
80105092:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105097:	eb 43                	jmp    801050dc <sys_open+0x13c>
80105099:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801050a0:	83 ec 0c             	sub    $0xc,%esp
801050a3:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
801050a7:	56                   	push   %esi
801050a8:	e8 93 c6 ff ff       	call   80101740 <iunlock>
801050ad:	e8 fe da ff ff       	call   80102bb0 <end_op>
801050b2:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
801050b8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801050bb:	83 c4 10             	add    $0x10,%esp
801050be:	89 77 10             	mov    %esi,0x10(%edi)
801050c1:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
801050c8:	89 d0                	mov    %edx,%eax
801050ca:	83 e0 01             	and    $0x1,%eax
801050cd:	83 f0 01             	xor    $0x1,%eax
801050d0:	83 e2 03             	and    $0x3,%edx
801050d3:	88 47 08             	mov    %al,0x8(%edi)
801050d6:	0f 95 47 09          	setne  0x9(%edi)
801050da:	89 d8                	mov    %ebx,%eax
801050dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801050df:	5b                   	pop    %ebx
801050e0:	5e                   	pop    %esi
801050e1:	5f                   	pop    %edi
801050e2:	5d                   	pop    %ebp
801050e3:	c3                   	ret    
801050e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801050e8:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801050eb:	85 c9                	test   %ecx,%ecx
801050ed:	0f 84 23 ff ff ff    	je     80105016 <sys_open+0x76>
801050f3:	e9 54 ff ff ff       	jmp    8010504c <sys_open+0xac>
801050f8:	90                   	nop
801050f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105100 <sys_mkdir>:
80105100:	55                   	push   %ebp
80105101:	89 e5                	mov    %esp,%ebp
80105103:	83 ec 18             	sub    $0x18,%esp
80105106:	e8 35 da ff ff       	call   80102b40 <begin_op>
8010510b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010510e:	83 ec 08             	sub    $0x8,%esp
80105111:	50                   	push   %eax
80105112:	6a 00                	push   $0x0
80105114:	e8 a7 f6 ff ff       	call   801047c0 <argstr>
80105119:	83 c4 10             	add    $0x10,%esp
8010511c:	85 c0                	test   %eax,%eax
8010511e:	78 30                	js     80105150 <sys_mkdir+0x50>
80105120:	83 ec 0c             	sub    $0xc,%esp
80105123:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105126:	31 c9                	xor    %ecx,%ecx
80105128:	6a 00                	push   $0x0
8010512a:	ba 01 00 00 00       	mov    $0x1,%edx
8010512f:	e8 2c f7 ff ff       	call   80104860 <create>
80105134:	83 c4 10             	add    $0x10,%esp
80105137:	85 c0                	test   %eax,%eax
80105139:	74 15                	je     80105150 <sys_mkdir+0x50>
8010513b:	83 ec 0c             	sub    $0xc,%esp
8010513e:	50                   	push   %eax
8010513f:	e8 ac c7 ff ff       	call   801018f0 <iunlockput>
80105144:	e8 67 da ff ff       	call   80102bb0 <end_op>
80105149:	83 c4 10             	add    $0x10,%esp
8010514c:	31 c0                	xor    %eax,%eax
8010514e:	c9                   	leave  
8010514f:	c3                   	ret    
80105150:	e8 5b da ff ff       	call   80102bb0 <end_op>
80105155:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010515a:	c9                   	leave  
8010515b:	c3                   	ret    
8010515c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105160 <sys_mknod>:
80105160:	55                   	push   %ebp
80105161:	89 e5                	mov    %esp,%ebp
80105163:	83 ec 18             	sub    $0x18,%esp
80105166:	e8 d5 d9 ff ff       	call   80102b40 <begin_op>
8010516b:	8d 45 ec             	lea    -0x14(%ebp),%eax
8010516e:	83 ec 08             	sub    $0x8,%esp
80105171:	50                   	push   %eax
80105172:	6a 00                	push   $0x0
80105174:	e8 47 f6 ff ff       	call   801047c0 <argstr>
80105179:	83 c4 10             	add    $0x10,%esp
8010517c:	85 c0                	test   %eax,%eax
8010517e:	78 60                	js     801051e0 <sys_mknod+0x80>
80105180:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105183:	83 ec 08             	sub    $0x8,%esp
80105186:	50                   	push   %eax
80105187:	6a 01                	push   $0x1
80105189:	e8 82 f5 ff ff       	call   80104710 <argint>
8010518e:	83 c4 10             	add    $0x10,%esp
80105191:	85 c0                	test   %eax,%eax
80105193:	78 4b                	js     801051e0 <sys_mknod+0x80>
80105195:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105198:	83 ec 08             	sub    $0x8,%esp
8010519b:	50                   	push   %eax
8010519c:	6a 02                	push   $0x2
8010519e:	e8 6d f5 ff ff       	call   80104710 <argint>
801051a3:	83 c4 10             	add    $0x10,%esp
801051a6:	85 c0                	test   %eax,%eax
801051a8:	78 36                	js     801051e0 <sys_mknod+0x80>
801051aa:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
801051ae:	83 ec 0c             	sub    $0xc,%esp
801051b1:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
801051b5:	ba 03 00 00 00       	mov    $0x3,%edx
801051ba:	50                   	push   %eax
801051bb:	8b 45 ec             	mov    -0x14(%ebp),%eax
801051be:	e8 9d f6 ff ff       	call   80104860 <create>
801051c3:	83 c4 10             	add    $0x10,%esp
801051c6:	85 c0                	test   %eax,%eax
801051c8:	74 16                	je     801051e0 <sys_mknod+0x80>
801051ca:	83 ec 0c             	sub    $0xc,%esp
801051cd:	50                   	push   %eax
801051ce:	e8 1d c7 ff ff       	call   801018f0 <iunlockput>
801051d3:	e8 d8 d9 ff ff       	call   80102bb0 <end_op>
801051d8:	83 c4 10             	add    $0x10,%esp
801051db:	31 c0                	xor    %eax,%eax
801051dd:	c9                   	leave  
801051de:	c3                   	ret    
801051df:	90                   	nop
801051e0:	e8 cb d9 ff ff       	call   80102bb0 <end_op>
801051e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801051ea:	c9                   	leave  
801051eb:	c3                   	ret    
801051ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801051f0 <sys_chdir>:
801051f0:	55                   	push   %ebp
801051f1:	89 e5                	mov    %esp,%ebp
801051f3:	56                   	push   %esi
801051f4:	53                   	push   %ebx
801051f5:	83 ec 10             	sub    $0x10,%esp
801051f8:	e8 73 e5 ff ff       	call   80103770 <myproc>
801051fd:	89 c6                	mov    %eax,%esi
801051ff:	e8 3c d9 ff ff       	call   80102b40 <begin_op>
80105204:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105207:	83 ec 08             	sub    $0x8,%esp
8010520a:	50                   	push   %eax
8010520b:	6a 00                	push   $0x0
8010520d:	e8 ae f5 ff ff       	call   801047c0 <argstr>
80105212:	83 c4 10             	add    $0x10,%esp
80105215:	85 c0                	test   %eax,%eax
80105217:	78 77                	js     80105290 <sys_chdir+0xa0>
80105219:	83 ec 0c             	sub    $0xc,%esp
8010521c:	ff 75 f4             	pushl  -0xc(%ebp)
8010521f:	e8 8c cc ff ff       	call   80101eb0 <namei>
80105224:	83 c4 10             	add    $0x10,%esp
80105227:	85 c0                	test   %eax,%eax
80105229:	89 c3                	mov    %eax,%ebx
8010522b:	74 63                	je     80105290 <sys_chdir+0xa0>
8010522d:	83 ec 0c             	sub    $0xc,%esp
80105230:	50                   	push   %eax
80105231:	e8 2a c4 ff ff       	call   80101660 <ilock>
80105236:	83 c4 10             	add    $0x10,%esp
80105239:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
8010523e:	75 30                	jne    80105270 <sys_chdir+0x80>
80105240:	83 ec 0c             	sub    $0xc,%esp
80105243:	53                   	push   %ebx
80105244:	e8 f7 c4 ff ff       	call   80101740 <iunlock>
80105249:	58                   	pop    %eax
8010524a:	ff 76 68             	pushl  0x68(%esi)
8010524d:	e8 3e c5 ff ff       	call   80101790 <iput>
80105252:	e8 59 d9 ff ff       	call   80102bb0 <end_op>
80105257:	89 5e 68             	mov    %ebx,0x68(%esi)
8010525a:	83 c4 10             	add    $0x10,%esp
8010525d:	31 c0                	xor    %eax,%eax
8010525f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105262:	5b                   	pop    %ebx
80105263:	5e                   	pop    %esi
80105264:	5d                   	pop    %ebp
80105265:	c3                   	ret    
80105266:	8d 76 00             	lea    0x0(%esi),%esi
80105269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105270:	83 ec 0c             	sub    $0xc,%esp
80105273:	53                   	push   %ebx
80105274:	e8 77 c6 ff ff       	call   801018f0 <iunlockput>
80105279:	e8 32 d9 ff ff       	call   80102bb0 <end_op>
8010527e:	83 c4 10             	add    $0x10,%esp
80105281:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105286:	eb d7                	jmp    8010525f <sys_chdir+0x6f>
80105288:	90                   	nop
80105289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105290:	e8 1b d9 ff ff       	call   80102bb0 <end_op>
80105295:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010529a:	eb c3                	jmp    8010525f <sys_chdir+0x6f>
8010529c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801052a0 <sys_exec>:
801052a0:	55                   	push   %ebp
801052a1:	89 e5                	mov    %esp,%ebp
801052a3:	57                   	push   %edi
801052a4:	56                   	push   %esi
801052a5:	53                   	push   %ebx
801052a6:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
801052ac:	81 ec a4 00 00 00    	sub    $0xa4,%esp
801052b2:	50                   	push   %eax
801052b3:	6a 00                	push   $0x0
801052b5:	e8 06 f5 ff ff       	call   801047c0 <argstr>
801052ba:	83 c4 10             	add    $0x10,%esp
801052bd:	85 c0                	test   %eax,%eax
801052bf:	78 7f                	js     80105340 <sys_exec+0xa0>
801052c1:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
801052c7:	83 ec 08             	sub    $0x8,%esp
801052ca:	50                   	push   %eax
801052cb:	6a 01                	push   $0x1
801052cd:	e8 3e f4 ff ff       	call   80104710 <argint>
801052d2:	83 c4 10             	add    $0x10,%esp
801052d5:	85 c0                	test   %eax,%eax
801052d7:	78 67                	js     80105340 <sys_exec+0xa0>
801052d9:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801052df:	83 ec 04             	sub    $0x4,%esp
801052e2:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
801052e8:	68 80 00 00 00       	push   $0x80
801052ed:	6a 00                	push   $0x0
801052ef:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
801052f5:	50                   	push   %eax
801052f6:	31 db                	xor    %ebx,%ebx
801052f8:	e8 03 f1 ff ff       	call   80104400 <memset>
801052fd:	83 c4 10             	add    $0x10,%esp
80105300:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105306:	83 ec 08             	sub    $0x8,%esp
80105309:	57                   	push   %edi
8010530a:	8d 04 98             	lea    (%eax,%ebx,4),%eax
8010530d:	50                   	push   %eax
8010530e:	e8 5d f3 ff ff       	call   80104670 <fetchint>
80105313:	83 c4 10             	add    $0x10,%esp
80105316:	85 c0                	test   %eax,%eax
80105318:	78 26                	js     80105340 <sys_exec+0xa0>
8010531a:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
80105320:	85 c0                	test   %eax,%eax
80105322:	74 2c                	je     80105350 <sys_exec+0xb0>
80105324:	83 ec 08             	sub    $0x8,%esp
80105327:	56                   	push   %esi
80105328:	50                   	push   %eax
80105329:	e8 82 f3 ff ff       	call   801046b0 <fetchstr>
8010532e:	83 c4 10             	add    $0x10,%esp
80105331:	85 c0                	test   %eax,%eax
80105333:	78 0b                	js     80105340 <sys_exec+0xa0>
80105335:	83 c3 01             	add    $0x1,%ebx
80105338:	83 c6 04             	add    $0x4,%esi
8010533b:	83 fb 20             	cmp    $0x20,%ebx
8010533e:	75 c0                	jne    80105300 <sys_exec+0x60>
80105340:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105343:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105348:	5b                   	pop    %ebx
80105349:	5e                   	pop    %esi
8010534a:	5f                   	pop    %edi
8010534b:	5d                   	pop    %ebp
8010534c:	c3                   	ret    
8010534d:	8d 76 00             	lea    0x0(%esi),%esi
80105350:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105356:	83 ec 08             	sub    $0x8,%esp
80105359:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80105360:	00 00 00 00 
80105364:	50                   	push   %eax
80105365:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
8010536b:	e8 80 b6 ff ff       	call   801009f0 <exec>
80105370:	83 c4 10             	add    $0x10,%esp
80105373:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105376:	5b                   	pop    %ebx
80105377:	5e                   	pop    %esi
80105378:	5f                   	pop    %edi
80105379:	5d                   	pop    %ebp
8010537a:	c3                   	ret    
8010537b:	90                   	nop
8010537c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105380 <sys_pipe>:
80105380:	55                   	push   %ebp
80105381:	89 e5                	mov    %esp,%ebp
80105383:	57                   	push   %edi
80105384:	56                   	push   %esi
80105385:	53                   	push   %ebx
80105386:	8d 45 dc             	lea    -0x24(%ebp),%eax
80105389:	83 ec 20             	sub    $0x20,%esp
8010538c:	6a 08                	push   $0x8
8010538e:	50                   	push   %eax
8010538f:	6a 00                	push   $0x0
80105391:	e8 ca f3 ff ff       	call   80104760 <argptr>
80105396:	83 c4 10             	add    $0x10,%esp
80105399:	85 c0                	test   %eax,%eax
8010539b:	78 4a                	js     801053e7 <sys_pipe+0x67>
8010539d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801053a0:	83 ec 08             	sub    $0x8,%esp
801053a3:	50                   	push   %eax
801053a4:	8d 45 e0             	lea    -0x20(%ebp),%eax
801053a7:	50                   	push   %eax
801053a8:	e8 33 de ff ff       	call   801031e0 <pipealloc>
801053ad:	83 c4 10             	add    $0x10,%esp
801053b0:	85 c0                	test   %eax,%eax
801053b2:	78 33                	js     801053e7 <sys_pipe+0x67>
801053b4:	31 db                	xor    %ebx,%ebx
801053b6:	8b 7d e0             	mov    -0x20(%ebp),%edi
801053b9:	e8 b2 e3 ff ff       	call   80103770 <myproc>
801053be:	66 90                	xchg   %ax,%ax
801053c0:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
801053c4:	85 f6                	test   %esi,%esi
801053c6:	74 30                	je     801053f8 <sys_pipe+0x78>
801053c8:	83 c3 01             	add    $0x1,%ebx
801053cb:	83 fb 10             	cmp    $0x10,%ebx
801053ce:	75 f0                	jne    801053c0 <sys_pipe+0x40>
801053d0:	83 ec 0c             	sub    $0xc,%esp
801053d3:	ff 75 e0             	pushl  -0x20(%ebp)
801053d6:	e8 45 ba ff ff       	call   80100e20 <fileclose>
801053db:	58                   	pop    %eax
801053dc:	ff 75 e4             	pushl  -0x1c(%ebp)
801053df:	e8 3c ba ff ff       	call   80100e20 <fileclose>
801053e4:	83 c4 10             	add    $0x10,%esp
801053e7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801053ea:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053ef:	5b                   	pop    %ebx
801053f0:	5e                   	pop    %esi
801053f1:	5f                   	pop    %edi
801053f2:	5d                   	pop    %ebp
801053f3:	c3                   	ret    
801053f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801053f8:	8d 73 08             	lea    0x8(%ebx),%esi
801053fb:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
801053ff:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80105402:	e8 69 e3 ff ff       	call   80103770 <myproc>
80105407:	31 d2                	xor    %edx,%edx
80105409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105410:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
80105414:	85 c9                	test   %ecx,%ecx
80105416:	74 18                	je     80105430 <sys_pipe+0xb0>
80105418:	83 c2 01             	add    $0x1,%edx
8010541b:	83 fa 10             	cmp    $0x10,%edx
8010541e:	75 f0                	jne    80105410 <sys_pipe+0x90>
80105420:	e8 4b e3 ff ff       	call   80103770 <myproc>
80105425:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
8010542c:	00 
8010542d:	eb a1                	jmp    801053d0 <sys_pipe+0x50>
8010542f:	90                   	nop
80105430:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
80105434:	8b 45 dc             	mov    -0x24(%ebp),%eax
80105437:	89 18                	mov    %ebx,(%eax)
80105439:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010543c:	89 50 04             	mov    %edx,0x4(%eax)
8010543f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105442:	31 c0                	xor    %eax,%eax
80105444:	5b                   	pop    %ebx
80105445:	5e                   	pop    %esi
80105446:	5f                   	pop    %edi
80105447:	5d                   	pop    %ebp
80105448:	c3                   	ret    
80105449:	66 90                	xchg   %ax,%ax
8010544b:	66 90                	xchg   %ax,%ax
8010544d:	66 90                	xchg   %ax,%ax
8010544f:	90                   	nop

80105450 <sys_shm_open>:
80105450:	55                   	push   %ebp
80105451:	89 e5                	mov    %esp,%ebp
80105453:	83 ec 20             	sub    $0x20,%esp
80105456:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105459:	50                   	push   %eax
8010545a:	6a 00                	push   $0x0
8010545c:	e8 af f2 ff ff       	call   80104710 <argint>
80105461:	83 c4 10             	add    $0x10,%esp
80105464:	85 c0                	test   %eax,%eax
80105466:	78 30                	js     80105498 <sys_shm_open+0x48>
80105468:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010546b:	83 ec 04             	sub    $0x4,%esp
8010546e:	6a 04                	push   $0x4
80105470:	50                   	push   %eax
80105471:	6a 01                	push   $0x1
80105473:	e8 e8 f2 ff ff       	call   80104760 <argptr>
80105478:	83 c4 10             	add    $0x10,%esp
8010547b:	85 c0                	test   %eax,%eax
8010547d:	78 19                	js     80105498 <sys_shm_open+0x48>
8010547f:	83 ec 08             	sub    $0x8,%esp
80105482:	ff 75 f4             	pushl  -0xc(%ebp)
80105485:	ff 75 f0             	pushl  -0x10(%ebp)
80105488:	e8 63 1b 00 00       	call   80106ff0 <shm_open>
8010548d:	83 c4 10             	add    $0x10,%esp
80105490:	c9                   	leave  
80105491:	c3                   	ret    
80105492:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105498:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010549d:	c9                   	leave  
8010549e:	c3                   	ret    
8010549f:	90                   	nop

801054a0 <sys_shm_close>:
801054a0:	55                   	push   %ebp
801054a1:	89 e5                	mov    %esp,%ebp
801054a3:	83 ec 20             	sub    $0x20,%esp
801054a6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801054a9:	50                   	push   %eax
801054aa:	6a 00                	push   $0x0
801054ac:	e8 5f f2 ff ff       	call   80104710 <argint>
801054b1:	83 c4 10             	add    $0x10,%esp
801054b4:	85 c0                	test   %eax,%eax
801054b6:	78 18                	js     801054d0 <sys_shm_close+0x30>
801054b8:	83 ec 0c             	sub    $0xc,%esp
801054bb:	ff 75 f4             	pushl  -0xc(%ebp)
801054be:	e8 3d 1b 00 00       	call   80107000 <shm_close>
801054c3:	83 c4 10             	add    $0x10,%esp
801054c6:	c9                   	leave  
801054c7:	c3                   	ret    
801054c8:	90                   	nop
801054c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801054d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801054d5:	c9                   	leave  
801054d6:	c3                   	ret    
801054d7:	89 f6                	mov    %esi,%esi
801054d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801054e0 <sys_fork>:
801054e0:	55                   	push   %ebp
801054e1:	89 e5                	mov    %esp,%ebp
801054e3:	5d                   	pop    %ebp
801054e4:	e9 27 e4 ff ff       	jmp    80103910 <fork>
801054e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801054f0 <sys_exit>:
801054f0:	55                   	push   %ebp
801054f1:	89 e5                	mov    %esp,%ebp
801054f3:	83 ec 08             	sub    $0x8,%esp
801054f6:	e8 a5 e6 ff ff       	call   80103ba0 <exit>
801054fb:	31 c0                	xor    %eax,%eax
801054fd:	c9                   	leave  
801054fe:	c3                   	ret    
801054ff:	90                   	nop

80105500 <sys_wait>:
80105500:	55                   	push   %ebp
80105501:	89 e5                	mov    %esp,%ebp
80105503:	5d                   	pop    %ebp
80105504:	e9 d7 e8 ff ff       	jmp    80103de0 <wait>
80105509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105510 <sys_kill>:
80105510:	55                   	push   %ebp
80105511:	89 e5                	mov    %esp,%ebp
80105513:	83 ec 20             	sub    $0x20,%esp
80105516:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105519:	50                   	push   %eax
8010551a:	6a 00                	push   $0x0
8010551c:	e8 ef f1 ff ff       	call   80104710 <argint>
80105521:	83 c4 10             	add    $0x10,%esp
80105524:	85 c0                	test   %eax,%eax
80105526:	78 18                	js     80105540 <sys_kill+0x30>
80105528:	83 ec 0c             	sub    $0xc,%esp
8010552b:	ff 75 f4             	pushl  -0xc(%ebp)
8010552e:	e8 fd e9 ff ff       	call   80103f30 <kill>
80105533:	83 c4 10             	add    $0x10,%esp
80105536:	c9                   	leave  
80105537:	c3                   	ret    
80105538:	90                   	nop
80105539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105540:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105545:	c9                   	leave  
80105546:	c3                   	ret    
80105547:	89 f6                	mov    %esi,%esi
80105549:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105550 <sys_getpid>:
80105550:	55                   	push   %ebp
80105551:	89 e5                	mov    %esp,%ebp
80105553:	83 ec 08             	sub    $0x8,%esp
80105556:	e8 15 e2 ff ff       	call   80103770 <myproc>
8010555b:	8b 40 10             	mov    0x10(%eax),%eax
8010555e:	c9                   	leave  
8010555f:	c3                   	ret    

80105560 <sys_sbrk>:
80105560:	55                   	push   %ebp
80105561:	89 e5                	mov    %esp,%ebp
80105563:	53                   	push   %ebx
80105564:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105567:	83 ec 1c             	sub    $0x1c,%esp
8010556a:	50                   	push   %eax
8010556b:	6a 00                	push   $0x0
8010556d:	e8 9e f1 ff ff       	call   80104710 <argint>
80105572:	83 c4 10             	add    $0x10,%esp
80105575:	85 c0                	test   %eax,%eax
80105577:	78 27                	js     801055a0 <sys_sbrk+0x40>
80105579:	e8 f2 e1 ff ff       	call   80103770 <myproc>
8010557e:	83 ec 0c             	sub    $0xc,%esp
80105581:	8b 18                	mov    (%eax),%ebx
80105583:	ff 75 f4             	pushl  -0xc(%ebp)
80105586:	e8 05 e3 ff ff       	call   80103890 <growproc>
8010558b:	83 c4 10             	add    $0x10,%esp
8010558e:	85 c0                	test   %eax,%eax
80105590:	78 0e                	js     801055a0 <sys_sbrk+0x40>
80105592:	89 d8                	mov    %ebx,%eax
80105594:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105597:	c9                   	leave  
80105598:	c3                   	ret    
80105599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801055a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801055a5:	eb ed                	jmp    80105594 <sys_sbrk+0x34>
801055a7:	89 f6                	mov    %esi,%esi
801055a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801055b0 <sys_sleep>:
801055b0:	55                   	push   %ebp
801055b1:	89 e5                	mov    %esp,%ebp
801055b3:	53                   	push   %ebx
801055b4:	8d 45 f4             	lea    -0xc(%ebp),%eax
801055b7:	83 ec 1c             	sub    $0x1c,%esp
801055ba:	50                   	push   %eax
801055bb:	6a 00                	push   $0x0
801055bd:	e8 4e f1 ff ff       	call   80104710 <argint>
801055c2:	83 c4 10             	add    $0x10,%esp
801055c5:	85 c0                	test   %eax,%eax
801055c7:	0f 88 8a 00 00 00    	js     80105657 <sys_sleep+0xa7>
801055cd:	83 ec 0c             	sub    $0xc,%esp
801055d0:	68 60 4d 11 80       	push   $0x80114d60
801055d5:	e8 b6 ec ff ff       	call   80104290 <acquire>
801055da:	8b 55 f4             	mov    -0xc(%ebp),%edx
801055dd:	83 c4 10             	add    $0x10,%esp
801055e0:	8b 1d a0 55 11 80    	mov    0x801155a0,%ebx
801055e6:	85 d2                	test   %edx,%edx
801055e8:	75 27                	jne    80105611 <sys_sleep+0x61>
801055ea:	eb 54                	jmp    80105640 <sys_sleep+0x90>
801055ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801055f0:	83 ec 08             	sub    $0x8,%esp
801055f3:	68 60 4d 11 80       	push   $0x80114d60
801055f8:	68 a0 55 11 80       	push   $0x801155a0
801055fd:	e8 1e e7 ff ff       	call   80103d20 <sleep>
80105602:	a1 a0 55 11 80       	mov    0x801155a0,%eax
80105607:	83 c4 10             	add    $0x10,%esp
8010560a:	29 d8                	sub    %ebx,%eax
8010560c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010560f:	73 2f                	jae    80105640 <sys_sleep+0x90>
80105611:	e8 5a e1 ff ff       	call   80103770 <myproc>
80105616:	8b 40 24             	mov    0x24(%eax),%eax
80105619:	85 c0                	test   %eax,%eax
8010561b:	74 d3                	je     801055f0 <sys_sleep+0x40>
8010561d:	83 ec 0c             	sub    $0xc,%esp
80105620:	68 60 4d 11 80       	push   $0x80114d60
80105625:	e8 86 ed ff ff       	call   801043b0 <release>
8010562a:	83 c4 10             	add    $0x10,%esp
8010562d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105632:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105635:	c9                   	leave  
80105636:	c3                   	ret    
80105637:	89 f6                	mov    %esi,%esi
80105639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105640:	83 ec 0c             	sub    $0xc,%esp
80105643:	68 60 4d 11 80       	push   $0x80114d60
80105648:	e8 63 ed ff ff       	call   801043b0 <release>
8010564d:	83 c4 10             	add    $0x10,%esp
80105650:	31 c0                	xor    %eax,%eax
80105652:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105655:	c9                   	leave  
80105656:	c3                   	ret    
80105657:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010565c:	eb d4                	jmp    80105632 <sys_sleep+0x82>
8010565e:	66 90                	xchg   %ax,%ax

80105660 <sys_uptime>:
80105660:	55                   	push   %ebp
80105661:	89 e5                	mov    %esp,%ebp
80105663:	53                   	push   %ebx
80105664:	83 ec 10             	sub    $0x10,%esp
80105667:	68 60 4d 11 80       	push   $0x80114d60
8010566c:	e8 1f ec ff ff       	call   80104290 <acquire>
80105671:	8b 1d a0 55 11 80    	mov    0x801155a0,%ebx
80105677:	c7 04 24 60 4d 11 80 	movl   $0x80114d60,(%esp)
8010567e:	e8 2d ed ff ff       	call   801043b0 <release>
80105683:	89 d8                	mov    %ebx,%eax
80105685:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105688:	c9                   	leave  
80105689:	c3                   	ret    

8010568a <alltraps>:
8010568a:	1e                   	push   %ds
8010568b:	06                   	push   %es
8010568c:	0f a0                	push   %fs
8010568e:	0f a8                	push   %gs
80105690:	60                   	pusha  
80105691:	66 b8 10 00          	mov    $0x10,%ax
80105695:	8e d8                	mov    %eax,%ds
80105697:	8e c0                	mov    %eax,%es
80105699:	54                   	push   %esp
8010569a:	e8 e1 00 00 00       	call   80105780 <trap>
8010569f:	83 c4 04             	add    $0x4,%esp

801056a2 <trapret>:
801056a2:	61                   	popa   
801056a3:	0f a9                	pop    %gs
801056a5:	0f a1                	pop    %fs
801056a7:	07                   	pop    %es
801056a8:	1f                   	pop    %ds
801056a9:	83 c4 08             	add    $0x8,%esp
801056ac:	cf                   	iret   
801056ad:	66 90                	xchg   %ax,%ax
801056af:	90                   	nop

801056b0 <tvinit>:
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
801056b0:	31 c0                	xor    %eax,%eax
801056b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
801056b8:	8b 14 85 08 a0 10 80 	mov    -0x7fef5ff8(,%eax,4),%edx
801056bf:	b9 08 00 00 00       	mov    $0x8,%ecx
801056c4:	c6 04 c5 a4 4d 11 80 	movb   $0x0,-0x7feeb25c(,%eax,8)
801056cb:	00 
801056cc:	66 89 0c c5 a2 4d 11 	mov    %cx,-0x7feeb25e(,%eax,8)
801056d3:	80 
801056d4:	c6 04 c5 a5 4d 11 80 	movb   $0x8e,-0x7feeb25b(,%eax,8)
801056db:	8e 
801056dc:	66 89 14 c5 a0 4d 11 	mov    %dx,-0x7feeb260(,%eax,8)
801056e3:	80 
801056e4:	c1 ea 10             	shr    $0x10,%edx
801056e7:	66 89 14 c5 a6 4d 11 	mov    %dx,-0x7feeb25a(,%eax,8)
801056ee:	80 
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
801056ef:	83 c0 01             	add    $0x1,%eax
801056f2:	3d 00 01 00 00       	cmp    $0x100,%eax
801056f7:	75 bf                	jne    801056b8 <tvinit+0x8>
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
801056f9:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
801056fa:	ba 08 00 00 00       	mov    $0x8,%edx
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
801056ff:	89 e5                	mov    %esp,%ebp
80105701:	83 ec 10             	sub    $0x10,%esp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105704:	a1 08 a1 10 80       	mov    0x8010a108,%eax

  initlock(&tickslock, "time");
80105709:	68 c1 77 10 80       	push   $0x801077c1
8010570e:	68 60 4d 11 80       	push   $0x80114d60
{
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105713:	66 89 15 a2 4f 11 80 	mov    %dx,0x80114fa2
8010571a:	c6 05 a4 4f 11 80 00 	movb   $0x0,0x80114fa4
80105721:	66 a3 a0 4f 11 80    	mov    %ax,0x80114fa0
80105727:	c1 e8 10             	shr    $0x10,%eax
8010572a:	c6 05 a5 4f 11 80 ef 	movb   $0xef,0x80114fa5
80105731:	66 a3 a6 4f 11 80    	mov    %ax,0x80114fa6

  initlock(&tickslock, "time");
80105737:	e8 54 ea ff ff       	call   80104190 <initlock>
}
8010573c:	83 c4 10             	add    $0x10,%esp
8010573f:	c9                   	leave  
80105740:	c3                   	ret    
80105741:	eb 0d                	jmp    80105750 <idtinit>
80105743:	90                   	nop
80105744:	90                   	nop
80105745:	90                   	nop
80105746:	90                   	nop
80105747:	90                   	nop
80105748:	90                   	nop
80105749:	90                   	nop
8010574a:	90                   	nop
8010574b:	90                   	nop
8010574c:	90                   	nop
8010574d:	90                   	nop
8010574e:	90                   	nop
8010574f:	90                   	nop

80105750 <idtinit>:

void
idtinit(void)
{
80105750:	55                   	push   %ebp
static inline void
lidt(struct gatedesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
80105751:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105756:	89 e5                	mov    %esp,%ebp
80105758:	83 ec 10             	sub    $0x10,%esp
8010575b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
8010575f:	b8 a0 4d 11 80       	mov    $0x80114da0,%eax
80105764:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80105768:	c1 e8 10             	shr    $0x10,%eax
8010576b:	66 89 45 fe          	mov    %ax,-0x2(%ebp)

  asm volatile("lidt (%0)" : : "r" (pd));
8010576f:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105772:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105775:	c9                   	leave  
80105776:	c3                   	ret    
80105777:	89 f6                	mov    %esi,%esi
80105779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105780 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80105780:	55                   	push   %ebp
80105781:	89 e5                	mov    %esp,%ebp
80105783:	57                   	push   %edi
80105784:	56                   	push   %esi
80105785:	53                   	push   %ebx
80105786:	83 ec 1c             	sub    $0x1c,%esp
80105789:	8b 7d 08             	mov    0x8(%ebp),%edi
  if(tf->trapno == T_SYSCALL){
8010578c:	8b 47 30             	mov    0x30(%edi),%eax
8010578f:	83 f8 40             	cmp    $0x40,%eax
80105792:	0f 84 e8 01 00 00    	je     80105980 <trap+0x200>
    if(myproc()->killed)
      exit();
    return;
  }

  switch(tf->trapno){
80105798:	83 e8 0e             	sub    $0xe,%eax
8010579b:	83 f8 31             	cmp    $0x31,%eax
8010579e:	77 10                	ja     801057b0 <trap+0x30>
801057a0:	ff 24 85 68 78 10 80 	jmp    *-0x7fef8798(,%eax,4)
801057a7:	89 f6                	mov    %esi,%esi
801057a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
801057b0:	e8 bb df ff ff       	call   80103770 <myproc>
801057b5:	85 c0                	test   %eax,%eax
801057b7:	0f 84 37 02 00 00    	je     801059f4 <trap+0x274>
801057bd:	f6 47 3c 03          	testb  $0x3,0x3c(%edi)
801057c1:	0f 84 2d 02 00 00    	je     801059f4 <trap+0x274>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
801057c7:	0f 20 d1             	mov    %cr2,%ecx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801057ca:	8b 57 38             	mov    0x38(%edi),%edx
801057cd:	89 4d d8             	mov    %ecx,-0x28(%ebp)
801057d0:	89 55 dc             	mov    %edx,-0x24(%ebp)
801057d3:	e8 78 df ff ff       	call   80103750 <cpuid>
801057d8:	8b 77 34             	mov    0x34(%edi),%esi
801057db:	8b 5f 30             	mov    0x30(%edi),%ebx
801057de:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
801057e1:	e8 8a df ff ff       	call   80103770 <myproc>
801057e6:	89 45 e0             	mov    %eax,-0x20(%ebp)
801057e9:	e8 82 df ff ff       	call   80103770 <myproc>
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801057ee:	8b 4d d8             	mov    -0x28(%ebp),%ecx
801057f1:	8b 55 dc             	mov    -0x24(%ebp),%edx
801057f4:	51                   	push   %ecx
801057f5:	52                   	push   %edx
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
801057f6:	8b 55 e0             	mov    -0x20(%ebp),%edx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801057f9:	ff 75 e4             	pushl  -0x1c(%ebp)
801057fc:	56                   	push   %esi
801057fd:	53                   	push   %ebx
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
801057fe:	83 c2 6c             	add    $0x6c,%edx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105801:	52                   	push   %edx
80105802:	ff 70 10             	pushl  0x10(%eax)
80105805:	68 24 78 10 80       	push   $0x80107824
8010580a:	e8 51 ae ff ff       	call   80100660 <cprintf>
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
            tf->err, cpuid(), tf->eip, rcr2());
    myproc()->killed = 1;
8010580f:	83 c4 20             	add    $0x20,%esp
80105812:	e8 59 df ff ff       	call   80103770 <myproc>
80105817:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
8010581e:	66 90                	xchg   %ax,%ax
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105820:	e8 4b df ff ff       	call   80103770 <myproc>
80105825:	85 c0                	test   %eax,%eax
80105827:	74 0c                	je     80105835 <trap+0xb5>
80105829:	e8 42 df ff ff       	call   80103770 <myproc>
8010582e:	8b 50 24             	mov    0x24(%eax),%edx
80105831:	85 d2                	test   %edx,%edx
80105833:	75 4b                	jne    80105880 <trap+0x100>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
80105835:	e8 36 df ff ff       	call   80103770 <myproc>
8010583a:	85 c0                	test   %eax,%eax
8010583c:	74 0b                	je     80105849 <trap+0xc9>
8010583e:	e8 2d df ff ff       	call   80103770 <myproc>
80105843:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105847:	74 4f                	je     80105898 <trap+0x118>
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105849:	e8 22 df ff ff       	call   80103770 <myproc>
8010584e:	85 c0                	test   %eax,%eax
80105850:	74 1d                	je     8010586f <trap+0xef>
80105852:	e8 19 df ff ff       	call   80103770 <myproc>
80105857:	8b 40 24             	mov    0x24(%eax),%eax
8010585a:	85 c0                	test   %eax,%eax
8010585c:	74 11                	je     8010586f <trap+0xef>
8010585e:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105862:	83 e0 03             	and    $0x3,%eax
80105865:	66 83 f8 03          	cmp    $0x3,%ax
80105869:	0f 84 3a 01 00 00    	je     801059a9 <trap+0x229>
    exit();
}
8010586f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105872:	5b                   	pop    %ebx
80105873:	5e                   	pop    %esi
80105874:	5f                   	pop    %edi
80105875:	5d                   	pop    %ebp
80105876:	c3                   	ret    
80105877:	89 f6                	mov    %esi,%esi
80105879:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105880:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105884:	83 e0 03             	and    $0x3,%eax
80105887:	66 83 f8 03          	cmp    $0x3,%ax
8010588b:	75 a8                	jne    80105835 <trap+0xb5>
    exit();
8010588d:	e8 0e e3 ff ff       	call   80103ba0 <exit>
80105892:	eb a1                	jmp    80105835 <trap+0xb5>
80105894:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
80105898:	83 7f 30 20          	cmpl   $0x20,0x30(%edi)
8010589c:	75 ab                	jne    80105849 <trap+0xc9>
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();
8010589e:	e8 2d e4 ff ff       	call   80103cd0 <yield>
801058a3:	eb a4                	jmp    80105849 <trap+0xc9>
801058a5:	8d 76 00             	lea    0x0(%esi),%esi
801058a8:	0f 20 d3             	mov    %cr2,%ebx
      release(&tickslock);
    }
    lapiceoi();
    break;
  case T_PGFLT:
     if(rcr2() != STACKBASE + (PGSIZE * myproc()->pages) + PGSIZE)
801058ab:	e8 c0 de ff ff       	call   80103770 <myproc>
801058b0:	8b 40 7c             	mov    0x7c(%eax),%eax
801058b3:	c1 e0 0c             	shl    $0xc,%eax
801058b6:	2d 01 f0 ff 7f       	sub    $0x7ffff001,%eax
801058bb:	39 d8                	cmp    %ebx,%eax
801058bd:	0f 85 5d ff ff ff    	jne    80105820 <trap+0xa0>
       break;
     //myproc()->pages += 1;
     allocuvm(myproc()->pgdir, myproc()->sz, myproc()->sz+PGSIZE);
801058c3:	e8 a8 de ff ff       	call   80103770 <myproc>
801058c8:	8b 18                	mov    (%eax),%ebx
801058ca:	e8 a1 de ff ff       	call   80103770 <myproc>
801058cf:	8b 30                	mov    (%eax),%esi
801058d1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801058d7:	e8 94 de ff ff       	call   80103770 <myproc>
801058dc:	83 ec 04             	sub    $0x4,%esp
801058df:	53                   	push   %ebx
801058e0:	56                   	push   %esi
801058e1:	ff 70 04             	pushl  0x4(%eax)
801058e4:	e8 57 12 00 00       	call   80106b40 <allocuvm>
     myproc()->pages += 1;
801058e9:	e8 82 de ff ff       	call   80103770 <myproc>
     break;
801058ee:	83 c4 10             	add    $0x10,%esp
  case T_PGFLT:
     if(rcr2() != STACKBASE + (PGSIZE * myproc()->pages) + PGSIZE)
       break;
     //myproc()->pages += 1;
     allocuvm(myproc()->pgdir, myproc()->sz, myproc()->sz+PGSIZE);
     myproc()->pages += 1;
801058f1:	83 40 7c 01          	addl   $0x1,0x7c(%eax)
     break;
801058f5:	e9 26 ff ff ff       	jmp    80105820 <trap+0xa0>
801058fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return;
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpuid() == 0){
80105900:	e8 4b de ff ff       	call   80103750 <cpuid>
80105905:	85 c0                	test   %eax,%eax
80105907:	0f 84 b3 00 00 00    	je     801059c0 <trap+0x240>
     allocuvm(myproc()->pgdir, myproc()->sz, myproc()->sz+PGSIZE);
     myproc()->pages += 1;
     break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
    lapiceoi();
8010590d:	e8 ee cd ff ff       	call   80102700 <lapiceoi>
    break;
80105912:	e9 09 ff ff ff       	jmp    80105820 <trap+0xa0>
80105917:	89 f6                	mov    %esi,%esi
80105919:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
80105920:	e8 9b cc ff ff       	call   801025c0 <kbdintr>
    lapiceoi();
80105925:	e8 d6 cd ff ff       	call   80102700 <lapiceoi>
    break;
8010592a:	e9 f1 fe ff ff       	jmp    80105820 <trap+0xa0>
8010592f:	90                   	nop
  case T_IRQ0 + IRQ_COM1:
    uartintr();
80105930:	e8 5b 02 00 00       	call   80105b90 <uartintr>
    lapiceoi();
80105935:	e8 c6 cd ff ff       	call   80102700 <lapiceoi>
    break;
8010593a:	e9 e1 fe ff ff       	jmp    80105820 <trap+0xa0>
8010593f:	90                   	nop
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80105940:	0f b7 5f 3c          	movzwl 0x3c(%edi),%ebx
80105944:	8b 77 38             	mov    0x38(%edi),%esi
80105947:	e8 04 de ff ff       	call   80103750 <cpuid>
8010594c:	56                   	push   %esi
8010594d:	53                   	push   %ebx
8010594e:	50                   	push   %eax
8010594f:	68 cc 77 10 80       	push   $0x801077cc
80105954:	e8 07 ad ff ff       	call   80100660 <cprintf>
            cpuid(), tf->cs, tf->eip);
    lapiceoi();
80105959:	e8 a2 cd ff ff       	call   80102700 <lapiceoi>
    break;
8010595e:	83 c4 10             	add    $0x10,%esp
80105961:	e9 ba fe ff ff       	jmp    80105820 <trap+0xa0>
80105966:	8d 76 00             	lea    0x0(%esi),%esi
80105969:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     //myproc()->pages += 1;
     allocuvm(myproc()->pgdir, myproc()->sz, myproc()->sz+PGSIZE);
     myproc()->pages += 1;
     break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
80105970:	e8 cb c6 ff ff       	call   80102040 <ideintr>
80105975:	eb 96                	jmp    8010590d <trap+0x18d>
80105977:	89 f6                	mov    %esi,%esi
80105979:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(myproc()->killed)
80105980:	e8 eb dd ff ff       	call   80103770 <myproc>
80105985:	8b 58 24             	mov    0x24(%eax),%ebx
80105988:	85 db                	test   %ebx,%ebx
8010598a:	75 2c                	jne    801059b8 <trap+0x238>
      exit();
    myproc()->tf = tf;
8010598c:	e8 df dd ff ff       	call   80103770 <myproc>
80105991:	89 78 18             	mov    %edi,0x18(%eax)
    syscall();
80105994:	e8 67 ee ff ff       	call   80104800 <syscall>
    if(myproc()->killed)
80105999:	e8 d2 dd ff ff       	call   80103770 <myproc>
8010599e:	8b 48 24             	mov    0x24(%eax),%ecx
801059a1:	85 c9                	test   %ecx,%ecx
801059a3:	0f 84 c6 fe ff ff    	je     8010586f <trap+0xef>
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
    exit();
}
801059a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801059ac:	5b                   	pop    %ebx
801059ad:	5e                   	pop    %esi
801059ae:	5f                   	pop    %edi
801059af:	5d                   	pop    %ebp
    if(myproc()->killed)
      exit();
    myproc()->tf = tf;
    syscall();
    if(myproc()->killed)
      exit();
801059b0:	e9 eb e1 ff ff       	jmp    80103ba0 <exit>
801059b5:	8d 76 00             	lea    0x0(%esi),%esi
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(myproc()->killed)
      exit();
801059b8:	e8 e3 e1 ff ff       	call   80103ba0 <exit>
801059bd:	eb cd                	jmp    8010598c <trap+0x20c>
801059bf:	90                   	nop
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpuid() == 0){
      acquire(&tickslock);
801059c0:	83 ec 0c             	sub    $0xc,%esp
801059c3:	68 60 4d 11 80       	push   $0x80114d60
801059c8:	e8 c3 e8 ff ff       	call   80104290 <acquire>
      ticks++;
      wakeup(&ticks);
801059cd:	c7 04 24 a0 55 11 80 	movl   $0x801155a0,(%esp)

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpuid() == 0){
      acquire(&tickslock);
      ticks++;
801059d4:	83 05 a0 55 11 80 01 	addl   $0x1,0x801155a0
      wakeup(&ticks);
801059db:	e8 f0 e4 ff ff       	call   80103ed0 <wakeup>
      release(&tickslock);
801059e0:	c7 04 24 60 4d 11 80 	movl   $0x80114d60,(%esp)
801059e7:	e8 c4 e9 ff ff       	call   801043b0 <release>
801059ec:	83 c4 10             	add    $0x10,%esp
801059ef:	e9 19 ff ff ff       	jmp    8010590d <trap+0x18d>
801059f4:	0f 20 d6             	mov    %cr2,%esi

  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
801059f7:	8b 5f 38             	mov    0x38(%edi),%ebx
801059fa:	e8 51 dd ff ff       	call   80103750 <cpuid>
801059ff:	83 ec 0c             	sub    $0xc,%esp
80105a02:	56                   	push   %esi
80105a03:	53                   	push   %ebx
80105a04:	50                   	push   %eax
80105a05:	ff 77 30             	pushl  0x30(%edi)
80105a08:	68 f0 77 10 80       	push   $0x801077f0
80105a0d:	e8 4e ac ff ff       	call   80100660 <cprintf>
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
80105a12:	83 c4 14             	add    $0x14,%esp
80105a15:	68 c6 77 10 80       	push   $0x801077c6
80105a1a:	e8 51 a9 ff ff       	call   80100370 <panic>
80105a1f:	90                   	nop

80105a20 <uartgetc>:
80105a20:	a1 bc a5 10 80       	mov    0x8010a5bc,%eax
80105a25:	55                   	push   %ebp
80105a26:	89 e5                	mov    %esp,%ebp
80105a28:	85 c0                	test   %eax,%eax
80105a2a:	74 1c                	je     80105a48 <uartgetc+0x28>
80105a2c:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105a31:	ec                   	in     (%dx),%al
80105a32:	a8 01                	test   $0x1,%al
80105a34:	74 12                	je     80105a48 <uartgetc+0x28>
80105a36:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105a3b:	ec                   	in     (%dx),%al
80105a3c:	0f b6 c0             	movzbl %al,%eax
80105a3f:	5d                   	pop    %ebp
80105a40:	c3                   	ret    
80105a41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105a48:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105a4d:	5d                   	pop    %ebp
80105a4e:	c3                   	ret    
80105a4f:	90                   	nop

80105a50 <uartputc.part.0>:
80105a50:	55                   	push   %ebp
80105a51:	89 e5                	mov    %esp,%ebp
80105a53:	57                   	push   %edi
80105a54:	56                   	push   %esi
80105a55:	53                   	push   %ebx
80105a56:	89 c7                	mov    %eax,%edi
80105a58:	bb 80 00 00 00       	mov    $0x80,%ebx
80105a5d:	be fd 03 00 00       	mov    $0x3fd,%esi
80105a62:	83 ec 0c             	sub    $0xc,%esp
80105a65:	eb 1b                	jmp    80105a82 <uartputc.part.0+0x32>
80105a67:	89 f6                	mov    %esi,%esi
80105a69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105a70:	83 ec 0c             	sub    $0xc,%esp
80105a73:	6a 0a                	push   $0xa
80105a75:	e8 a6 cc ff ff       	call   80102720 <microdelay>
80105a7a:	83 c4 10             	add    $0x10,%esp
80105a7d:	83 eb 01             	sub    $0x1,%ebx
80105a80:	74 07                	je     80105a89 <uartputc.part.0+0x39>
80105a82:	89 f2                	mov    %esi,%edx
80105a84:	ec                   	in     (%dx),%al
80105a85:	a8 20                	test   $0x20,%al
80105a87:	74 e7                	je     80105a70 <uartputc.part.0+0x20>
80105a89:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105a8e:	89 f8                	mov    %edi,%eax
80105a90:	ee                   	out    %al,(%dx)
80105a91:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105a94:	5b                   	pop    %ebx
80105a95:	5e                   	pop    %esi
80105a96:	5f                   	pop    %edi
80105a97:	5d                   	pop    %ebp
80105a98:	c3                   	ret    
80105a99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105aa0 <uartinit>:
80105aa0:	55                   	push   %ebp
80105aa1:	31 c9                	xor    %ecx,%ecx
80105aa3:	89 c8                	mov    %ecx,%eax
80105aa5:	89 e5                	mov    %esp,%ebp
80105aa7:	57                   	push   %edi
80105aa8:	56                   	push   %esi
80105aa9:	53                   	push   %ebx
80105aaa:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105aaf:	89 da                	mov    %ebx,%edx
80105ab1:	83 ec 0c             	sub    $0xc,%esp
80105ab4:	ee                   	out    %al,(%dx)
80105ab5:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105aba:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105abf:	89 fa                	mov    %edi,%edx
80105ac1:	ee                   	out    %al,(%dx)
80105ac2:	b8 0c 00 00 00       	mov    $0xc,%eax
80105ac7:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105acc:	ee                   	out    %al,(%dx)
80105acd:	be f9 03 00 00       	mov    $0x3f9,%esi
80105ad2:	89 c8                	mov    %ecx,%eax
80105ad4:	89 f2                	mov    %esi,%edx
80105ad6:	ee                   	out    %al,(%dx)
80105ad7:	b8 03 00 00 00       	mov    $0x3,%eax
80105adc:	89 fa                	mov    %edi,%edx
80105ade:	ee                   	out    %al,(%dx)
80105adf:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105ae4:	89 c8                	mov    %ecx,%eax
80105ae6:	ee                   	out    %al,(%dx)
80105ae7:	b8 01 00 00 00       	mov    $0x1,%eax
80105aec:	89 f2                	mov    %esi,%edx
80105aee:	ee                   	out    %al,(%dx)
80105aef:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105af4:	ec                   	in     (%dx),%al
80105af5:	3c ff                	cmp    $0xff,%al
80105af7:	74 5a                	je     80105b53 <uartinit+0xb3>
80105af9:	c7 05 bc a5 10 80 01 	movl   $0x1,0x8010a5bc
80105b00:	00 00 00 
80105b03:	89 da                	mov    %ebx,%edx
80105b05:	ec                   	in     (%dx),%al
80105b06:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105b0b:	ec                   	in     (%dx),%al
80105b0c:	83 ec 08             	sub    $0x8,%esp
80105b0f:	bb 30 79 10 80       	mov    $0x80107930,%ebx
80105b14:	6a 00                	push   $0x0
80105b16:	6a 04                	push   $0x4
80105b18:	e8 73 c7 ff ff       	call   80102290 <ioapicenable>
80105b1d:	83 c4 10             	add    $0x10,%esp
80105b20:	b8 78 00 00 00       	mov    $0x78,%eax
80105b25:	eb 13                	jmp    80105b3a <uartinit+0x9a>
80105b27:	89 f6                	mov    %esi,%esi
80105b29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105b30:	83 c3 01             	add    $0x1,%ebx
80105b33:	0f be 03             	movsbl (%ebx),%eax
80105b36:	84 c0                	test   %al,%al
80105b38:	74 19                	je     80105b53 <uartinit+0xb3>
80105b3a:	8b 15 bc a5 10 80    	mov    0x8010a5bc,%edx
80105b40:	85 d2                	test   %edx,%edx
80105b42:	74 ec                	je     80105b30 <uartinit+0x90>
80105b44:	83 c3 01             	add    $0x1,%ebx
80105b47:	e8 04 ff ff ff       	call   80105a50 <uartputc.part.0>
80105b4c:	0f be 03             	movsbl (%ebx),%eax
80105b4f:	84 c0                	test   %al,%al
80105b51:	75 e7                	jne    80105b3a <uartinit+0x9a>
80105b53:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105b56:	5b                   	pop    %ebx
80105b57:	5e                   	pop    %esi
80105b58:	5f                   	pop    %edi
80105b59:	5d                   	pop    %ebp
80105b5a:	c3                   	ret    
80105b5b:	90                   	nop
80105b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105b60 <uartputc>:
80105b60:	8b 15 bc a5 10 80    	mov    0x8010a5bc,%edx
80105b66:	55                   	push   %ebp
80105b67:	89 e5                	mov    %esp,%ebp
80105b69:	85 d2                	test   %edx,%edx
80105b6b:	8b 45 08             	mov    0x8(%ebp),%eax
80105b6e:	74 10                	je     80105b80 <uartputc+0x20>
80105b70:	5d                   	pop    %ebp
80105b71:	e9 da fe ff ff       	jmp    80105a50 <uartputc.part.0>
80105b76:	8d 76 00             	lea    0x0(%esi),%esi
80105b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105b80:	5d                   	pop    %ebp
80105b81:	c3                   	ret    
80105b82:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105b90 <uartintr>:
80105b90:	55                   	push   %ebp
80105b91:	89 e5                	mov    %esp,%ebp
80105b93:	83 ec 14             	sub    $0x14,%esp
80105b96:	68 20 5a 10 80       	push   $0x80105a20
80105b9b:	e8 50 ac ff ff       	call   801007f0 <consoleintr>
80105ba0:	83 c4 10             	add    $0x10,%esp
80105ba3:	c9                   	leave  
80105ba4:	c3                   	ret    

80105ba5 <vector0>:
80105ba5:	6a 00                	push   $0x0
80105ba7:	6a 00                	push   $0x0
80105ba9:	e9 dc fa ff ff       	jmp    8010568a <alltraps>

80105bae <vector1>:
80105bae:	6a 00                	push   $0x0
80105bb0:	6a 01                	push   $0x1
80105bb2:	e9 d3 fa ff ff       	jmp    8010568a <alltraps>

80105bb7 <vector2>:
80105bb7:	6a 00                	push   $0x0
80105bb9:	6a 02                	push   $0x2
80105bbb:	e9 ca fa ff ff       	jmp    8010568a <alltraps>

80105bc0 <vector3>:
80105bc0:	6a 00                	push   $0x0
80105bc2:	6a 03                	push   $0x3
80105bc4:	e9 c1 fa ff ff       	jmp    8010568a <alltraps>

80105bc9 <vector4>:
80105bc9:	6a 00                	push   $0x0
80105bcb:	6a 04                	push   $0x4
80105bcd:	e9 b8 fa ff ff       	jmp    8010568a <alltraps>

80105bd2 <vector5>:
80105bd2:	6a 00                	push   $0x0
80105bd4:	6a 05                	push   $0x5
80105bd6:	e9 af fa ff ff       	jmp    8010568a <alltraps>

80105bdb <vector6>:
80105bdb:	6a 00                	push   $0x0
80105bdd:	6a 06                	push   $0x6
80105bdf:	e9 a6 fa ff ff       	jmp    8010568a <alltraps>

80105be4 <vector7>:
80105be4:	6a 00                	push   $0x0
80105be6:	6a 07                	push   $0x7
80105be8:	e9 9d fa ff ff       	jmp    8010568a <alltraps>

80105bed <vector8>:
80105bed:	6a 08                	push   $0x8
80105bef:	e9 96 fa ff ff       	jmp    8010568a <alltraps>

80105bf4 <vector9>:
80105bf4:	6a 00                	push   $0x0
80105bf6:	6a 09                	push   $0x9
80105bf8:	e9 8d fa ff ff       	jmp    8010568a <alltraps>

80105bfd <vector10>:
80105bfd:	6a 0a                	push   $0xa
80105bff:	e9 86 fa ff ff       	jmp    8010568a <alltraps>

80105c04 <vector11>:
80105c04:	6a 0b                	push   $0xb
80105c06:	e9 7f fa ff ff       	jmp    8010568a <alltraps>

80105c0b <vector12>:
80105c0b:	6a 0c                	push   $0xc
80105c0d:	e9 78 fa ff ff       	jmp    8010568a <alltraps>

80105c12 <vector13>:
80105c12:	6a 0d                	push   $0xd
80105c14:	e9 71 fa ff ff       	jmp    8010568a <alltraps>

80105c19 <vector14>:
80105c19:	6a 0e                	push   $0xe
80105c1b:	e9 6a fa ff ff       	jmp    8010568a <alltraps>

80105c20 <vector15>:
80105c20:	6a 00                	push   $0x0
80105c22:	6a 0f                	push   $0xf
80105c24:	e9 61 fa ff ff       	jmp    8010568a <alltraps>

80105c29 <vector16>:
80105c29:	6a 00                	push   $0x0
80105c2b:	6a 10                	push   $0x10
80105c2d:	e9 58 fa ff ff       	jmp    8010568a <alltraps>

80105c32 <vector17>:
80105c32:	6a 11                	push   $0x11
80105c34:	e9 51 fa ff ff       	jmp    8010568a <alltraps>

80105c39 <vector18>:
80105c39:	6a 00                	push   $0x0
80105c3b:	6a 12                	push   $0x12
80105c3d:	e9 48 fa ff ff       	jmp    8010568a <alltraps>

80105c42 <vector19>:
80105c42:	6a 00                	push   $0x0
80105c44:	6a 13                	push   $0x13
80105c46:	e9 3f fa ff ff       	jmp    8010568a <alltraps>

80105c4b <vector20>:
80105c4b:	6a 00                	push   $0x0
80105c4d:	6a 14                	push   $0x14
80105c4f:	e9 36 fa ff ff       	jmp    8010568a <alltraps>

80105c54 <vector21>:
80105c54:	6a 00                	push   $0x0
80105c56:	6a 15                	push   $0x15
80105c58:	e9 2d fa ff ff       	jmp    8010568a <alltraps>

80105c5d <vector22>:
80105c5d:	6a 00                	push   $0x0
80105c5f:	6a 16                	push   $0x16
80105c61:	e9 24 fa ff ff       	jmp    8010568a <alltraps>

80105c66 <vector23>:
80105c66:	6a 00                	push   $0x0
80105c68:	6a 17                	push   $0x17
80105c6a:	e9 1b fa ff ff       	jmp    8010568a <alltraps>

80105c6f <vector24>:
80105c6f:	6a 00                	push   $0x0
80105c71:	6a 18                	push   $0x18
80105c73:	e9 12 fa ff ff       	jmp    8010568a <alltraps>

80105c78 <vector25>:
80105c78:	6a 00                	push   $0x0
80105c7a:	6a 19                	push   $0x19
80105c7c:	e9 09 fa ff ff       	jmp    8010568a <alltraps>

80105c81 <vector26>:
80105c81:	6a 00                	push   $0x0
80105c83:	6a 1a                	push   $0x1a
80105c85:	e9 00 fa ff ff       	jmp    8010568a <alltraps>

80105c8a <vector27>:
80105c8a:	6a 00                	push   $0x0
80105c8c:	6a 1b                	push   $0x1b
80105c8e:	e9 f7 f9 ff ff       	jmp    8010568a <alltraps>

80105c93 <vector28>:
80105c93:	6a 00                	push   $0x0
80105c95:	6a 1c                	push   $0x1c
80105c97:	e9 ee f9 ff ff       	jmp    8010568a <alltraps>

80105c9c <vector29>:
80105c9c:	6a 00                	push   $0x0
80105c9e:	6a 1d                	push   $0x1d
80105ca0:	e9 e5 f9 ff ff       	jmp    8010568a <alltraps>

80105ca5 <vector30>:
80105ca5:	6a 00                	push   $0x0
80105ca7:	6a 1e                	push   $0x1e
80105ca9:	e9 dc f9 ff ff       	jmp    8010568a <alltraps>

80105cae <vector31>:
80105cae:	6a 00                	push   $0x0
80105cb0:	6a 1f                	push   $0x1f
80105cb2:	e9 d3 f9 ff ff       	jmp    8010568a <alltraps>

80105cb7 <vector32>:
80105cb7:	6a 00                	push   $0x0
80105cb9:	6a 20                	push   $0x20
80105cbb:	e9 ca f9 ff ff       	jmp    8010568a <alltraps>

80105cc0 <vector33>:
80105cc0:	6a 00                	push   $0x0
80105cc2:	6a 21                	push   $0x21
80105cc4:	e9 c1 f9 ff ff       	jmp    8010568a <alltraps>

80105cc9 <vector34>:
80105cc9:	6a 00                	push   $0x0
80105ccb:	6a 22                	push   $0x22
80105ccd:	e9 b8 f9 ff ff       	jmp    8010568a <alltraps>

80105cd2 <vector35>:
80105cd2:	6a 00                	push   $0x0
80105cd4:	6a 23                	push   $0x23
80105cd6:	e9 af f9 ff ff       	jmp    8010568a <alltraps>

80105cdb <vector36>:
80105cdb:	6a 00                	push   $0x0
80105cdd:	6a 24                	push   $0x24
80105cdf:	e9 a6 f9 ff ff       	jmp    8010568a <alltraps>

80105ce4 <vector37>:
80105ce4:	6a 00                	push   $0x0
80105ce6:	6a 25                	push   $0x25
80105ce8:	e9 9d f9 ff ff       	jmp    8010568a <alltraps>

80105ced <vector38>:
80105ced:	6a 00                	push   $0x0
80105cef:	6a 26                	push   $0x26
80105cf1:	e9 94 f9 ff ff       	jmp    8010568a <alltraps>

80105cf6 <vector39>:
80105cf6:	6a 00                	push   $0x0
80105cf8:	6a 27                	push   $0x27
80105cfa:	e9 8b f9 ff ff       	jmp    8010568a <alltraps>

80105cff <vector40>:
80105cff:	6a 00                	push   $0x0
80105d01:	6a 28                	push   $0x28
80105d03:	e9 82 f9 ff ff       	jmp    8010568a <alltraps>

80105d08 <vector41>:
80105d08:	6a 00                	push   $0x0
80105d0a:	6a 29                	push   $0x29
80105d0c:	e9 79 f9 ff ff       	jmp    8010568a <alltraps>

80105d11 <vector42>:
80105d11:	6a 00                	push   $0x0
80105d13:	6a 2a                	push   $0x2a
80105d15:	e9 70 f9 ff ff       	jmp    8010568a <alltraps>

80105d1a <vector43>:
80105d1a:	6a 00                	push   $0x0
80105d1c:	6a 2b                	push   $0x2b
80105d1e:	e9 67 f9 ff ff       	jmp    8010568a <alltraps>

80105d23 <vector44>:
80105d23:	6a 00                	push   $0x0
80105d25:	6a 2c                	push   $0x2c
80105d27:	e9 5e f9 ff ff       	jmp    8010568a <alltraps>

80105d2c <vector45>:
80105d2c:	6a 00                	push   $0x0
80105d2e:	6a 2d                	push   $0x2d
80105d30:	e9 55 f9 ff ff       	jmp    8010568a <alltraps>

80105d35 <vector46>:
80105d35:	6a 00                	push   $0x0
80105d37:	6a 2e                	push   $0x2e
80105d39:	e9 4c f9 ff ff       	jmp    8010568a <alltraps>

80105d3e <vector47>:
80105d3e:	6a 00                	push   $0x0
80105d40:	6a 2f                	push   $0x2f
80105d42:	e9 43 f9 ff ff       	jmp    8010568a <alltraps>

80105d47 <vector48>:
80105d47:	6a 00                	push   $0x0
80105d49:	6a 30                	push   $0x30
80105d4b:	e9 3a f9 ff ff       	jmp    8010568a <alltraps>

80105d50 <vector49>:
80105d50:	6a 00                	push   $0x0
80105d52:	6a 31                	push   $0x31
80105d54:	e9 31 f9 ff ff       	jmp    8010568a <alltraps>

80105d59 <vector50>:
80105d59:	6a 00                	push   $0x0
80105d5b:	6a 32                	push   $0x32
80105d5d:	e9 28 f9 ff ff       	jmp    8010568a <alltraps>

80105d62 <vector51>:
80105d62:	6a 00                	push   $0x0
80105d64:	6a 33                	push   $0x33
80105d66:	e9 1f f9 ff ff       	jmp    8010568a <alltraps>

80105d6b <vector52>:
80105d6b:	6a 00                	push   $0x0
80105d6d:	6a 34                	push   $0x34
80105d6f:	e9 16 f9 ff ff       	jmp    8010568a <alltraps>

80105d74 <vector53>:
80105d74:	6a 00                	push   $0x0
80105d76:	6a 35                	push   $0x35
80105d78:	e9 0d f9 ff ff       	jmp    8010568a <alltraps>

80105d7d <vector54>:
80105d7d:	6a 00                	push   $0x0
80105d7f:	6a 36                	push   $0x36
80105d81:	e9 04 f9 ff ff       	jmp    8010568a <alltraps>

80105d86 <vector55>:
80105d86:	6a 00                	push   $0x0
80105d88:	6a 37                	push   $0x37
80105d8a:	e9 fb f8 ff ff       	jmp    8010568a <alltraps>

80105d8f <vector56>:
80105d8f:	6a 00                	push   $0x0
80105d91:	6a 38                	push   $0x38
80105d93:	e9 f2 f8 ff ff       	jmp    8010568a <alltraps>

80105d98 <vector57>:
80105d98:	6a 00                	push   $0x0
80105d9a:	6a 39                	push   $0x39
80105d9c:	e9 e9 f8 ff ff       	jmp    8010568a <alltraps>

80105da1 <vector58>:
80105da1:	6a 00                	push   $0x0
80105da3:	6a 3a                	push   $0x3a
80105da5:	e9 e0 f8 ff ff       	jmp    8010568a <alltraps>

80105daa <vector59>:
80105daa:	6a 00                	push   $0x0
80105dac:	6a 3b                	push   $0x3b
80105dae:	e9 d7 f8 ff ff       	jmp    8010568a <alltraps>

80105db3 <vector60>:
80105db3:	6a 00                	push   $0x0
80105db5:	6a 3c                	push   $0x3c
80105db7:	e9 ce f8 ff ff       	jmp    8010568a <alltraps>

80105dbc <vector61>:
80105dbc:	6a 00                	push   $0x0
80105dbe:	6a 3d                	push   $0x3d
80105dc0:	e9 c5 f8 ff ff       	jmp    8010568a <alltraps>

80105dc5 <vector62>:
80105dc5:	6a 00                	push   $0x0
80105dc7:	6a 3e                	push   $0x3e
80105dc9:	e9 bc f8 ff ff       	jmp    8010568a <alltraps>

80105dce <vector63>:
80105dce:	6a 00                	push   $0x0
80105dd0:	6a 3f                	push   $0x3f
80105dd2:	e9 b3 f8 ff ff       	jmp    8010568a <alltraps>

80105dd7 <vector64>:
80105dd7:	6a 00                	push   $0x0
80105dd9:	6a 40                	push   $0x40
80105ddb:	e9 aa f8 ff ff       	jmp    8010568a <alltraps>

80105de0 <vector65>:
80105de0:	6a 00                	push   $0x0
80105de2:	6a 41                	push   $0x41
80105de4:	e9 a1 f8 ff ff       	jmp    8010568a <alltraps>

80105de9 <vector66>:
80105de9:	6a 00                	push   $0x0
80105deb:	6a 42                	push   $0x42
80105ded:	e9 98 f8 ff ff       	jmp    8010568a <alltraps>

80105df2 <vector67>:
80105df2:	6a 00                	push   $0x0
80105df4:	6a 43                	push   $0x43
80105df6:	e9 8f f8 ff ff       	jmp    8010568a <alltraps>

80105dfb <vector68>:
80105dfb:	6a 00                	push   $0x0
80105dfd:	6a 44                	push   $0x44
80105dff:	e9 86 f8 ff ff       	jmp    8010568a <alltraps>

80105e04 <vector69>:
80105e04:	6a 00                	push   $0x0
80105e06:	6a 45                	push   $0x45
80105e08:	e9 7d f8 ff ff       	jmp    8010568a <alltraps>

80105e0d <vector70>:
80105e0d:	6a 00                	push   $0x0
80105e0f:	6a 46                	push   $0x46
80105e11:	e9 74 f8 ff ff       	jmp    8010568a <alltraps>

80105e16 <vector71>:
80105e16:	6a 00                	push   $0x0
80105e18:	6a 47                	push   $0x47
80105e1a:	e9 6b f8 ff ff       	jmp    8010568a <alltraps>

80105e1f <vector72>:
80105e1f:	6a 00                	push   $0x0
80105e21:	6a 48                	push   $0x48
80105e23:	e9 62 f8 ff ff       	jmp    8010568a <alltraps>

80105e28 <vector73>:
80105e28:	6a 00                	push   $0x0
80105e2a:	6a 49                	push   $0x49
80105e2c:	e9 59 f8 ff ff       	jmp    8010568a <alltraps>

80105e31 <vector74>:
80105e31:	6a 00                	push   $0x0
80105e33:	6a 4a                	push   $0x4a
80105e35:	e9 50 f8 ff ff       	jmp    8010568a <alltraps>

80105e3a <vector75>:
80105e3a:	6a 00                	push   $0x0
80105e3c:	6a 4b                	push   $0x4b
80105e3e:	e9 47 f8 ff ff       	jmp    8010568a <alltraps>

80105e43 <vector76>:
80105e43:	6a 00                	push   $0x0
80105e45:	6a 4c                	push   $0x4c
80105e47:	e9 3e f8 ff ff       	jmp    8010568a <alltraps>

80105e4c <vector77>:
80105e4c:	6a 00                	push   $0x0
80105e4e:	6a 4d                	push   $0x4d
80105e50:	e9 35 f8 ff ff       	jmp    8010568a <alltraps>

80105e55 <vector78>:
80105e55:	6a 00                	push   $0x0
80105e57:	6a 4e                	push   $0x4e
80105e59:	e9 2c f8 ff ff       	jmp    8010568a <alltraps>

80105e5e <vector79>:
80105e5e:	6a 00                	push   $0x0
80105e60:	6a 4f                	push   $0x4f
80105e62:	e9 23 f8 ff ff       	jmp    8010568a <alltraps>

80105e67 <vector80>:
80105e67:	6a 00                	push   $0x0
80105e69:	6a 50                	push   $0x50
80105e6b:	e9 1a f8 ff ff       	jmp    8010568a <alltraps>

80105e70 <vector81>:
80105e70:	6a 00                	push   $0x0
80105e72:	6a 51                	push   $0x51
80105e74:	e9 11 f8 ff ff       	jmp    8010568a <alltraps>

80105e79 <vector82>:
80105e79:	6a 00                	push   $0x0
80105e7b:	6a 52                	push   $0x52
80105e7d:	e9 08 f8 ff ff       	jmp    8010568a <alltraps>

80105e82 <vector83>:
80105e82:	6a 00                	push   $0x0
80105e84:	6a 53                	push   $0x53
80105e86:	e9 ff f7 ff ff       	jmp    8010568a <alltraps>

80105e8b <vector84>:
80105e8b:	6a 00                	push   $0x0
80105e8d:	6a 54                	push   $0x54
80105e8f:	e9 f6 f7 ff ff       	jmp    8010568a <alltraps>

80105e94 <vector85>:
80105e94:	6a 00                	push   $0x0
80105e96:	6a 55                	push   $0x55
80105e98:	e9 ed f7 ff ff       	jmp    8010568a <alltraps>

80105e9d <vector86>:
80105e9d:	6a 00                	push   $0x0
80105e9f:	6a 56                	push   $0x56
80105ea1:	e9 e4 f7 ff ff       	jmp    8010568a <alltraps>

80105ea6 <vector87>:
80105ea6:	6a 00                	push   $0x0
80105ea8:	6a 57                	push   $0x57
80105eaa:	e9 db f7 ff ff       	jmp    8010568a <alltraps>

80105eaf <vector88>:
80105eaf:	6a 00                	push   $0x0
80105eb1:	6a 58                	push   $0x58
80105eb3:	e9 d2 f7 ff ff       	jmp    8010568a <alltraps>

80105eb8 <vector89>:
80105eb8:	6a 00                	push   $0x0
80105eba:	6a 59                	push   $0x59
80105ebc:	e9 c9 f7 ff ff       	jmp    8010568a <alltraps>

80105ec1 <vector90>:
80105ec1:	6a 00                	push   $0x0
80105ec3:	6a 5a                	push   $0x5a
80105ec5:	e9 c0 f7 ff ff       	jmp    8010568a <alltraps>

80105eca <vector91>:
80105eca:	6a 00                	push   $0x0
80105ecc:	6a 5b                	push   $0x5b
80105ece:	e9 b7 f7 ff ff       	jmp    8010568a <alltraps>

80105ed3 <vector92>:
80105ed3:	6a 00                	push   $0x0
80105ed5:	6a 5c                	push   $0x5c
80105ed7:	e9 ae f7 ff ff       	jmp    8010568a <alltraps>

80105edc <vector93>:
80105edc:	6a 00                	push   $0x0
80105ede:	6a 5d                	push   $0x5d
80105ee0:	e9 a5 f7 ff ff       	jmp    8010568a <alltraps>

80105ee5 <vector94>:
80105ee5:	6a 00                	push   $0x0
80105ee7:	6a 5e                	push   $0x5e
80105ee9:	e9 9c f7 ff ff       	jmp    8010568a <alltraps>

80105eee <vector95>:
80105eee:	6a 00                	push   $0x0
80105ef0:	6a 5f                	push   $0x5f
80105ef2:	e9 93 f7 ff ff       	jmp    8010568a <alltraps>

80105ef7 <vector96>:
80105ef7:	6a 00                	push   $0x0
80105ef9:	6a 60                	push   $0x60
80105efb:	e9 8a f7 ff ff       	jmp    8010568a <alltraps>

80105f00 <vector97>:
80105f00:	6a 00                	push   $0x0
80105f02:	6a 61                	push   $0x61
80105f04:	e9 81 f7 ff ff       	jmp    8010568a <alltraps>

80105f09 <vector98>:
80105f09:	6a 00                	push   $0x0
80105f0b:	6a 62                	push   $0x62
80105f0d:	e9 78 f7 ff ff       	jmp    8010568a <alltraps>

80105f12 <vector99>:
80105f12:	6a 00                	push   $0x0
80105f14:	6a 63                	push   $0x63
80105f16:	e9 6f f7 ff ff       	jmp    8010568a <alltraps>

80105f1b <vector100>:
80105f1b:	6a 00                	push   $0x0
80105f1d:	6a 64                	push   $0x64
80105f1f:	e9 66 f7 ff ff       	jmp    8010568a <alltraps>

80105f24 <vector101>:
80105f24:	6a 00                	push   $0x0
80105f26:	6a 65                	push   $0x65
80105f28:	e9 5d f7 ff ff       	jmp    8010568a <alltraps>

80105f2d <vector102>:
80105f2d:	6a 00                	push   $0x0
80105f2f:	6a 66                	push   $0x66
80105f31:	e9 54 f7 ff ff       	jmp    8010568a <alltraps>

80105f36 <vector103>:
80105f36:	6a 00                	push   $0x0
80105f38:	6a 67                	push   $0x67
80105f3a:	e9 4b f7 ff ff       	jmp    8010568a <alltraps>

80105f3f <vector104>:
80105f3f:	6a 00                	push   $0x0
80105f41:	6a 68                	push   $0x68
80105f43:	e9 42 f7 ff ff       	jmp    8010568a <alltraps>

80105f48 <vector105>:
80105f48:	6a 00                	push   $0x0
80105f4a:	6a 69                	push   $0x69
80105f4c:	e9 39 f7 ff ff       	jmp    8010568a <alltraps>

80105f51 <vector106>:
80105f51:	6a 00                	push   $0x0
80105f53:	6a 6a                	push   $0x6a
80105f55:	e9 30 f7 ff ff       	jmp    8010568a <alltraps>

80105f5a <vector107>:
80105f5a:	6a 00                	push   $0x0
80105f5c:	6a 6b                	push   $0x6b
80105f5e:	e9 27 f7 ff ff       	jmp    8010568a <alltraps>

80105f63 <vector108>:
80105f63:	6a 00                	push   $0x0
80105f65:	6a 6c                	push   $0x6c
80105f67:	e9 1e f7 ff ff       	jmp    8010568a <alltraps>

80105f6c <vector109>:
80105f6c:	6a 00                	push   $0x0
80105f6e:	6a 6d                	push   $0x6d
80105f70:	e9 15 f7 ff ff       	jmp    8010568a <alltraps>

80105f75 <vector110>:
80105f75:	6a 00                	push   $0x0
80105f77:	6a 6e                	push   $0x6e
80105f79:	e9 0c f7 ff ff       	jmp    8010568a <alltraps>

80105f7e <vector111>:
80105f7e:	6a 00                	push   $0x0
80105f80:	6a 6f                	push   $0x6f
80105f82:	e9 03 f7 ff ff       	jmp    8010568a <alltraps>

80105f87 <vector112>:
80105f87:	6a 00                	push   $0x0
80105f89:	6a 70                	push   $0x70
80105f8b:	e9 fa f6 ff ff       	jmp    8010568a <alltraps>

80105f90 <vector113>:
80105f90:	6a 00                	push   $0x0
80105f92:	6a 71                	push   $0x71
80105f94:	e9 f1 f6 ff ff       	jmp    8010568a <alltraps>

80105f99 <vector114>:
80105f99:	6a 00                	push   $0x0
80105f9b:	6a 72                	push   $0x72
80105f9d:	e9 e8 f6 ff ff       	jmp    8010568a <alltraps>

80105fa2 <vector115>:
80105fa2:	6a 00                	push   $0x0
80105fa4:	6a 73                	push   $0x73
80105fa6:	e9 df f6 ff ff       	jmp    8010568a <alltraps>

80105fab <vector116>:
80105fab:	6a 00                	push   $0x0
80105fad:	6a 74                	push   $0x74
80105faf:	e9 d6 f6 ff ff       	jmp    8010568a <alltraps>

80105fb4 <vector117>:
80105fb4:	6a 00                	push   $0x0
80105fb6:	6a 75                	push   $0x75
80105fb8:	e9 cd f6 ff ff       	jmp    8010568a <alltraps>

80105fbd <vector118>:
80105fbd:	6a 00                	push   $0x0
80105fbf:	6a 76                	push   $0x76
80105fc1:	e9 c4 f6 ff ff       	jmp    8010568a <alltraps>

80105fc6 <vector119>:
80105fc6:	6a 00                	push   $0x0
80105fc8:	6a 77                	push   $0x77
80105fca:	e9 bb f6 ff ff       	jmp    8010568a <alltraps>

80105fcf <vector120>:
80105fcf:	6a 00                	push   $0x0
80105fd1:	6a 78                	push   $0x78
80105fd3:	e9 b2 f6 ff ff       	jmp    8010568a <alltraps>

80105fd8 <vector121>:
80105fd8:	6a 00                	push   $0x0
80105fda:	6a 79                	push   $0x79
80105fdc:	e9 a9 f6 ff ff       	jmp    8010568a <alltraps>

80105fe1 <vector122>:
80105fe1:	6a 00                	push   $0x0
80105fe3:	6a 7a                	push   $0x7a
80105fe5:	e9 a0 f6 ff ff       	jmp    8010568a <alltraps>

80105fea <vector123>:
80105fea:	6a 00                	push   $0x0
80105fec:	6a 7b                	push   $0x7b
80105fee:	e9 97 f6 ff ff       	jmp    8010568a <alltraps>

80105ff3 <vector124>:
80105ff3:	6a 00                	push   $0x0
80105ff5:	6a 7c                	push   $0x7c
80105ff7:	e9 8e f6 ff ff       	jmp    8010568a <alltraps>

80105ffc <vector125>:
80105ffc:	6a 00                	push   $0x0
80105ffe:	6a 7d                	push   $0x7d
80106000:	e9 85 f6 ff ff       	jmp    8010568a <alltraps>

80106005 <vector126>:
80106005:	6a 00                	push   $0x0
80106007:	6a 7e                	push   $0x7e
80106009:	e9 7c f6 ff ff       	jmp    8010568a <alltraps>

8010600e <vector127>:
8010600e:	6a 00                	push   $0x0
80106010:	6a 7f                	push   $0x7f
80106012:	e9 73 f6 ff ff       	jmp    8010568a <alltraps>

80106017 <vector128>:
80106017:	6a 00                	push   $0x0
80106019:	68 80 00 00 00       	push   $0x80
8010601e:	e9 67 f6 ff ff       	jmp    8010568a <alltraps>

80106023 <vector129>:
80106023:	6a 00                	push   $0x0
80106025:	68 81 00 00 00       	push   $0x81
8010602a:	e9 5b f6 ff ff       	jmp    8010568a <alltraps>

8010602f <vector130>:
8010602f:	6a 00                	push   $0x0
80106031:	68 82 00 00 00       	push   $0x82
80106036:	e9 4f f6 ff ff       	jmp    8010568a <alltraps>

8010603b <vector131>:
8010603b:	6a 00                	push   $0x0
8010603d:	68 83 00 00 00       	push   $0x83
80106042:	e9 43 f6 ff ff       	jmp    8010568a <alltraps>

80106047 <vector132>:
80106047:	6a 00                	push   $0x0
80106049:	68 84 00 00 00       	push   $0x84
8010604e:	e9 37 f6 ff ff       	jmp    8010568a <alltraps>

80106053 <vector133>:
80106053:	6a 00                	push   $0x0
80106055:	68 85 00 00 00       	push   $0x85
8010605a:	e9 2b f6 ff ff       	jmp    8010568a <alltraps>

8010605f <vector134>:
8010605f:	6a 00                	push   $0x0
80106061:	68 86 00 00 00       	push   $0x86
80106066:	e9 1f f6 ff ff       	jmp    8010568a <alltraps>

8010606b <vector135>:
8010606b:	6a 00                	push   $0x0
8010606d:	68 87 00 00 00       	push   $0x87
80106072:	e9 13 f6 ff ff       	jmp    8010568a <alltraps>

80106077 <vector136>:
80106077:	6a 00                	push   $0x0
80106079:	68 88 00 00 00       	push   $0x88
8010607e:	e9 07 f6 ff ff       	jmp    8010568a <alltraps>

80106083 <vector137>:
80106083:	6a 00                	push   $0x0
80106085:	68 89 00 00 00       	push   $0x89
8010608a:	e9 fb f5 ff ff       	jmp    8010568a <alltraps>

8010608f <vector138>:
8010608f:	6a 00                	push   $0x0
80106091:	68 8a 00 00 00       	push   $0x8a
80106096:	e9 ef f5 ff ff       	jmp    8010568a <alltraps>

8010609b <vector139>:
8010609b:	6a 00                	push   $0x0
8010609d:	68 8b 00 00 00       	push   $0x8b
801060a2:	e9 e3 f5 ff ff       	jmp    8010568a <alltraps>

801060a7 <vector140>:
801060a7:	6a 00                	push   $0x0
801060a9:	68 8c 00 00 00       	push   $0x8c
801060ae:	e9 d7 f5 ff ff       	jmp    8010568a <alltraps>

801060b3 <vector141>:
801060b3:	6a 00                	push   $0x0
801060b5:	68 8d 00 00 00       	push   $0x8d
801060ba:	e9 cb f5 ff ff       	jmp    8010568a <alltraps>

801060bf <vector142>:
801060bf:	6a 00                	push   $0x0
801060c1:	68 8e 00 00 00       	push   $0x8e
801060c6:	e9 bf f5 ff ff       	jmp    8010568a <alltraps>

801060cb <vector143>:
801060cb:	6a 00                	push   $0x0
801060cd:	68 8f 00 00 00       	push   $0x8f
801060d2:	e9 b3 f5 ff ff       	jmp    8010568a <alltraps>

801060d7 <vector144>:
801060d7:	6a 00                	push   $0x0
801060d9:	68 90 00 00 00       	push   $0x90
801060de:	e9 a7 f5 ff ff       	jmp    8010568a <alltraps>

801060e3 <vector145>:
801060e3:	6a 00                	push   $0x0
801060e5:	68 91 00 00 00       	push   $0x91
801060ea:	e9 9b f5 ff ff       	jmp    8010568a <alltraps>

801060ef <vector146>:
801060ef:	6a 00                	push   $0x0
801060f1:	68 92 00 00 00       	push   $0x92
801060f6:	e9 8f f5 ff ff       	jmp    8010568a <alltraps>

801060fb <vector147>:
801060fb:	6a 00                	push   $0x0
801060fd:	68 93 00 00 00       	push   $0x93
80106102:	e9 83 f5 ff ff       	jmp    8010568a <alltraps>

80106107 <vector148>:
80106107:	6a 00                	push   $0x0
80106109:	68 94 00 00 00       	push   $0x94
8010610e:	e9 77 f5 ff ff       	jmp    8010568a <alltraps>

80106113 <vector149>:
80106113:	6a 00                	push   $0x0
80106115:	68 95 00 00 00       	push   $0x95
8010611a:	e9 6b f5 ff ff       	jmp    8010568a <alltraps>

8010611f <vector150>:
8010611f:	6a 00                	push   $0x0
80106121:	68 96 00 00 00       	push   $0x96
80106126:	e9 5f f5 ff ff       	jmp    8010568a <alltraps>

8010612b <vector151>:
8010612b:	6a 00                	push   $0x0
8010612d:	68 97 00 00 00       	push   $0x97
80106132:	e9 53 f5 ff ff       	jmp    8010568a <alltraps>

80106137 <vector152>:
80106137:	6a 00                	push   $0x0
80106139:	68 98 00 00 00       	push   $0x98
8010613e:	e9 47 f5 ff ff       	jmp    8010568a <alltraps>

80106143 <vector153>:
80106143:	6a 00                	push   $0x0
80106145:	68 99 00 00 00       	push   $0x99
8010614a:	e9 3b f5 ff ff       	jmp    8010568a <alltraps>

8010614f <vector154>:
8010614f:	6a 00                	push   $0x0
80106151:	68 9a 00 00 00       	push   $0x9a
80106156:	e9 2f f5 ff ff       	jmp    8010568a <alltraps>

8010615b <vector155>:
8010615b:	6a 00                	push   $0x0
8010615d:	68 9b 00 00 00       	push   $0x9b
80106162:	e9 23 f5 ff ff       	jmp    8010568a <alltraps>

80106167 <vector156>:
80106167:	6a 00                	push   $0x0
80106169:	68 9c 00 00 00       	push   $0x9c
8010616e:	e9 17 f5 ff ff       	jmp    8010568a <alltraps>

80106173 <vector157>:
80106173:	6a 00                	push   $0x0
80106175:	68 9d 00 00 00       	push   $0x9d
8010617a:	e9 0b f5 ff ff       	jmp    8010568a <alltraps>

8010617f <vector158>:
8010617f:	6a 00                	push   $0x0
80106181:	68 9e 00 00 00       	push   $0x9e
80106186:	e9 ff f4 ff ff       	jmp    8010568a <alltraps>

8010618b <vector159>:
8010618b:	6a 00                	push   $0x0
8010618d:	68 9f 00 00 00       	push   $0x9f
80106192:	e9 f3 f4 ff ff       	jmp    8010568a <alltraps>

80106197 <vector160>:
80106197:	6a 00                	push   $0x0
80106199:	68 a0 00 00 00       	push   $0xa0
8010619e:	e9 e7 f4 ff ff       	jmp    8010568a <alltraps>

801061a3 <vector161>:
801061a3:	6a 00                	push   $0x0
801061a5:	68 a1 00 00 00       	push   $0xa1
801061aa:	e9 db f4 ff ff       	jmp    8010568a <alltraps>

801061af <vector162>:
801061af:	6a 00                	push   $0x0
801061b1:	68 a2 00 00 00       	push   $0xa2
801061b6:	e9 cf f4 ff ff       	jmp    8010568a <alltraps>

801061bb <vector163>:
801061bb:	6a 00                	push   $0x0
801061bd:	68 a3 00 00 00       	push   $0xa3
801061c2:	e9 c3 f4 ff ff       	jmp    8010568a <alltraps>

801061c7 <vector164>:
801061c7:	6a 00                	push   $0x0
801061c9:	68 a4 00 00 00       	push   $0xa4
801061ce:	e9 b7 f4 ff ff       	jmp    8010568a <alltraps>

801061d3 <vector165>:
801061d3:	6a 00                	push   $0x0
801061d5:	68 a5 00 00 00       	push   $0xa5
801061da:	e9 ab f4 ff ff       	jmp    8010568a <alltraps>

801061df <vector166>:
801061df:	6a 00                	push   $0x0
801061e1:	68 a6 00 00 00       	push   $0xa6
801061e6:	e9 9f f4 ff ff       	jmp    8010568a <alltraps>

801061eb <vector167>:
801061eb:	6a 00                	push   $0x0
801061ed:	68 a7 00 00 00       	push   $0xa7
801061f2:	e9 93 f4 ff ff       	jmp    8010568a <alltraps>

801061f7 <vector168>:
801061f7:	6a 00                	push   $0x0
801061f9:	68 a8 00 00 00       	push   $0xa8
801061fe:	e9 87 f4 ff ff       	jmp    8010568a <alltraps>

80106203 <vector169>:
80106203:	6a 00                	push   $0x0
80106205:	68 a9 00 00 00       	push   $0xa9
8010620a:	e9 7b f4 ff ff       	jmp    8010568a <alltraps>

8010620f <vector170>:
8010620f:	6a 00                	push   $0x0
80106211:	68 aa 00 00 00       	push   $0xaa
80106216:	e9 6f f4 ff ff       	jmp    8010568a <alltraps>

8010621b <vector171>:
8010621b:	6a 00                	push   $0x0
8010621d:	68 ab 00 00 00       	push   $0xab
80106222:	e9 63 f4 ff ff       	jmp    8010568a <alltraps>

80106227 <vector172>:
80106227:	6a 00                	push   $0x0
80106229:	68 ac 00 00 00       	push   $0xac
8010622e:	e9 57 f4 ff ff       	jmp    8010568a <alltraps>

80106233 <vector173>:
80106233:	6a 00                	push   $0x0
80106235:	68 ad 00 00 00       	push   $0xad
8010623a:	e9 4b f4 ff ff       	jmp    8010568a <alltraps>

8010623f <vector174>:
8010623f:	6a 00                	push   $0x0
80106241:	68 ae 00 00 00       	push   $0xae
80106246:	e9 3f f4 ff ff       	jmp    8010568a <alltraps>

8010624b <vector175>:
8010624b:	6a 00                	push   $0x0
8010624d:	68 af 00 00 00       	push   $0xaf
80106252:	e9 33 f4 ff ff       	jmp    8010568a <alltraps>

80106257 <vector176>:
80106257:	6a 00                	push   $0x0
80106259:	68 b0 00 00 00       	push   $0xb0
8010625e:	e9 27 f4 ff ff       	jmp    8010568a <alltraps>

80106263 <vector177>:
80106263:	6a 00                	push   $0x0
80106265:	68 b1 00 00 00       	push   $0xb1
8010626a:	e9 1b f4 ff ff       	jmp    8010568a <alltraps>

8010626f <vector178>:
8010626f:	6a 00                	push   $0x0
80106271:	68 b2 00 00 00       	push   $0xb2
80106276:	e9 0f f4 ff ff       	jmp    8010568a <alltraps>

8010627b <vector179>:
8010627b:	6a 00                	push   $0x0
8010627d:	68 b3 00 00 00       	push   $0xb3
80106282:	e9 03 f4 ff ff       	jmp    8010568a <alltraps>

80106287 <vector180>:
80106287:	6a 00                	push   $0x0
80106289:	68 b4 00 00 00       	push   $0xb4
8010628e:	e9 f7 f3 ff ff       	jmp    8010568a <alltraps>

80106293 <vector181>:
80106293:	6a 00                	push   $0x0
80106295:	68 b5 00 00 00       	push   $0xb5
8010629a:	e9 eb f3 ff ff       	jmp    8010568a <alltraps>

8010629f <vector182>:
8010629f:	6a 00                	push   $0x0
801062a1:	68 b6 00 00 00       	push   $0xb6
801062a6:	e9 df f3 ff ff       	jmp    8010568a <alltraps>

801062ab <vector183>:
801062ab:	6a 00                	push   $0x0
801062ad:	68 b7 00 00 00       	push   $0xb7
801062b2:	e9 d3 f3 ff ff       	jmp    8010568a <alltraps>

801062b7 <vector184>:
801062b7:	6a 00                	push   $0x0
801062b9:	68 b8 00 00 00       	push   $0xb8
801062be:	e9 c7 f3 ff ff       	jmp    8010568a <alltraps>

801062c3 <vector185>:
801062c3:	6a 00                	push   $0x0
801062c5:	68 b9 00 00 00       	push   $0xb9
801062ca:	e9 bb f3 ff ff       	jmp    8010568a <alltraps>

801062cf <vector186>:
801062cf:	6a 00                	push   $0x0
801062d1:	68 ba 00 00 00       	push   $0xba
801062d6:	e9 af f3 ff ff       	jmp    8010568a <alltraps>

801062db <vector187>:
801062db:	6a 00                	push   $0x0
801062dd:	68 bb 00 00 00       	push   $0xbb
801062e2:	e9 a3 f3 ff ff       	jmp    8010568a <alltraps>

801062e7 <vector188>:
801062e7:	6a 00                	push   $0x0
801062e9:	68 bc 00 00 00       	push   $0xbc
801062ee:	e9 97 f3 ff ff       	jmp    8010568a <alltraps>

801062f3 <vector189>:
801062f3:	6a 00                	push   $0x0
801062f5:	68 bd 00 00 00       	push   $0xbd
801062fa:	e9 8b f3 ff ff       	jmp    8010568a <alltraps>

801062ff <vector190>:
801062ff:	6a 00                	push   $0x0
80106301:	68 be 00 00 00       	push   $0xbe
80106306:	e9 7f f3 ff ff       	jmp    8010568a <alltraps>

8010630b <vector191>:
8010630b:	6a 00                	push   $0x0
8010630d:	68 bf 00 00 00       	push   $0xbf
80106312:	e9 73 f3 ff ff       	jmp    8010568a <alltraps>

80106317 <vector192>:
80106317:	6a 00                	push   $0x0
80106319:	68 c0 00 00 00       	push   $0xc0
8010631e:	e9 67 f3 ff ff       	jmp    8010568a <alltraps>

80106323 <vector193>:
80106323:	6a 00                	push   $0x0
80106325:	68 c1 00 00 00       	push   $0xc1
8010632a:	e9 5b f3 ff ff       	jmp    8010568a <alltraps>

8010632f <vector194>:
8010632f:	6a 00                	push   $0x0
80106331:	68 c2 00 00 00       	push   $0xc2
80106336:	e9 4f f3 ff ff       	jmp    8010568a <alltraps>

8010633b <vector195>:
8010633b:	6a 00                	push   $0x0
8010633d:	68 c3 00 00 00       	push   $0xc3
80106342:	e9 43 f3 ff ff       	jmp    8010568a <alltraps>

80106347 <vector196>:
80106347:	6a 00                	push   $0x0
80106349:	68 c4 00 00 00       	push   $0xc4
8010634e:	e9 37 f3 ff ff       	jmp    8010568a <alltraps>

80106353 <vector197>:
80106353:	6a 00                	push   $0x0
80106355:	68 c5 00 00 00       	push   $0xc5
8010635a:	e9 2b f3 ff ff       	jmp    8010568a <alltraps>

8010635f <vector198>:
8010635f:	6a 00                	push   $0x0
80106361:	68 c6 00 00 00       	push   $0xc6
80106366:	e9 1f f3 ff ff       	jmp    8010568a <alltraps>

8010636b <vector199>:
8010636b:	6a 00                	push   $0x0
8010636d:	68 c7 00 00 00       	push   $0xc7
80106372:	e9 13 f3 ff ff       	jmp    8010568a <alltraps>

80106377 <vector200>:
80106377:	6a 00                	push   $0x0
80106379:	68 c8 00 00 00       	push   $0xc8
8010637e:	e9 07 f3 ff ff       	jmp    8010568a <alltraps>

80106383 <vector201>:
80106383:	6a 00                	push   $0x0
80106385:	68 c9 00 00 00       	push   $0xc9
8010638a:	e9 fb f2 ff ff       	jmp    8010568a <alltraps>

8010638f <vector202>:
8010638f:	6a 00                	push   $0x0
80106391:	68 ca 00 00 00       	push   $0xca
80106396:	e9 ef f2 ff ff       	jmp    8010568a <alltraps>

8010639b <vector203>:
8010639b:	6a 00                	push   $0x0
8010639d:	68 cb 00 00 00       	push   $0xcb
801063a2:	e9 e3 f2 ff ff       	jmp    8010568a <alltraps>

801063a7 <vector204>:
801063a7:	6a 00                	push   $0x0
801063a9:	68 cc 00 00 00       	push   $0xcc
801063ae:	e9 d7 f2 ff ff       	jmp    8010568a <alltraps>

801063b3 <vector205>:
801063b3:	6a 00                	push   $0x0
801063b5:	68 cd 00 00 00       	push   $0xcd
801063ba:	e9 cb f2 ff ff       	jmp    8010568a <alltraps>

801063bf <vector206>:
801063bf:	6a 00                	push   $0x0
801063c1:	68 ce 00 00 00       	push   $0xce
801063c6:	e9 bf f2 ff ff       	jmp    8010568a <alltraps>

801063cb <vector207>:
801063cb:	6a 00                	push   $0x0
801063cd:	68 cf 00 00 00       	push   $0xcf
801063d2:	e9 b3 f2 ff ff       	jmp    8010568a <alltraps>

801063d7 <vector208>:
801063d7:	6a 00                	push   $0x0
801063d9:	68 d0 00 00 00       	push   $0xd0
801063de:	e9 a7 f2 ff ff       	jmp    8010568a <alltraps>

801063e3 <vector209>:
801063e3:	6a 00                	push   $0x0
801063e5:	68 d1 00 00 00       	push   $0xd1
801063ea:	e9 9b f2 ff ff       	jmp    8010568a <alltraps>

801063ef <vector210>:
801063ef:	6a 00                	push   $0x0
801063f1:	68 d2 00 00 00       	push   $0xd2
801063f6:	e9 8f f2 ff ff       	jmp    8010568a <alltraps>

801063fb <vector211>:
801063fb:	6a 00                	push   $0x0
801063fd:	68 d3 00 00 00       	push   $0xd3
80106402:	e9 83 f2 ff ff       	jmp    8010568a <alltraps>

80106407 <vector212>:
80106407:	6a 00                	push   $0x0
80106409:	68 d4 00 00 00       	push   $0xd4
8010640e:	e9 77 f2 ff ff       	jmp    8010568a <alltraps>

80106413 <vector213>:
80106413:	6a 00                	push   $0x0
80106415:	68 d5 00 00 00       	push   $0xd5
8010641a:	e9 6b f2 ff ff       	jmp    8010568a <alltraps>

8010641f <vector214>:
8010641f:	6a 00                	push   $0x0
80106421:	68 d6 00 00 00       	push   $0xd6
80106426:	e9 5f f2 ff ff       	jmp    8010568a <alltraps>

8010642b <vector215>:
8010642b:	6a 00                	push   $0x0
8010642d:	68 d7 00 00 00       	push   $0xd7
80106432:	e9 53 f2 ff ff       	jmp    8010568a <alltraps>

80106437 <vector216>:
80106437:	6a 00                	push   $0x0
80106439:	68 d8 00 00 00       	push   $0xd8
8010643e:	e9 47 f2 ff ff       	jmp    8010568a <alltraps>

80106443 <vector217>:
80106443:	6a 00                	push   $0x0
80106445:	68 d9 00 00 00       	push   $0xd9
8010644a:	e9 3b f2 ff ff       	jmp    8010568a <alltraps>

8010644f <vector218>:
8010644f:	6a 00                	push   $0x0
80106451:	68 da 00 00 00       	push   $0xda
80106456:	e9 2f f2 ff ff       	jmp    8010568a <alltraps>

8010645b <vector219>:
8010645b:	6a 00                	push   $0x0
8010645d:	68 db 00 00 00       	push   $0xdb
80106462:	e9 23 f2 ff ff       	jmp    8010568a <alltraps>

80106467 <vector220>:
80106467:	6a 00                	push   $0x0
80106469:	68 dc 00 00 00       	push   $0xdc
8010646e:	e9 17 f2 ff ff       	jmp    8010568a <alltraps>

80106473 <vector221>:
80106473:	6a 00                	push   $0x0
80106475:	68 dd 00 00 00       	push   $0xdd
8010647a:	e9 0b f2 ff ff       	jmp    8010568a <alltraps>

8010647f <vector222>:
8010647f:	6a 00                	push   $0x0
80106481:	68 de 00 00 00       	push   $0xde
80106486:	e9 ff f1 ff ff       	jmp    8010568a <alltraps>

8010648b <vector223>:
8010648b:	6a 00                	push   $0x0
8010648d:	68 df 00 00 00       	push   $0xdf
80106492:	e9 f3 f1 ff ff       	jmp    8010568a <alltraps>

80106497 <vector224>:
80106497:	6a 00                	push   $0x0
80106499:	68 e0 00 00 00       	push   $0xe0
8010649e:	e9 e7 f1 ff ff       	jmp    8010568a <alltraps>

801064a3 <vector225>:
801064a3:	6a 00                	push   $0x0
801064a5:	68 e1 00 00 00       	push   $0xe1
801064aa:	e9 db f1 ff ff       	jmp    8010568a <alltraps>

801064af <vector226>:
801064af:	6a 00                	push   $0x0
801064b1:	68 e2 00 00 00       	push   $0xe2
801064b6:	e9 cf f1 ff ff       	jmp    8010568a <alltraps>

801064bb <vector227>:
801064bb:	6a 00                	push   $0x0
801064bd:	68 e3 00 00 00       	push   $0xe3
801064c2:	e9 c3 f1 ff ff       	jmp    8010568a <alltraps>

801064c7 <vector228>:
801064c7:	6a 00                	push   $0x0
801064c9:	68 e4 00 00 00       	push   $0xe4
801064ce:	e9 b7 f1 ff ff       	jmp    8010568a <alltraps>

801064d3 <vector229>:
801064d3:	6a 00                	push   $0x0
801064d5:	68 e5 00 00 00       	push   $0xe5
801064da:	e9 ab f1 ff ff       	jmp    8010568a <alltraps>

801064df <vector230>:
801064df:	6a 00                	push   $0x0
801064e1:	68 e6 00 00 00       	push   $0xe6
801064e6:	e9 9f f1 ff ff       	jmp    8010568a <alltraps>

801064eb <vector231>:
801064eb:	6a 00                	push   $0x0
801064ed:	68 e7 00 00 00       	push   $0xe7
801064f2:	e9 93 f1 ff ff       	jmp    8010568a <alltraps>

801064f7 <vector232>:
801064f7:	6a 00                	push   $0x0
801064f9:	68 e8 00 00 00       	push   $0xe8
801064fe:	e9 87 f1 ff ff       	jmp    8010568a <alltraps>

80106503 <vector233>:
80106503:	6a 00                	push   $0x0
80106505:	68 e9 00 00 00       	push   $0xe9
8010650a:	e9 7b f1 ff ff       	jmp    8010568a <alltraps>

8010650f <vector234>:
8010650f:	6a 00                	push   $0x0
80106511:	68 ea 00 00 00       	push   $0xea
80106516:	e9 6f f1 ff ff       	jmp    8010568a <alltraps>

8010651b <vector235>:
8010651b:	6a 00                	push   $0x0
8010651d:	68 eb 00 00 00       	push   $0xeb
80106522:	e9 63 f1 ff ff       	jmp    8010568a <alltraps>

80106527 <vector236>:
80106527:	6a 00                	push   $0x0
80106529:	68 ec 00 00 00       	push   $0xec
8010652e:	e9 57 f1 ff ff       	jmp    8010568a <alltraps>

80106533 <vector237>:
80106533:	6a 00                	push   $0x0
80106535:	68 ed 00 00 00       	push   $0xed
8010653a:	e9 4b f1 ff ff       	jmp    8010568a <alltraps>

8010653f <vector238>:
8010653f:	6a 00                	push   $0x0
80106541:	68 ee 00 00 00       	push   $0xee
80106546:	e9 3f f1 ff ff       	jmp    8010568a <alltraps>

8010654b <vector239>:
8010654b:	6a 00                	push   $0x0
8010654d:	68 ef 00 00 00       	push   $0xef
80106552:	e9 33 f1 ff ff       	jmp    8010568a <alltraps>

80106557 <vector240>:
80106557:	6a 00                	push   $0x0
80106559:	68 f0 00 00 00       	push   $0xf0
8010655e:	e9 27 f1 ff ff       	jmp    8010568a <alltraps>

80106563 <vector241>:
80106563:	6a 00                	push   $0x0
80106565:	68 f1 00 00 00       	push   $0xf1
8010656a:	e9 1b f1 ff ff       	jmp    8010568a <alltraps>

8010656f <vector242>:
8010656f:	6a 00                	push   $0x0
80106571:	68 f2 00 00 00       	push   $0xf2
80106576:	e9 0f f1 ff ff       	jmp    8010568a <alltraps>

8010657b <vector243>:
8010657b:	6a 00                	push   $0x0
8010657d:	68 f3 00 00 00       	push   $0xf3
80106582:	e9 03 f1 ff ff       	jmp    8010568a <alltraps>

80106587 <vector244>:
80106587:	6a 00                	push   $0x0
80106589:	68 f4 00 00 00       	push   $0xf4
8010658e:	e9 f7 f0 ff ff       	jmp    8010568a <alltraps>

80106593 <vector245>:
80106593:	6a 00                	push   $0x0
80106595:	68 f5 00 00 00       	push   $0xf5
8010659a:	e9 eb f0 ff ff       	jmp    8010568a <alltraps>

8010659f <vector246>:
8010659f:	6a 00                	push   $0x0
801065a1:	68 f6 00 00 00       	push   $0xf6
801065a6:	e9 df f0 ff ff       	jmp    8010568a <alltraps>

801065ab <vector247>:
801065ab:	6a 00                	push   $0x0
801065ad:	68 f7 00 00 00       	push   $0xf7
801065b2:	e9 d3 f0 ff ff       	jmp    8010568a <alltraps>

801065b7 <vector248>:
801065b7:	6a 00                	push   $0x0
801065b9:	68 f8 00 00 00       	push   $0xf8
801065be:	e9 c7 f0 ff ff       	jmp    8010568a <alltraps>

801065c3 <vector249>:
801065c3:	6a 00                	push   $0x0
801065c5:	68 f9 00 00 00       	push   $0xf9
801065ca:	e9 bb f0 ff ff       	jmp    8010568a <alltraps>

801065cf <vector250>:
801065cf:	6a 00                	push   $0x0
801065d1:	68 fa 00 00 00       	push   $0xfa
801065d6:	e9 af f0 ff ff       	jmp    8010568a <alltraps>

801065db <vector251>:
801065db:	6a 00                	push   $0x0
801065dd:	68 fb 00 00 00       	push   $0xfb
801065e2:	e9 a3 f0 ff ff       	jmp    8010568a <alltraps>

801065e7 <vector252>:
801065e7:	6a 00                	push   $0x0
801065e9:	68 fc 00 00 00       	push   $0xfc
801065ee:	e9 97 f0 ff ff       	jmp    8010568a <alltraps>

801065f3 <vector253>:
801065f3:	6a 00                	push   $0x0
801065f5:	68 fd 00 00 00       	push   $0xfd
801065fa:	e9 8b f0 ff ff       	jmp    8010568a <alltraps>

801065ff <vector254>:
801065ff:	6a 00                	push   $0x0
80106601:	68 fe 00 00 00       	push   $0xfe
80106606:	e9 7f f0 ff ff       	jmp    8010568a <alltraps>

8010660b <vector255>:
8010660b:	6a 00                	push   $0x0
8010660d:	68 ff 00 00 00       	push   $0xff
80106612:	e9 73 f0 ff ff       	jmp    8010568a <alltraps>
80106617:	66 90                	xchg   %ax,%ax
80106619:	66 90                	xchg   %ax,%ax
8010661b:	66 90                	xchg   %ax,%ax
8010661d:	66 90                	xchg   %ax,%ax
8010661f:	90                   	nop

80106620 <walkpgdir>:
80106620:	55                   	push   %ebp
80106621:	89 e5                	mov    %esp,%ebp
80106623:	57                   	push   %edi
80106624:	56                   	push   %esi
80106625:	53                   	push   %ebx
80106626:	89 d3                	mov    %edx,%ebx
80106628:	c1 ea 16             	shr    $0x16,%edx
8010662b:	8d 3c 90             	lea    (%eax,%edx,4),%edi
8010662e:	83 ec 0c             	sub    $0xc,%esp
80106631:	8b 07                	mov    (%edi),%eax
80106633:	a8 01                	test   $0x1,%al
80106635:	74 29                	je     80106660 <walkpgdir+0x40>
80106637:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010663c:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
80106642:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106645:	c1 eb 0a             	shr    $0xa,%ebx
80106648:	81 e3 fc 0f 00 00    	and    $0xffc,%ebx
8010664e:	8d 04 1e             	lea    (%esi,%ebx,1),%eax
80106651:	5b                   	pop    %ebx
80106652:	5e                   	pop    %esi
80106653:	5f                   	pop    %edi
80106654:	5d                   	pop    %ebp
80106655:	c3                   	ret    
80106656:	8d 76 00             	lea    0x0(%esi),%esi
80106659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106660:	85 c9                	test   %ecx,%ecx
80106662:	74 2c                	je     80106690 <walkpgdir+0x70>
80106664:	e8 17 be ff ff       	call   80102480 <kalloc>
80106669:	85 c0                	test   %eax,%eax
8010666b:	89 c6                	mov    %eax,%esi
8010666d:	74 21                	je     80106690 <walkpgdir+0x70>
8010666f:	83 ec 04             	sub    $0x4,%esp
80106672:	68 00 10 00 00       	push   $0x1000
80106677:	6a 00                	push   $0x0
80106679:	50                   	push   %eax
8010667a:	e8 81 dd ff ff       	call   80104400 <memset>
8010667f:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106685:	83 c4 10             	add    $0x10,%esp
80106688:	83 c8 07             	or     $0x7,%eax
8010668b:	89 07                	mov    %eax,(%edi)
8010668d:	eb b3                	jmp    80106642 <walkpgdir+0x22>
8010668f:	90                   	nop
80106690:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106693:	31 c0                	xor    %eax,%eax
80106695:	5b                   	pop    %ebx
80106696:	5e                   	pop    %esi
80106697:	5f                   	pop    %edi
80106698:	5d                   	pop    %ebp
80106699:	c3                   	ret    
8010669a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801066a0 <deallocuvm.part.0>:
801066a0:	55                   	push   %ebp
801066a1:	89 e5                	mov    %esp,%ebp
801066a3:	57                   	push   %edi
801066a4:	56                   	push   %esi
801066a5:	53                   	push   %ebx
801066a6:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
801066ac:	89 c7                	mov    %eax,%edi
801066ae:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801066b4:	83 ec 1c             	sub    $0x1c,%esp
801066b7:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801066ba:	39 d3                	cmp    %edx,%ebx
801066bc:	73 66                	jae    80106724 <deallocuvm.part.0+0x84>
801066be:	89 d6                	mov    %edx,%esi
801066c0:	eb 3d                	jmp    801066ff <deallocuvm.part.0+0x5f>
801066c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801066c8:	8b 10                	mov    (%eax),%edx
801066ca:	f6 c2 01             	test   $0x1,%dl
801066cd:	74 26                	je     801066f5 <deallocuvm.part.0+0x55>
801066cf:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
801066d5:	74 58                	je     8010672f <deallocuvm.part.0+0x8f>
801066d7:	83 ec 0c             	sub    $0xc,%esp
801066da:	81 c2 00 00 00 80    	add    $0x80000000,%edx
801066e0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801066e3:	52                   	push   %edx
801066e4:	e8 e7 bb ff ff       	call   801022d0 <kfree>
801066e9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801066ec:	83 c4 10             	add    $0x10,%esp
801066ef:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801066f5:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801066fb:	39 f3                	cmp    %esi,%ebx
801066fd:	73 25                	jae    80106724 <deallocuvm.part.0+0x84>
801066ff:	31 c9                	xor    %ecx,%ecx
80106701:	89 da                	mov    %ebx,%edx
80106703:	89 f8                	mov    %edi,%eax
80106705:	e8 16 ff ff ff       	call   80106620 <walkpgdir>
8010670a:	85 c0                	test   %eax,%eax
8010670c:	75 ba                	jne    801066c8 <deallocuvm.part.0+0x28>
8010670e:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106714:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx
8010671a:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106720:	39 f3                	cmp    %esi,%ebx
80106722:	72 db                	jb     801066ff <deallocuvm.part.0+0x5f>
80106724:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106727:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010672a:	5b                   	pop    %ebx
8010672b:	5e                   	pop    %esi
8010672c:	5f                   	pop    %edi
8010672d:	5d                   	pop    %ebp
8010672e:	c3                   	ret    
8010672f:	83 ec 0c             	sub    $0xc,%esp
80106732:	68 86 72 10 80       	push   $0x80107286
80106737:	e8 34 9c ff ff       	call   80100370 <panic>
8010673c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106740 <seginit>:
80106740:	55                   	push   %ebp
80106741:	89 e5                	mov    %esp,%ebp
80106743:	83 ec 18             	sub    $0x18,%esp
80106746:	e8 05 d0 ff ff       	call   80103750 <cpuid>
8010674b:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
80106751:	31 c9                	xor    %ecx,%ecx
80106753:	ba ff ff ff ff       	mov    $0xffffffff,%edx
80106758:	66 89 90 f8 27 11 80 	mov    %dx,-0x7feed808(%eax)
8010675f:	66 89 88 fa 27 11 80 	mov    %cx,-0x7feed806(%eax)
80106766:	ba ff ff ff ff       	mov    $0xffffffff,%edx
8010676b:	31 c9                	xor    %ecx,%ecx
8010676d:	66 89 90 00 28 11 80 	mov    %dx,-0x7feed800(%eax)
80106774:	ba ff ff ff ff       	mov    $0xffffffff,%edx
80106779:	66 89 88 02 28 11 80 	mov    %cx,-0x7feed7fe(%eax)
80106780:	31 c9                	xor    %ecx,%ecx
80106782:	66 89 90 08 28 11 80 	mov    %dx,-0x7feed7f8(%eax)
80106789:	66 89 88 0a 28 11 80 	mov    %cx,-0x7feed7f6(%eax)
80106790:	ba ff ff ff ff       	mov    $0xffffffff,%edx
80106795:	31 c9                	xor    %ecx,%ecx
80106797:	66 89 90 10 28 11 80 	mov    %dx,-0x7feed7f0(%eax)
8010679e:	c6 80 fc 27 11 80 00 	movb   $0x0,-0x7feed804(%eax)
801067a5:	ba 2f 00 00 00       	mov    $0x2f,%edx
801067aa:	c6 80 fd 27 11 80 9a 	movb   $0x9a,-0x7feed803(%eax)
801067b1:	c6 80 fe 27 11 80 cf 	movb   $0xcf,-0x7feed802(%eax)
801067b8:	c6 80 ff 27 11 80 00 	movb   $0x0,-0x7feed801(%eax)
801067bf:	c6 80 04 28 11 80 00 	movb   $0x0,-0x7feed7fc(%eax)
801067c6:	c6 80 05 28 11 80 92 	movb   $0x92,-0x7feed7fb(%eax)
801067cd:	c6 80 06 28 11 80 cf 	movb   $0xcf,-0x7feed7fa(%eax)
801067d4:	c6 80 07 28 11 80 00 	movb   $0x0,-0x7feed7f9(%eax)
801067db:	c6 80 0c 28 11 80 00 	movb   $0x0,-0x7feed7f4(%eax)
801067e2:	c6 80 0d 28 11 80 fa 	movb   $0xfa,-0x7feed7f3(%eax)
801067e9:	c6 80 0e 28 11 80 cf 	movb   $0xcf,-0x7feed7f2(%eax)
801067f0:	c6 80 0f 28 11 80 00 	movb   $0x0,-0x7feed7f1(%eax)
801067f7:	66 89 88 12 28 11 80 	mov    %cx,-0x7feed7ee(%eax)
801067fe:	c6 80 14 28 11 80 00 	movb   $0x0,-0x7feed7ec(%eax)
80106805:	c6 80 15 28 11 80 f2 	movb   $0xf2,-0x7feed7eb(%eax)
8010680c:	c6 80 16 28 11 80 cf 	movb   $0xcf,-0x7feed7ea(%eax)
80106813:	c6 80 17 28 11 80 00 	movb   $0x0,-0x7feed7e9(%eax)
8010681a:	05 f0 27 11 80       	add    $0x801127f0,%eax
8010681f:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
80106823:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
80106827:	c1 e8 10             	shr    $0x10,%eax
8010682a:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
8010682e:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106831:	0f 01 10             	lgdtl  (%eax)
80106834:	c9                   	leave  
80106835:	c3                   	ret    
80106836:	8d 76 00             	lea    0x0(%esi),%esi
80106839:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106840 <mappages>:
80106840:	55                   	push   %ebp
80106841:	89 e5                	mov    %esp,%ebp
80106843:	57                   	push   %edi
80106844:	56                   	push   %esi
80106845:	53                   	push   %ebx
80106846:	83 ec 1c             	sub    $0x1c,%esp
80106849:	8b 45 0c             	mov    0xc(%ebp),%eax
8010684c:	8b 55 10             	mov    0x10(%ebp),%edx
8010684f:	8b 7d 14             	mov    0x14(%ebp),%edi
80106852:	89 c3                	mov    %eax,%ebx
80106854:	8d 44 10 ff          	lea    -0x1(%eax,%edx,1),%eax
80106858:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
8010685e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106863:	29 df                	sub    %ebx,%edi
80106865:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106868:	8b 45 18             	mov    0x18(%ebp),%eax
8010686b:	83 c8 01             	or     $0x1,%eax
8010686e:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106871:	eb 1a                	jmp    8010688d <mappages+0x4d>
80106873:	90                   	nop
80106874:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106878:	f6 00 01             	testb  $0x1,(%eax)
8010687b:	75 3d                	jne    801068ba <mappages+0x7a>
8010687d:	0b 75 e0             	or     -0x20(%ebp),%esi
80106880:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
80106883:	89 30                	mov    %esi,(%eax)
80106885:	74 29                	je     801068b0 <mappages+0x70>
80106887:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010688d:	8b 45 08             	mov    0x8(%ebp),%eax
80106890:	b9 01 00 00 00       	mov    $0x1,%ecx
80106895:	89 da                	mov    %ebx,%edx
80106897:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
8010689a:	e8 81 fd ff ff       	call   80106620 <walkpgdir>
8010689f:	85 c0                	test   %eax,%eax
801068a1:	75 d5                	jne    80106878 <mappages+0x38>
801068a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801068a6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801068ab:	5b                   	pop    %ebx
801068ac:	5e                   	pop    %esi
801068ad:	5f                   	pop    %edi
801068ae:	5d                   	pop    %ebp
801068af:	c3                   	ret    
801068b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801068b3:	31 c0                	xor    %eax,%eax
801068b5:	5b                   	pop    %ebx
801068b6:	5e                   	pop    %esi
801068b7:	5f                   	pop    %edi
801068b8:	5d                   	pop    %ebp
801068b9:	c3                   	ret    
801068ba:	83 ec 0c             	sub    $0xc,%esp
801068bd:	68 38 79 10 80       	push   $0x80107938
801068c2:	e8 a9 9a ff ff       	call   80100370 <panic>
801068c7:	89 f6                	mov    %esi,%esi
801068c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801068d0 <switchkvm>:
801068d0:	a1 a4 55 11 80       	mov    0x801155a4,%eax
801068d5:	55                   	push   %ebp
801068d6:	89 e5                	mov    %esp,%ebp
801068d8:	05 00 00 00 80       	add    $0x80000000,%eax
801068dd:	0f 22 d8             	mov    %eax,%cr3
801068e0:	5d                   	pop    %ebp
801068e1:	c3                   	ret    
801068e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801068e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801068f0 <switchuvm>:
801068f0:	55                   	push   %ebp
801068f1:	89 e5                	mov    %esp,%ebp
801068f3:	57                   	push   %edi
801068f4:	56                   	push   %esi
801068f5:	53                   	push   %ebx
801068f6:	83 ec 1c             	sub    $0x1c,%esp
801068f9:	8b 75 08             	mov    0x8(%ebp),%esi
801068fc:	85 f6                	test   %esi,%esi
801068fe:	0f 84 cd 00 00 00    	je     801069d1 <switchuvm+0xe1>
80106904:	8b 46 08             	mov    0x8(%esi),%eax
80106907:	85 c0                	test   %eax,%eax
80106909:	0f 84 dc 00 00 00    	je     801069eb <switchuvm+0xfb>
8010690f:	8b 7e 04             	mov    0x4(%esi),%edi
80106912:	85 ff                	test   %edi,%edi
80106914:	0f 84 c4 00 00 00    	je     801069de <switchuvm+0xee>
8010691a:	e8 31 d9 ff ff       	call   80104250 <pushcli>
8010691f:	e8 ac cd ff ff       	call   801036d0 <mycpu>
80106924:	89 c3                	mov    %eax,%ebx
80106926:	e8 a5 cd ff ff       	call   801036d0 <mycpu>
8010692b:	89 c7                	mov    %eax,%edi
8010692d:	e8 9e cd ff ff       	call   801036d0 <mycpu>
80106932:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106935:	83 c7 08             	add    $0x8,%edi
80106938:	e8 93 cd ff ff       	call   801036d0 <mycpu>
8010693d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106940:	83 c0 08             	add    $0x8,%eax
80106943:	ba 67 00 00 00       	mov    $0x67,%edx
80106948:	c1 e8 18             	shr    $0x18,%eax
8010694b:	66 89 93 98 00 00 00 	mov    %dx,0x98(%ebx)
80106952:	66 89 bb 9a 00 00 00 	mov    %di,0x9a(%ebx)
80106959:	c6 83 9d 00 00 00 99 	movb   $0x99,0x9d(%ebx)
80106960:	c6 83 9e 00 00 00 40 	movb   $0x40,0x9e(%ebx)
80106967:	83 c1 08             	add    $0x8,%ecx
8010696a:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
80106970:	c1 e9 10             	shr    $0x10,%ecx
80106973:	88 8b 9c 00 00 00    	mov    %cl,0x9c(%ebx)
80106979:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010697e:	e8 4d cd ff ff       	call   801036d0 <mycpu>
80106983:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
8010698a:	e8 41 cd ff ff       	call   801036d0 <mycpu>
8010698f:	b9 10 00 00 00       	mov    $0x10,%ecx
80106994:	66 89 48 10          	mov    %cx,0x10(%eax)
80106998:	e8 33 cd ff ff       	call   801036d0 <mycpu>
8010699d:	8b 56 08             	mov    0x8(%esi),%edx
801069a0:	8d 8a 00 10 00 00    	lea    0x1000(%edx),%ecx
801069a6:	89 48 0c             	mov    %ecx,0xc(%eax)
801069a9:	e8 22 cd ff ff       	call   801036d0 <mycpu>
801069ae:	66 89 58 6e          	mov    %bx,0x6e(%eax)
801069b2:	b8 28 00 00 00       	mov    $0x28,%eax
801069b7:	0f 00 d8             	ltr    %ax
801069ba:	8b 46 04             	mov    0x4(%esi),%eax
801069bd:	05 00 00 00 80       	add    $0x80000000,%eax
801069c2:	0f 22 d8             	mov    %eax,%cr3
801069c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801069c8:	5b                   	pop    %ebx
801069c9:	5e                   	pop    %esi
801069ca:	5f                   	pop    %edi
801069cb:	5d                   	pop    %ebp
801069cc:	e9 6f d9 ff ff       	jmp    80104340 <popcli>
801069d1:	83 ec 0c             	sub    $0xc,%esp
801069d4:	68 3e 79 10 80       	push   $0x8010793e
801069d9:	e8 92 99 ff ff       	call   80100370 <panic>
801069de:	83 ec 0c             	sub    $0xc,%esp
801069e1:	68 69 79 10 80       	push   $0x80107969
801069e6:	e8 85 99 ff ff       	call   80100370 <panic>
801069eb:	83 ec 0c             	sub    $0xc,%esp
801069ee:	68 54 79 10 80       	push   $0x80107954
801069f3:	e8 78 99 ff ff       	call   80100370 <panic>
801069f8:	90                   	nop
801069f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106a00 <inituvm>:
80106a00:	55                   	push   %ebp
80106a01:	89 e5                	mov    %esp,%ebp
80106a03:	57                   	push   %edi
80106a04:	56                   	push   %esi
80106a05:	53                   	push   %ebx
80106a06:	83 ec 1c             	sub    $0x1c,%esp
80106a09:	8b 75 10             	mov    0x10(%ebp),%esi
80106a0c:	8b 55 08             	mov    0x8(%ebp),%edx
80106a0f:	8b 7d 0c             	mov    0xc(%ebp),%edi
80106a12:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106a18:	77 50                	ja     80106a6a <inituvm+0x6a>
80106a1a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80106a1d:	e8 5e ba ff ff       	call   80102480 <kalloc>
80106a22:	83 ec 04             	sub    $0x4,%esp
80106a25:	89 c3                	mov    %eax,%ebx
80106a27:	68 00 10 00 00       	push   $0x1000
80106a2c:	6a 00                	push   $0x0
80106a2e:	50                   	push   %eax
80106a2f:	e8 cc d9 ff ff       	call   80104400 <memset>
80106a34:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106a37:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106a3d:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
80106a44:	50                   	push   %eax
80106a45:	68 00 10 00 00       	push   $0x1000
80106a4a:	6a 00                	push   $0x0
80106a4c:	52                   	push   %edx
80106a4d:	e8 ee fd ff ff       	call   80106840 <mappages>
80106a52:	89 75 10             	mov    %esi,0x10(%ebp)
80106a55:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106a58:	83 c4 20             	add    $0x20,%esp
80106a5b:	89 5d 08             	mov    %ebx,0x8(%ebp)
80106a5e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106a61:	5b                   	pop    %ebx
80106a62:	5e                   	pop    %esi
80106a63:	5f                   	pop    %edi
80106a64:	5d                   	pop    %ebp
80106a65:	e9 46 da ff ff       	jmp    801044b0 <memmove>
80106a6a:	83 ec 0c             	sub    $0xc,%esp
80106a6d:	68 7d 79 10 80       	push   $0x8010797d
80106a72:	e8 f9 98 ff ff       	call   80100370 <panic>
80106a77:	89 f6                	mov    %esi,%esi
80106a79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106a80 <loaduvm>:
80106a80:	55                   	push   %ebp
80106a81:	89 e5                	mov    %esp,%ebp
80106a83:	57                   	push   %edi
80106a84:	56                   	push   %esi
80106a85:	53                   	push   %ebx
80106a86:	83 ec 0c             	sub    $0xc,%esp
80106a89:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106a90:	0f 85 91 00 00 00    	jne    80106b27 <loaduvm+0xa7>
80106a96:	8b 75 18             	mov    0x18(%ebp),%esi
80106a99:	31 db                	xor    %ebx,%ebx
80106a9b:	85 f6                	test   %esi,%esi
80106a9d:	75 1a                	jne    80106ab9 <loaduvm+0x39>
80106a9f:	eb 6f                	jmp    80106b10 <loaduvm+0x90>
80106aa1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106aa8:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106aae:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106ab4:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106ab7:	76 57                	jbe    80106b10 <loaduvm+0x90>
80106ab9:	8b 55 0c             	mov    0xc(%ebp),%edx
80106abc:	8b 45 08             	mov    0x8(%ebp),%eax
80106abf:	31 c9                	xor    %ecx,%ecx
80106ac1:	01 da                	add    %ebx,%edx
80106ac3:	e8 58 fb ff ff       	call   80106620 <walkpgdir>
80106ac8:	85 c0                	test   %eax,%eax
80106aca:	74 4e                	je     80106b1a <loaduvm+0x9a>
80106acc:	8b 00                	mov    (%eax),%eax
80106ace:	8b 4d 14             	mov    0x14(%ebp),%ecx
80106ad1:	bf 00 10 00 00       	mov    $0x1000,%edi
80106ad6:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106adb:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106ae1:	0f 46 fe             	cmovbe %esi,%edi
80106ae4:	01 d9                	add    %ebx,%ecx
80106ae6:	05 00 00 00 80       	add    $0x80000000,%eax
80106aeb:	57                   	push   %edi
80106aec:	51                   	push   %ecx
80106aed:	50                   	push   %eax
80106aee:	ff 75 10             	pushl  0x10(%ebp)
80106af1:	e8 4a ae ff ff       	call   80101940 <readi>
80106af6:	83 c4 10             	add    $0x10,%esp
80106af9:	39 c7                	cmp    %eax,%edi
80106afb:	74 ab                	je     80106aa8 <loaduvm+0x28>
80106afd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106b00:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106b05:	5b                   	pop    %ebx
80106b06:	5e                   	pop    %esi
80106b07:	5f                   	pop    %edi
80106b08:	5d                   	pop    %ebp
80106b09:	c3                   	ret    
80106b0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106b10:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106b13:	31 c0                	xor    %eax,%eax
80106b15:	5b                   	pop    %ebx
80106b16:	5e                   	pop    %esi
80106b17:	5f                   	pop    %edi
80106b18:	5d                   	pop    %ebp
80106b19:	c3                   	ret    
80106b1a:	83 ec 0c             	sub    $0xc,%esp
80106b1d:	68 97 79 10 80       	push   $0x80107997
80106b22:	e8 49 98 ff ff       	call   80100370 <panic>
80106b27:	83 ec 0c             	sub    $0xc,%esp
80106b2a:	68 38 7a 10 80       	push   $0x80107a38
80106b2f:	e8 3c 98 ff ff       	call   80100370 <panic>
80106b34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106b3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106b40 <allocuvm>:
80106b40:	55                   	push   %ebp
80106b41:	89 e5                	mov    %esp,%ebp
80106b43:	57                   	push   %edi
80106b44:	56                   	push   %esi
80106b45:	53                   	push   %ebx
80106b46:	83 ec 0c             	sub    $0xc,%esp
80106b49:	8b 7d 10             	mov    0x10(%ebp),%edi
80106b4c:	85 ff                	test   %edi,%edi
80106b4e:	0f 88 ca 00 00 00    	js     80106c1e <allocuvm+0xde>
80106b54:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106b57:	8b 45 0c             	mov    0xc(%ebp),%eax
80106b5a:	0f 82 84 00 00 00    	jb     80106be4 <allocuvm+0xa4>
80106b60:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106b66:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106b6c:	39 df                	cmp    %ebx,%edi
80106b6e:	77 45                	ja     80106bb5 <allocuvm+0x75>
80106b70:	e9 bb 00 00 00       	jmp    80106c30 <allocuvm+0xf0>
80106b75:	8d 76 00             	lea    0x0(%esi),%esi
80106b78:	83 ec 04             	sub    $0x4,%esp
80106b7b:	68 00 10 00 00       	push   $0x1000
80106b80:	6a 00                	push   $0x0
80106b82:	50                   	push   %eax
80106b83:	e8 78 d8 ff ff       	call   80104400 <memset>
80106b88:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106b8e:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
80106b95:	50                   	push   %eax
80106b96:	68 00 10 00 00       	push   $0x1000
80106b9b:	53                   	push   %ebx
80106b9c:	ff 75 08             	pushl  0x8(%ebp)
80106b9f:	e8 9c fc ff ff       	call   80106840 <mappages>
80106ba4:	83 c4 20             	add    $0x20,%esp
80106ba7:	85 c0                	test   %eax,%eax
80106ba9:	78 45                	js     80106bf0 <allocuvm+0xb0>
80106bab:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106bb1:	39 df                	cmp    %ebx,%edi
80106bb3:	76 7b                	jbe    80106c30 <allocuvm+0xf0>
80106bb5:	e8 c6 b8 ff ff       	call   80102480 <kalloc>
80106bba:	85 c0                	test   %eax,%eax
80106bbc:	89 c6                	mov    %eax,%esi
80106bbe:	75 b8                	jne    80106b78 <allocuvm+0x38>
80106bc0:	83 ec 0c             	sub    $0xc,%esp
80106bc3:	68 b5 79 10 80       	push   $0x801079b5
80106bc8:	e8 93 9a ff ff       	call   80100660 <cprintf>
80106bcd:	83 c4 10             	add    $0x10,%esp
80106bd0:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106bd3:	76 49                	jbe    80106c1e <allocuvm+0xde>
80106bd5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106bd8:	8b 45 08             	mov    0x8(%ebp),%eax
80106bdb:	89 fa                	mov    %edi,%edx
80106bdd:	e8 be fa ff ff       	call   801066a0 <deallocuvm.part.0>
80106be2:	31 c0                	xor    %eax,%eax
80106be4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106be7:	5b                   	pop    %ebx
80106be8:	5e                   	pop    %esi
80106be9:	5f                   	pop    %edi
80106bea:	5d                   	pop    %ebp
80106beb:	c3                   	ret    
80106bec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106bf0:	83 ec 0c             	sub    $0xc,%esp
80106bf3:	68 cd 79 10 80       	push   $0x801079cd
80106bf8:	e8 63 9a ff ff       	call   80100660 <cprintf>
80106bfd:	83 c4 10             	add    $0x10,%esp
80106c00:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106c03:	76 0d                	jbe    80106c12 <allocuvm+0xd2>
80106c05:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106c08:	8b 45 08             	mov    0x8(%ebp),%eax
80106c0b:	89 fa                	mov    %edi,%edx
80106c0d:	e8 8e fa ff ff       	call   801066a0 <deallocuvm.part.0>
80106c12:	83 ec 0c             	sub    $0xc,%esp
80106c15:	56                   	push   %esi
80106c16:	e8 b5 b6 ff ff       	call   801022d0 <kfree>
80106c1b:	83 c4 10             	add    $0x10,%esp
80106c1e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106c21:	31 c0                	xor    %eax,%eax
80106c23:	5b                   	pop    %ebx
80106c24:	5e                   	pop    %esi
80106c25:	5f                   	pop    %edi
80106c26:	5d                   	pop    %ebp
80106c27:	c3                   	ret    
80106c28:	90                   	nop
80106c29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106c30:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106c33:	89 f8                	mov    %edi,%eax
80106c35:	5b                   	pop    %ebx
80106c36:	5e                   	pop    %esi
80106c37:	5f                   	pop    %edi
80106c38:	5d                   	pop    %ebp
80106c39:	c3                   	ret    
80106c3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106c40 <deallocuvm>:
80106c40:	55                   	push   %ebp
80106c41:	89 e5                	mov    %esp,%ebp
80106c43:	8b 55 0c             	mov    0xc(%ebp),%edx
80106c46:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106c49:	8b 45 08             	mov    0x8(%ebp),%eax
80106c4c:	39 d1                	cmp    %edx,%ecx
80106c4e:	73 10                	jae    80106c60 <deallocuvm+0x20>
80106c50:	5d                   	pop    %ebp
80106c51:	e9 4a fa ff ff       	jmp    801066a0 <deallocuvm.part.0>
80106c56:	8d 76 00             	lea    0x0(%esi),%esi
80106c59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106c60:	89 d0                	mov    %edx,%eax
80106c62:	5d                   	pop    %ebp
80106c63:	c3                   	ret    
80106c64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106c6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106c70 <freevm>:
80106c70:	55                   	push   %ebp
80106c71:	89 e5                	mov    %esp,%ebp
80106c73:	57                   	push   %edi
80106c74:	56                   	push   %esi
80106c75:	53                   	push   %ebx
80106c76:	83 ec 0c             	sub    $0xc,%esp
80106c79:	8b 75 08             	mov    0x8(%ebp),%esi
80106c7c:	85 f6                	test   %esi,%esi
80106c7e:	74 59                	je     80106cd9 <freevm+0x69>
80106c80:	31 c9                	xor    %ecx,%ecx
80106c82:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106c87:	89 f0                	mov    %esi,%eax
80106c89:	e8 12 fa ff ff       	call   801066a0 <deallocuvm.part.0>
80106c8e:	89 f3                	mov    %esi,%ebx
80106c90:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106c96:	eb 0f                	jmp    80106ca7 <freevm+0x37>
80106c98:	90                   	nop
80106c99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106ca0:	83 c3 04             	add    $0x4,%ebx
80106ca3:	39 fb                	cmp    %edi,%ebx
80106ca5:	74 23                	je     80106cca <freevm+0x5a>
80106ca7:	8b 03                	mov    (%ebx),%eax
80106ca9:	a8 01                	test   $0x1,%al
80106cab:	74 f3                	je     80106ca0 <freevm+0x30>
80106cad:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106cb2:	83 ec 0c             	sub    $0xc,%esp
80106cb5:	83 c3 04             	add    $0x4,%ebx
80106cb8:	05 00 00 00 80       	add    $0x80000000,%eax
80106cbd:	50                   	push   %eax
80106cbe:	e8 0d b6 ff ff       	call   801022d0 <kfree>
80106cc3:	83 c4 10             	add    $0x10,%esp
80106cc6:	39 fb                	cmp    %edi,%ebx
80106cc8:	75 dd                	jne    80106ca7 <freevm+0x37>
80106cca:	89 75 08             	mov    %esi,0x8(%ebp)
80106ccd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106cd0:	5b                   	pop    %ebx
80106cd1:	5e                   	pop    %esi
80106cd2:	5f                   	pop    %edi
80106cd3:	5d                   	pop    %ebp
80106cd4:	e9 f7 b5 ff ff       	jmp    801022d0 <kfree>
80106cd9:	83 ec 0c             	sub    $0xc,%esp
80106cdc:	68 e9 79 10 80       	push   $0x801079e9
80106ce1:	e8 8a 96 ff ff       	call   80100370 <panic>
80106ce6:	8d 76 00             	lea    0x0(%esi),%esi
80106ce9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106cf0 <setupkvm>:
80106cf0:	55                   	push   %ebp
80106cf1:	89 e5                	mov    %esp,%ebp
80106cf3:	56                   	push   %esi
80106cf4:	53                   	push   %ebx
80106cf5:	e8 86 b7 ff ff       	call   80102480 <kalloc>
80106cfa:	85 c0                	test   %eax,%eax
80106cfc:	74 6a                	je     80106d68 <setupkvm+0x78>
80106cfe:	83 ec 04             	sub    $0x4,%esp
80106d01:	89 c6                	mov    %eax,%esi
80106d03:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
80106d08:	68 00 10 00 00       	push   $0x1000
80106d0d:	6a 00                	push   $0x0
80106d0f:	50                   	push   %eax
80106d10:	e8 eb d6 ff ff       	call   80104400 <memset>
80106d15:	83 c4 10             	add    $0x10,%esp
80106d18:	8b 43 04             	mov    0x4(%ebx),%eax
80106d1b:	8b 53 08             	mov    0x8(%ebx),%edx
80106d1e:	83 ec 0c             	sub    $0xc,%esp
80106d21:	ff 73 0c             	pushl  0xc(%ebx)
80106d24:	29 c2                	sub    %eax,%edx
80106d26:	50                   	push   %eax
80106d27:	52                   	push   %edx
80106d28:	ff 33                	pushl  (%ebx)
80106d2a:	56                   	push   %esi
80106d2b:	e8 10 fb ff ff       	call   80106840 <mappages>
80106d30:	83 c4 20             	add    $0x20,%esp
80106d33:	85 c0                	test   %eax,%eax
80106d35:	78 19                	js     80106d50 <setupkvm+0x60>
80106d37:	83 c3 10             	add    $0x10,%ebx
80106d3a:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80106d40:	75 d6                	jne    80106d18 <setupkvm+0x28>
80106d42:	89 f0                	mov    %esi,%eax
80106d44:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106d47:	5b                   	pop    %ebx
80106d48:	5e                   	pop    %esi
80106d49:	5d                   	pop    %ebp
80106d4a:	c3                   	ret    
80106d4b:	90                   	nop
80106d4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106d50:	83 ec 0c             	sub    $0xc,%esp
80106d53:	56                   	push   %esi
80106d54:	e8 17 ff ff ff       	call   80106c70 <freevm>
80106d59:	83 c4 10             	add    $0x10,%esp
80106d5c:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106d5f:	31 c0                	xor    %eax,%eax
80106d61:	5b                   	pop    %ebx
80106d62:	5e                   	pop    %esi
80106d63:	5d                   	pop    %ebp
80106d64:	c3                   	ret    
80106d65:	8d 76 00             	lea    0x0(%esi),%esi
80106d68:	31 c0                	xor    %eax,%eax
80106d6a:	eb d8                	jmp    80106d44 <setupkvm+0x54>
80106d6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106d70 <kvmalloc>:
80106d70:	55                   	push   %ebp
80106d71:	89 e5                	mov    %esp,%ebp
80106d73:	83 ec 08             	sub    $0x8,%esp
80106d76:	e8 75 ff ff ff       	call   80106cf0 <setupkvm>
80106d7b:	a3 a4 55 11 80       	mov    %eax,0x801155a4
80106d80:	05 00 00 00 80       	add    $0x80000000,%eax
80106d85:	0f 22 d8             	mov    %eax,%cr3
80106d88:	c9                   	leave  
80106d89:	c3                   	ret    
80106d8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106d90 <clearpteu>:
80106d90:	55                   	push   %ebp
80106d91:	31 c9                	xor    %ecx,%ecx
80106d93:	89 e5                	mov    %esp,%ebp
80106d95:	83 ec 08             	sub    $0x8,%esp
80106d98:	8b 55 0c             	mov    0xc(%ebp),%edx
80106d9b:	8b 45 08             	mov    0x8(%ebp),%eax
80106d9e:	e8 7d f8 ff ff       	call   80106620 <walkpgdir>
80106da3:	85 c0                	test   %eax,%eax
80106da5:	74 05                	je     80106dac <clearpteu+0x1c>
80106da7:	83 20 fb             	andl   $0xfffffffb,(%eax)
80106daa:	c9                   	leave  
80106dab:	c3                   	ret    
80106dac:	83 ec 0c             	sub    $0xc,%esp
80106daf:	68 fa 79 10 80       	push   $0x801079fa
80106db4:	e8 b7 95 ff ff       	call   80100370 <panic>
80106db9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106dc0 <copyuvm>:
80106dc0:	55                   	push   %ebp
80106dc1:	89 e5                	mov    %esp,%ebp
80106dc3:	57                   	push   %edi
80106dc4:	56                   	push   %esi
80106dc5:	53                   	push   %ebx
80106dc6:	83 ec 1c             	sub    $0x1c,%esp
80106dc9:	e8 22 ff ff ff       	call   80106cf0 <setupkvm>
80106dce:	85 c0                	test   %eax,%eax
80106dd0:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106dd3:	0f 84 b2 00 00 00    	je     80106e8b <copyuvm+0xcb>
80106dd9:	8b 55 0c             	mov    0xc(%ebp),%edx
80106ddc:	85 d2                	test   %edx,%edx
80106dde:	0f 84 9c 00 00 00    	je     80106e80 <copyuvm+0xc0>
80106de4:	31 f6                	xor    %esi,%esi
80106de6:	eb 48                	jmp    80106e30 <copyuvm+0x70>
80106de8:	90                   	nop
80106de9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106df0:	83 ec 04             	sub    $0x4,%esp
80106df3:	81 c7 00 00 00 80    	add    $0x80000000,%edi
80106df9:	68 00 10 00 00       	push   $0x1000
80106dfe:	57                   	push   %edi
80106dff:	50                   	push   %eax
80106e00:	e8 ab d6 ff ff       	call   801044b0 <memmove>
80106e05:	58                   	pop    %eax
80106e06:	8d 93 00 00 00 80    	lea    -0x80000000(%ebx),%edx
80106e0c:	ff 75 e4             	pushl  -0x1c(%ebp)
80106e0f:	52                   	push   %edx
80106e10:	68 00 10 00 00       	push   $0x1000
80106e15:	56                   	push   %esi
80106e16:	ff 75 e0             	pushl  -0x20(%ebp)
80106e19:	e8 22 fa ff ff       	call   80106840 <mappages>
80106e1e:	83 c4 20             	add    $0x20,%esp
80106e21:	85 c0                	test   %eax,%eax
80106e23:	78 3e                	js     80106e63 <copyuvm+0xa3>
80106e25:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106e2b:	39 75 0c             	cmp    %esi,0xc(%ebp)
80106e2e:	76 50                	jbe    80106e80 <copyuvm+0xc0>
80106e30:	8b 45 08             	mov    0x8(%ebp),%eax
80106e33:	31 c9                	xor    %ecx,%ecx
80106e35:	89 f2                	mov    %esi,%edx
80106e37:	e8 e4 f7 ff ff       	call   80106620 <walkpgdir>
80106e3c:	85 c0                	test   %eax,%eax
80106e3e:	74 5c                	je     80106e9c <copyuvm+0xdc>
80106e40:	8b 18                	mov    (%eax),%ebx
80106e42:	f6 c3 01             	test   $0x1,%bl
80106e45:	74 48                	je     80106e8f <copyuvm+0xcf>
80106e47:	89 df                	mov    %ebx,%edi
80106e49:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
80106e4f:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80106e52:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
80106e58:	e8 23 b6 ff ff       	call   80102480 <kalloc>
80106e5d:	85 c0                	test   %eax,%eax
80106e5f:	89 c3                	mov    %eax,%ebx
80106e61:	75 8d                	jne    80106df0 <copyuvm+0x30>
80106e63:	83 ec 0c             	sub    $0xc,%esp
80106e66:	ff 75 e0             	pushl  -0x20(%ebp)
80106e69:	e8 02 fe ff ff       	call   80106c70 <freevm>
80106e6e:	83 c4 10             	add    $0x10,%esp
80106e71:	31 c0                	xor    %eax,%eax
80106e73:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e76:	5b                   	pop    %ebx
80106e77:	5e                   	pop    %esi
80106e78:	5f                   	pop    %edi
80106e79:	5d                   	pop    %ebp
80106e7a:	c3                   	ret    
80106e7b:	90                   	nop
80106e7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106e80:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106e83:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e86:	5b                   	pop    %ebx
80106e87:	5e                   	pop    %esi
80106e88:	5f                   	pop    %edi
80106e89:	5d                   	pop    %ebp
80106e8a:	c3                   	ret    
80106e8b:	31 c0                	xor    %eax,%eax
80106e8d:	eb e4                	jmp    80106e73 <copyuvm+0xb3>
80106e8f:	83 ec 0c             	sub    $0xc,%esp
80106e92:	68 1e 7a 10 80       	push   $0x80107a1e
80106e97:	e8 d4 94 ff ff       	call   80100370 <panic>
80106e9c:	83 ec 0c             	sub    $0xc,%esp
80106e9f:	68 04 7a 10 80       	push   $0x80107a04
80106ea4:	e8 c7 94 ff ff       	call   80100370 <panic>
80106ea9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106eb0 <uva2ka>:
80106eb0:	55                   	push   %ebp
80106eb1:	31 c9                	xor    %ecx,%ecx
80106eb3:	89 e5                	mov    %esp,%ebp
80106eb5:	83 ec 08             	sub    $0x8,%esp
80106eb8:	8b 55 0c             	mov    0xc(%ebp),%edx
80106ebb:	8b 45 08             	mov    0x8(%ebp),%eax
80106ebe:	e8 5d f7 ff ff       	call   80106620 <walkpgdir>
80106ec3:	8b 00                	mov    (%eax),%eax
80106ec5:	89 c2                	mov    %eax,%edx
80106ec7:	83 e2 05             	and    $0x5,%edx
80106eca:	83 fa 05             	cmp    $0x5,%edx
80106ecd:	75 11                	jne    80106ee0 <uva2ka+0x30>
80106ecf:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106ed4:	c9                   	leave  
80106ed5:	05 00 00 00 80       	add    $0x80000000,%eax
80106eda:	c3                   	ret    
80106edb:	90                   	nop
80106edc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106ee0:	31 c0                	xor    %eax,%eax
80106ee2:	c9                   	leave  
80106ee3:	c3                   	ret    
80106ee4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106eea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106ef0 <copyout>:
80106ef0:	55                   	push   %ebp
80106ef1:	89 e5                	mov    %esp,%ebp
80106ef3:	57                   	push   %edi
80106ef4:	56                   	push   %esi
80106ef5:	53                   	push   %ebx
80106ef6:	83 ec 1c             	sub    $0x1c,%esp
80106ef9:	8b 5d 14             	mov    0x14(%ebp),%ebx
80106efc:	8b 55 0c             	mov    0xc(%ebp),%edx
80106eff:	8b 7d 10             	mov    0x10(%ebp),%edi
80106f02:	85 db                	test   %ebx,%ebx
80106f04:	75 40                	jne    80106f46 <copyout+0x56>
80106f06:	eb 70                	jmp    80106f78 <copyout+0x88>
80106f08:	90                   	nop
80106f09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106f10:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106f13:	89 f1                	mov    %esi,%ecx
80106f15:	29 d1                	sub    %edx,%ecx
80106f17:	81 c1 00 10 00 00    	add    $0x1000,%ecx
80106f1d:	39 d9                	cmp    %ebx,%ecx
80106f1f:	0f 47 cb             	cmova  %ebx,%ecx
80106f22:	29 f2                	sub    %esi,%edx
80106f24:	83 ec 04             	sub    $0x4,%esp
80106f27:	01 d0                	add    %edx,%eax
80106f29:	51                   	push   %ecx
80106f2a:	57                   	push   %edi
80106f2b:	50                   	push   %eax
80106f2c:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80106f2f:	e8 7c d5 ff ff       	call   801044b0 <memmove>
80106f34:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106f37:	83 c4 10             	add    $0x10,%esp
80106f3a:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
80106f40:	01 cf                	add    %ecx,%edi
80106f42:	29 cb                	sub    %ecx,%ebx
80106f44:	74 32                	je     80106f78 <copyout+0x88>
80106f46:	89 d6                	mov    %edx,%esi
80106f48:	83 ec 08             	sub    $0x8,%esp
80106f4b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80106f4e:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
80106f54:	56                   	push   %esi
80106f55:	ff 75 08             	pushl  0x8(%ebp)
80106f58:	e8 53 ff ff ff       	call   80106eb0 <uva2ka>
80106f5d:	83 c4 10             	add    $0x10,%esp
80106f60:	85 c0                	test   %eax,%eax
80106f62:	75 ac                	jne    80106f10 <copyout+0x20>
80106f64:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f67:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106f6c:	5b                   	pop    %ebx
80106f6d:	5e                   	pop    %esi
80106f6e:	5f                   	pop    %edi
80106f6f:	5d                   	pop    %ebp
80106f70:	c3                   	ret    
80106f71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106f78:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f7b:	31 c0                	xor    %eax,%eax
80106f7d:	5b                   	pop    %ebx
80106f7e:	5e                   	pop    %esi
80106f7f:	5f                   	pop    %edi
80106f80:	5d                   	pop    %ebp
80106f81:	c3                   	ret    
80106f82:	66 90                	xchg   %ax,%ax
80106f84:	66 90                	xchg   %ax,%ax
80106f86:	66 90                	xchg   %ax,%ax
80106f88:	66 90                	xchg   %ax,%ax
80106f8a:	66 90                	xchg   %ax,%ax
80106f8c:	66 90                	xchg   %ax,%ax
80106f8e:	66 90                	xchg   %ax,%ax

80106f90 <shminit>:
80106f90:	55                   	push   %ebp
80106f91:	89 e5                	mov    %esp,%ebp
80106f93:	83 ec 10             	sub    $0x10,%esp
80106f96:	68 5c 7a 10 80       	push   $0x80107a5c
80106f9b:	68 c0 55 11 80       	push   $0x801155c0
80106fa0:	e8 eb d1 ff ff       	call   80104190 <initlock>
80106fa5:	c7 04 24 c0 55 11 80 	movl   $0x801155c0,(%esp)
80106fac:	e8 df d2 ff ff       	call   80104290 <acquire>
80106fb1:	b8 f4 55 11 80       	mov    $0x801155f4,%eax
80106fb6:	83 c4 10             	add    $0x10,%esp
80106fb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106fc0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80106fc6:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
80106fcd:	83 c0 0c             	add    $0xc,%eax
80106fd0:	c7 40 fc 00 00 00 00 	movl   $0x0,-0x4(%eax)
80106fd7:	3d f4 58 11 80       	cmp    $0x801158f4,%eax
80106fdc:	75 e2                	jne    80106fc0 <shminit+0x30>
80106fde:	83 ec 0c             	sub    $0xc,%esp
80106fe1:	68 c0 55 11 80       	push   $0x801155c0
80106fe6:	e8 c5 d3 ff ff       	call   801043b0 <release>
80106feb:	83 c4 10             	add    $0x10,%esp
80106fee:	c9                   	leave  
80106fef:	c3                   	ret    

80106ff0 <shm_open>:
80106ff0:	55                   	push   %ebp
80106ff1:	31 c0                	xor    %eax,%eax
80106ff3:	89 e5                	mov    %esp,%ebp
80106ff5:	5d                   	pop    %ebp
80106ff6:	c3                   	ret    
80106ff7:	89 f6                	mov    %esi,%esi
80106ff9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107000 <shm_close>:
80107000:	55                   	push   %ebp
80107001:	31 c0                	xor    %eax,%eax
80107003:	89 e5                	mov    %esp,%ebp
80107005:	5d                   	pop    %ebp
80107006:	c3                   	ret    
