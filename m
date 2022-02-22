Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DACAB4C023D
	for <lists+linux-hwmon@lfdr.de>; Tue, 22 Feb 2022 20:47:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbiBVTrZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-hwmon@lfdr.de>); Tue, 22 Feb 2022 14:47:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235250AbiBVTrY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Feb 2022 14:47:24 -0500
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9458FB1AAB
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Feb 2022 11:46:57 -0800 (PST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-306-2WeA3KeLOciB1wQtZYeJKA-1; Tue, 22 Feb 2022 19:46:54 +0000
X-MC-Unique: 2WeA3KeLOciB1wQtZYeJKA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Tue, 22 Feb 2022 19:46:53 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Tue, 22 Feb 2022 19:46:53 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     =?iso-8859-1?Q?=27Pali_Roh=E1r=27?= <pali@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>
CC:     Armin Wolf <W_Armin@gmx.de>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4] hwmon: (dell-smm) Improve assembly code
Thread-Topic: [PATCH v4] hwmon: (dell-smm) Improve assembly code
Thread-Index: AQHYKBTirAZeqAMZek+3xwZDQ1am1ayf9nqA
Date:   Tue, 22 Feb 2022 19:46:53 +0000
Message-ID: <b3cecea1376f4080929f47da2529685c@AcuMS.aculab.com>
References: <20220220190851.17965-1-W_Armin@gmx.de>
 <20220222165432.GA255373@roeck-us.net> <20220222175150.qs32v4outislnqj6@pali>
In-Reply-To: <20220222175150.qs32v4outislnqj6@pali>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Pali Rohár
> Sent: 22 February 2022 17:52
> 
> On Tuesday 22 February 2022 08:54:32 Guenter Roeck wrote:
> > On Sun, Feb 20, 2022 at 08:08:51PM +0100, Armin Wolf wrote:
> > > The new assembly code works on both 32 bit and 64 bit
> > > cpus and allows for more compiler optimisations.
> > > Since clang runs out of registers on 32 bit x86 when
> > > using CC_OUT, we need to execute "setc" ourself.
> > > Also modify the debug message so we can still see
> > > the result (eax) when the carry flag was set.
> > >
> > > Tested with 32 bit and 64 bit kernels on a Dell Inspiron 3505.
> > >
> > > Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> >
> > It would be great if I can get some Tested-by/Acked-by/Reviewed-by
> > tags for this patch.
> 
> Well, I know about this driver asm code for a long time and it since
> beginning it was suspicious for me, why there is such huge code with
> stack and registers manipulation and why it cannot be implemented easily
> via just two "out" instructions. This patch is exactly doing it.
> But question reminds why it was written in this simple way since
> beginning.
> 
> If this change is correct then I have no problem with it.
> 
> But I would rather see review of this asm change by skilled x86 asm
> developer. We are dealing here with CPU 0, SMM x86 mode, I/O ports and
> stack manipulation in inline gcc asm which sounds like a trap. And I'm
> not feeling skilled for reviewing this change.
> 
> May I ask somebody to review this change? Is there some linux x86 ML?

On the face of it the new asm code is basically the same as the old
asm code - and both are probably equivalent to the reverse engineered
windows code.

The real problem isn't the new code, it is more 'WTF is actually going on'.
Somehow the pair of outb are generating a synchronous (or synchronous
enough) trap that the trap handler (in the smm code in the bios)
can change the registers before the code following the outb saves
them back to memory.

SMM mode is a semi-hidden cpu mode usually entered by an interrupt.
It is horrid and nasty because it has access to the cpu memory and
registers, but is hidden and unknown (I think in the bios).

Normal bios calls can (usually) be executed using a cpu emulator
(especially useful for doing real-mode call from 64bit mode) so
the kernel can limit what they can do.

But SMM mode is nearly as bad as the ME processor on newer systems.
If you worry about security you really want it disabled - but you can't.

As far as this patch goes I think I'd add a 'stc' (set carry)
instruction before the first 'outb'.
Then if the 'something magic happens here' doesn't happen (because
you aren't on the right kind of motherboard) the action fails.

	David

