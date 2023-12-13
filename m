Return-Path: <linux-hwmon+bounces-399-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42607809C94
	for <lists+linux-hwmon@lfdr.de>; Fri,  8 Dec 2023 07:48:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7391A1C209E1
	for <lists+linux-hwmon@lfdr.de>; Fri,  8 Dec 2023 06:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2258463AF;
	Fri,  8 Dec 2023 06:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="jxfxlJoq"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D731724
	for <linux-hwmon@vger.kernel.org>; Thu,  7 Dec 2023 22:48:07 -0800 (PST)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id EA28B240103
	for <linux-hwmon@vger.kernel.org>; Fri,  8 Dec 2023 07:48:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1702018084; bh=XHW0wpRIcKcG33IpWEqGDMS0yycm1FN2SxUGJcODXsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=jxfxlJoqiQRkZnHGhAiJ2yyjS1igfIsmI0OA1KmF3SBRlAtwMtkS4qIBLJ3U4m56E
	 5vZ4q1zJ0Tcl1E5db5wo/e1uMOFdA75YpqsGuFVaA2vBmfs2M2JhjFC4lQjJlm+tvu
	 SbjAaBS3BmnfVBFxiEQsN3ZxebaZoYt70MSpWyND+4Nko70ToSHWXajREL2j1/xPl1
	 SgCtvMBx5th8+Rq7sJfPUjw500Gj7pDfypiDqqeIn7AyW+TeuwZsGoaIjHt26Xlwoy
	 uyjXc+nLQOIEkNY76yfhDPnPfm60GVOGRFyXpNW5E1lttpgCrqmllGa6i8DyAva4CJ
	 8fFQN8UAC4wPQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4SmhXy6Zfqz6tvc;
	Fri,  8 Dec 2023 07:48:02 +0100 (CET)
Date: Fri,  8 Dec 2023 06:48:02 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (corsair-psu) Fix probe when built-in
Message-ID: <20231208074802.56bb2d78@posteo.net>
In-Reply-To: <20231207210723.222552-1-W_Armin@gmx.de>
References: <20231207210723.222552-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  7 Dec 2023 22:07:23 +0100
Armin Wolf <W_Armin@gmx.de> wrote:

> It seems that when the driver is built-in, the HID bus is
> initialized after the driver is loaded, which whould cause
> module_hid_driver() to fail.
> Fix this by registering the driver after the HID bus using
> late_initcall() in accordance with other hwmon HID drivers.
> 
> Compile-tested only.

So you did not test this? Well, I did.

[    2.225831] Driver 'corsair-psu' was unable to register with bus_type 'hid' because the bus was not initialized.
[    2.225835] amd_pstate: driver load is disabled, boot with specific mode to enable this
[    2.226363] ledtrig-cpu: registered to indicate activity on CPUs
[    2.226679] hid: raw HID events driver (C) Jiri Kosina

You are right, it is a timing issue and this can actually happen. I'm fine with
the fix.

Though, this could even be a bigger issue. There are currently 104 HID drivers
using the module_hid_driver macro. Maybe it would be a better idea to change the
module_hid_driver macro to use the lateinit calls instead of the plain init/exit
calls.

greetings,
Will

> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/hwmon/corsair-psu.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
> index 904890598c11..2c7c92272fe3 100644
> --- a/drivers/hwmon/corsair-psu.c
> +++ b/drivers/hwmon/corsair-psu.c
> @@ -899,7 +899,23 @@ static struct hid_driver corsairpsu_driver = {
>  	.reset_resume	= corsairpsu_resume,
>  #endif
>  };
> -module_hid_driver(corsairpsu_driver);
> +
> +static int __init corsair_init(void)
> +{
> +	return hid_register_driver(&corsairpsu_driver);
> +}
> +
> +static void __exit corsair_exit(void)
> +{
> +	hid_unregister_driver(&corsairpsu_driver);
> +}
> +
> +/*
> + * With module_init() the driver would load before the HID bus when
> + * built-in, so use late_initcall() instead.
> + */
> +late_initcall(corsair_init);
> +module_exit(corsair_exit);
> 
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Wilken Gottwalt <wilken.gottwalt@posteo.net>");
> --
> 2.39.2
> 


