Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD593473DA
	for <lists+linux-hwmon@lfdr.de>; Wed, 24 Mar 2021 09:44:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234269AbhCXIoU (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 24 Mar 2021 04:44:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233902AbhCXIoM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 24 Mar 2021 04:44:12 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61C98C0613DE
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Mar 2021 01:44:09 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id k8so23532132wrc.3
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Mar 2021 01:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=UQ2hEc/oKz/yz+r+7NuRxm3ZC0agePHpnR729978KoI=;
        b=RSnt7rd9lYoXNzEF+9JE/tc8BCcDWtfDeVS4E7zKZ259RqNy3gjZPOYAuWcj+gD4A9
         f1cQpvFaYbVUUlkV9rlp3Ehumovc5ht43lMUzjkaqYmIcQ1RBRNlTkYGm7vb/dmsmX8e
         EW90VGgNe4dqXbHEcCN1j9VXyARCWk7RsitkyLYEG+4s4IfY2oCoN6u0WTmxAruRbvMi
         RacPwr35ETjM53WPxeSqzzDUDakBWW50yGjMp2gZ3hBNUHT7L5AN6uwxsXUbA2ZK8Afp
         Z4UIoL8M/rJT8JRjdhT6uJZ2PaPnix8qHkRgXreun/J5FjtdBvTgOgh7QKzwE7RaqJOI
         rMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=UQ2hEc/oKz/yz+r+7NuRxm3ZC0agePHpnR729978KoI=;
        b=aq6aMLvW+UjbrYPb9470FkpZTjRVuuBgaFEkTVLoDHltcdAfXEWBaMoepMBoNP1vNG
         t+7DGhX5yg61wxict7HV8Z69dIIn4F5Ad2jOZRcLtnaMask9S397laJtTqIYKfUcSyV9
         fCkiiCzEF1zJKzRgfBxgNDFo46s6ZchjW/2NEIoCrO4xnMnYDXpX8E9FywQfKCps/W3p
         k/5D82IXoXKzhyB8kW7jbZGS66L6vuA1wjhO6gHjJLeSPvT1teX84ipN0lIAbprw5BCP
         EtrSAFUXCPmgONuRmeksSVj5CG5Xssy23CjSTt5PPHL8On/F2Bv17DXVpQUvNy8tbkDC
         q4Og==
X-Gm-Message-State: AOAM5337nO0VLj8nakv7nK5FqhiR36h7lxfsxa0H93LfolQj0Z0cNDyi
        HURmLE+9p0K1C2ysPhGXrNJxaQ==
X-Google-Smtp-Source: ABdhPJxbjraC5qErKMa/evjqnlAdHTKKuHn477iabRv3jVV+MslLw0iV5FtKJacjdVJVefgrlSt89w==
X-Received: by 2002:adf:f9d0:: with SMTP id w16mr2279442wrr.336.1616575447973;
        Wed, 24 Mar 2021 01:44:07 -0700 (PDT)
Received: from dell ([91.110.221.180])
        by smtp.gmail.com with ESMTPSA id i3sm2090329wra.66.2021.03.24.01.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 01:44:07 -0700 (PDT)
Date:   Wed, 24 Mar 2021 08:44:05 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     "Campion.Kang" <Campion.Kang@advantech.com.tw>
Cc:     "chia-lin.kao@canonical.com" <chia-lin.kao@canonical.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "Campion.Kang@gmail.com" <Campion.Kang@gmail.com>
Subject: Re: [PATCH v6 4/6] mfd: ahc1ec0: Add support for Advantech embedded
 controller
Message-ID: <20210324084405.GB2916463@dell>
References: <20210309160755.GR4931@dell>
 <20210319100105.18278-1-campion.kang@advantech.com.tw>
 <20210319141443.GI2916463@dell>
 <f47a66c80d8b4cf6b9c28a4519a10521@Taipei11.ADVANTECH.CORP>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f47a66c80d8b4cf6b9c28a4519a10521@Taipei11.ADVANTECH.CORP>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 24 Mar 2021, Campion.Kang wrote:

> Thanks a lot, please see below descriptions.
> 
> >-----Original Message-----
> >From: Lee Jones <lee.jones@linaro.org>
> >Sent: Friday, March 19, 2021 10:15 PM
> >To: Campion.Kang <Campion.Kang@advantech.com.tw>
> >Cc: chia-lin.kao@canonical.com; devicetree@vger.kernel.org;
> >jdelvare@suse.com; linux-hwmon@vger.kernel.org;
> >linux-kernel@vger.kernel.org; linux-watchdog@vger.kernel.org;
> >linux@roeck-us.net; robh+dt@kernel.org; wim@linux-watchdog.org;
> >Campion.Kang@gmail.com
> >Subject: Re: [PATCH v6 4/6] mfd: ahc1ec0: Add support for Advantech
> >embedded controller
> >
> >On Fri, 19 Mar 2021, Campion Kang wrote:
> >
> >>
> >> Please check [Campion] text in below as my reply.
> >
> >This is a mess.  Please setup your mailer to quote correctly.
> >
> >> Sorry, due to the mail was rejected by vger.kernel.org as SPAM before
> >> so I reply the mail late and had some test email before.
> >>
> >> -----------------------------------------------------------------------------------------
> >> Date:   Tue, 9 Mar 2021 16:07:55 +0000
> >> From:   Lee Jones <lee.jones@linaro.org>
> >
> >[...]
> >
> >> > +enum {
> >> > +	ADVEC_SUBDEV_BRIGHTNESS = 0,
> >> > +	ADVEC_SUBDEV_EEPROM,
> >> > +	ADVEC_SUBDEV_GPIO,
> >> > +	ADVEC_SUBDEV_HWMON,
> >> > +	ADVEC_SUBDEV_LED,
> >> > +	ADVEC_SUBDEV_WDT,
> >> > +	ADVEC_SUBDEV_MAX,
> >> > +};
> >>
> >> Are these arbitrary?
> >> [Campion] cannot arbitrary there, due to it is a index to identify its number
> >of sub device.
> >
> >I'm asking what this is dictated by.
> >
> >Are these ID/index values written into H/W?
> >
> 
> These index written in BIOS ACPI table. 

Please consider renaming to make this clear.

  ADVEC_ACPI_ID_{DEVICE}

Add a comment to express the importance of the order too.

[...]

> >> > +int write_gpio_dir(struct adv_ec_platform_data *adv_ec_data, unsigned
> >char PinNumber,
> >> > +		unsigned char value)
> >> > +{
> >> > +}
> >>
> >> All of the GPIO functions above should move into drivers/gpio.
> >>
> >> [Campion] Due to it has a flow need to cowork with EC chip and firmware, it
> >cannot be interrupt
> >>           by other functions. So it needs to keep in here.
> >
> >Please provide more details.
> 
> These gpio functions are common used for gpio to adjust the gpio direction and access its status. It has a complete lower process with EC that cannot be interrupted likes others. The flow is:
> 0.mutex lock to get the EC access
> 1.it needs wait IBF (Input Buffer Full) to be clear and then can send the command
> 2.Send read command to EC command port
> 3.wait IBF clear that means command is got by EC
> 4.send read address to EC data port
> 5.wait OBF (Output Buffer Full) data ready
> 6.get data from EC data port
> 7.mutex unlock
> So it cannot be interrupted as other EC lower access due to they use the same mutex to lock the flow. 

That's fine.  You can share a lock with the GPIO driver.

> >>           But vger.kernel.org returned the mail to mail as spam mail.
> >>           I will modity it as the following, is it OK?
> >>           examples:
> >>             - |
> >>           #include <dt-bindings/mfd/ahc1ec0-dt.h>
> >>           ahc1ec0 {
> >>                   compatible = "advantech,ahc1ec0";
> >>
> >>                   advantech,hwmon-profile =
> ><AHC1EC0_HWMON_PRO_UNO2271G>;
> >>                   advantech,watchdog = true;
> >
> >Shouldn't the watchdog be it's own sub-node?
> 
> it doesnot need so far. 

IMO, it's more clear than having a property.

[...]

> [Campion.Kang] So far, some registers or settings are have default value. They can be adjusted by runtime. 
> Is this ahc1ec0.yaml OK?

Rob has the final say on that.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