> 
> > Thanks,
> > Guenter
> >
> > > ---
> > > Changes in v4:
> > > - reword commit message
> > >
> > > Changes in v3:
> > > - make carry an unsigned char
> > > - use "+a", ... for output registers
> > > - drop "cc" from clobbered list
> > >
> > > Changes in v2:
> > > - fix clang running out of registers on 32 bit x86
> > > - modify debug message
> > > ---
> > >  drivers/hwmon/dell-smm-hwmon.c | 78 ++++++++--------------------------
> > >  1 file changed, 18 insertions(+), 60 deletions(-)
> > >
> > > --
> > > 2.30.2
> > >
> > > diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> > > index c5939e68586d..38d23a8e83f2 100644
> > > --- a/drivers/hwmon/dell-smm-hwmon.c
> > > +++ b/drivers/hwmon/dell-smm-hwmon.c
> > > @@ -119,7 +119,7 @@ struct smm_regs {
> > >  	unsigned int edx;
> > >  	unsigned int esi;
> > >  	unsigned int edi;
> > > -} __packed;
> > > +};
> > >
> > >  static const char * const temp_labels[] = {
> > >  	"CPU",
> > > @@ -164,74 +164,32 @@ static int i8k_smm_func(void *par)
> > >  	struct smm_regs *regs = par;
> > >  	int eax = regs->eax;
> > >  	int ebx = regs->ebx;
> > > +	unsigned char carry;
> > >  	long long duration;
> > > -	int rc;
> > >
> > >  	/* SMM requires CPU 0 */
> > >  	if (smp_processor_id() != 0)
> > >  		return -EBUSY;
> > >
> > > -#if defined(CONFIG_X86_64)
> > > -	asm volatile("pushq %%rax\n\t"
> > > -		"movl 0(%%rax),%%edx\n\t"
> > > -		"pushq %%rdx\n\t"
> > > -		"movl 4(%%rax),%%ebx\n\t"
> > > -		"movl 8(%%rax),%%ecx\n\t"
> > > -		"movl 12(%%rax),%%edx\n\t"
> > > -		"movl 16(%%rax),%%esi\n\t"
> > > -		"movl 20(%%rax),%%edi\n\t"
> > > -		"popq %%rax\n\t"
> > > -		"out %%al,$0xb2\n\t"
> > > -		"out %%al,$0x84\n\t"
> > > -		"xchgq %%rax,(%%rsp)\n\t"
> > > -		"movl %%ebx,4(%%rax)\n\t"
> > > -		"movl %%ecx,8(%%rax)\n\t"
> > > -		"movl %%edx,12(%%rax)\n\t"
> > > -		"movl %%esi,16(%%rax)\n\t"
> > > -		"movl %%edi,20(%%rax)\n\t"
> > > -		"popq %%rdx\n\t"
> > > -		"movl %%edx,0(%%rax)\n\t"
> > > -		"pushfq\n\t"
> > > -		"popq %%rax\n\t"
> > > -		"andl $1,%%eax\n"
> > > -		: "=a"(rc)
> > > -		:    "a"(regs)
> > > -		:    "%ebx", "%ecx", "%edx", "%esi", "%edi", "memory");
> > > -#else
> > > -	asm volatile("pushl %%eax\n\t"
> > > -	    "movl 0(%%eax),%%edx\n\t"
> > > -	    "push %%edx\n\t"
> > > -	    "movl 4(%%eax),%%ebx\n\t"
> > > -	    "movl 8(%%eax),%%ecx\n\t"
> > > -	    "movl 12(%%eax),%%edx\n\t"
> > > -	    "movl 16(%%eax),%%esi\n\t"
> > > -	    "movl 20(%%eax),%%edi\n\t"
> > > -	    "popl %%eax\n\t"
> > > -	    "out %%al,$0xb2\n\t"
> > > -	    "out %%al,$0x84\n\t"
> > > -	    "xchgl %%eax,(%%esp)\n\t"
> > > -	    "movl %%ebx,4(%%eax)\n\t"
> > > -	    "movl %%ecx,8(%%eax)\n\t"
> > > -	    "movl %%edx,12(%%eax)\n\t"
> > > -	    "movl %%esi,16(%%eax)\n\t"
> > > -	    "movl %%edi,20(%%eax)\n\t"
> > > -	    "popl %%edx\n\t"
> > > -	    "movl %%edx,0(%%eax)\n\t"
> > > -	    "lahf\n\t"
> > > -	    "shrl $8,%%eax\n\t"
> > > -	    "andl $1,%%eax\n"
> > > -	    : "=a"(rc)
> > > -	    :    "a"(regs)
> > > -	    :    "%ebx", "%ecx", "%edx", "%esi", "%edi", "memory");
> > > -#endif
> > > -	if (rc != 0 || (regs->eax & 0xffff) == 0xffff || regs->eax == eax)
> > > -		rc = -EINVAL;
> > > +	asm volatile("out %%al,$0xb2\n\t"
> > > +		     "out %%al,$0x84\n\t"
> > > +		     "setc %0\n"
> > > +		     : "=mr" (carry),
> > > +		       "+a" (regs->eax),
> > > +		       "+b" (regs->ebx),
> > > +		       "+c" (regs->ecx),
> > > +		       "+d" (regs->edx),
> > > +		       "+S" (regs->esi),
> > > +		       "+D" (regs->edi));
> > >
> > >  	duration = ktime_us_delta(ktime_get(), calltime);
> > > -	pr_debug("smm(0x%.4x 0x%.4x) = 0x%.4x  (took %7lld usecs)\n", eax, ebx,
> > > -		 (rc ? 0xffff : regs->eax & 0xffff), duration);
> > > +	pr_debug("smm(0x%.4x 0x%.4x) = 0x%.4x carry: %d (took %7lld usecs)\n",
> > > +		 eax, ebx, regs->eax & 0xffff, carry, duration);
> > >
> > > -	return rc;
> > > +	if (carry || (regs->eax & 0xffff) == 0xffff || regs->eax == eax)
> > > +		return -EINVAL;
> > > +
> > > +	return 0;
> > >  }
> > >
> > >  /*

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

