Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65C1712DF25
	for <lists+linux-hwmon@lfdr.de>; Wed,  1 Jan 2020 15:36:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725876AbgAAOgx (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 1 Jan 2020 09:36:53 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33783 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbgAAOgx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 1 Jan 2020 09:36:53 -0500
Received: by mail-lj1-f193.google.com with SMTP id y6so30440346lji.0
        for <linux-hwmon@vger.kernel.org>; Wed, 01 Jan 2020 06:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8O70E37h24vkoHiMNJvNiwTAZ71A5RPO6yfcxT8SqIQ=;
        b=HerjmcCR/AkztR7YuD0XP2NDZIC/Q5IMdllq8QBoARmG5gh1G0ca8btZLYCc7agV9p
         07cxuV6+/WQV0D70gORpg+QS4E8AyBw6WNZGDp7bPUmIqv2YqIwVJTOCDE5hLwIdIGuW
         d/51lVyK7p792csF4U7Zf+2Uo7u2oJyT8whIZ+R6EMYHaOdjmyBNck8Oxrz8pqR9cp+Q
         +wBoSV89JZTt9ML7bRPss6JiPLYO2HqTfk2E/5Ygyn6eg/7UrXznON3nzjoEtsYpEG9/
         B6WglfQ4NazSCPCSf5kNLo3LyBwmPechg61U5mXfUImi9h+fxlwKoSirJDN9JnahBZlj
         63Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8O70E37h24vkoHiMNJvNiwTAZ71A5RPO6yfcxT8SqIQ=;
        b=BuyGzUddSII7fQ3KuYYlBCqh5jlnIiVE7uVheYY3hQCJBANZd/2iPDjJNDndBRoXzy
         YcPOaTk76zn+S6eRqX9luJGgz5sHxiApzKxNdzmcvTyRVztxlYmEo01acjjd46h/GznI
         h1dbu+UyaXnETsskmzcoV1Qgs5XPgDVM5MZvceEo46W6vrH/V58gJQKjAP8xsi6SSNtX
         E1akrdtpBloCYyc2pfkseqEMmFygGKXMS67/yU/Y70CetrtQz+vrVvv7jwWuN8frlAqc
         pNbqLzDR3WcdrHoU+yn98ZVMETutUl5tVpsXkCg09ehvLCvD0w0HK+Ng4elvlvTyHJVk
         MFEg==
X-Gm-Message-State: APjAAAXHqlL865F0W8znurG9p0NrimNnJs0iHg9lY3GmZ5DphqKB5EG2
        VzwEzg7LOBnVh9dG0OuUaL9wt5/xs8iGm37E6+wwiQ==
X-Google-Smtp-Source: APXvYqzt9vsXSeRCw3uCB3GWXCfo51EaaziA1khmXLcgZ0iBGlbzvQULCBw/u6Az40zhZlPPLgjyollLCWEkt22Nr2A=
X-Received: by 2002:a2e:b4f6:: with SMTP id s22mr46532718ljm.218.1577889411528;
 Wed, 01 Jan 2020 06:36:51 -0800 (PST)
MIME-Version: 1.0
References: <20191226175051.31664-1-linux@roeck-us.net> <20191226175051.31664-2-linux@roeck-us.net>
In-Reply-To: <20191226175051.31664-2-linux@roeck-us.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 1 Jan 2020 15:36:40 +0100
Message-ID: <CACRpkdb8rehAPKE2Zu-Jf4TSE2m6ks91vZdrVy+HitijabeVbg@mail.gmail.com>
Subject: Re: [RFT PATCH v3 1/1] hwmon: Driver for disk and solid state drives
 with temperature sensors
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-scsi@vger.kernel.org, linux-ide@vger.kernel.org,
        Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Dec 26, 2019 at 6:51 PM Guenter Roeck <linux@roeck-us.net> wrote:

> Reading the temperature of ATA drives has been supported for years
> by userspace tools such as smarttools or hddtemp. The downside of
> such tools is that they need to run with super-user privilege, that
> the temperatures are not reported by standard tools such as 'sensors'
> or 'libsensors', and that drive temperatures are not available for use
> in the kernel's thermal subsystem.
(...)
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Martin K. Petersen <martin.petersen@oracle.com>
> Cc: Bart Van Assche <bvanassche@acm.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

I took the v3 patch for a test run on the D-Link DIR-695 NAS/router
and it works like a charm.

With a few additional patches (that I am
starting to upstream) the temperature zone in the drive can be used
to control the GPIO-based fan in the NAS to keep the enclosure/chassis
temperature down.

I define a thermal zone in device tree like this:

+       thermal-zones {
+               chassis-thermal {
+                       /* Poll every 20 seconds */
+                       polling-delay = <20000>;
+                       /* Poll every 2nd second when cooling */
+                       polling-delay-passive = <2000>;
+                       /*  Use the thermal sensor in the hard drive */
+                       thermal-sensors = <&sata_drive>;
+
+                       /* Tripping points from the fan.script in the rootfs */
+                       trips {
+                               alert: chassis-alert {
+                                       /* At 43 degrees turn on the fan */
+                                       temperature = <43000>;
+                                       hysteresis = <3000>;
+                                       type = "active";
+                               };
+                               crit: chassis-crit {
+                                       /* Just shut down at 60 degrees */
+                                       temperature = <60000>;
+                                       hysteresis = <2000>;
+                                       type = "critical";
+                               };
+                       };
+
+                       cooling-maps {
+                               map0 {
+                                       trip = <&alert>;
+                                       cooling-device = <&fan0 1 1>;
+                               };
+                       };
+               };
+       };
(...)
                pata-controller@63000000 {
                        status = "okay";
+
+                       /*
+                        * This drive may have a temperature sensor with a
+                        * thermal zone we can use for thermal control of the
+                        * chassis temperature using the fan.
+                        */
+                       sata_drive: drive@0 {
+                               reg = <0>;
+                               #thermal-sensor-cells = <0>;
+                       };
                };

The temperature started out at household temperature 26 degrees
this morning, leaving the device running it gradually reached
the trip point at 43 degrees and runs the fan. It then switches
the fan off/on with some hysteresis keeping the temperature
around 43 degreed.

The PID-controller in the thermal framework handles it all
in-kernel as expected.

Tested-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
