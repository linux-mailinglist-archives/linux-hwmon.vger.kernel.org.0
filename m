Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F7031BD4B2
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Apr 2020 08:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbgD2GdZ (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 29 Apr 2020 02:33:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbgD2GdY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 29 Apr 2020 02:33:24 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A12AC03C1AD
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Apr 2020 23:33:23 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id d17so1011223wrg.11
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Apr 2020 23:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=FalhFLP6E8s3NKoZ3mocGoumscHehcVbJvsfHxyqr68=;
        b=jcnk+SmN7gJoXA+rIYyNYv+mdewstAhguOXgIdfAfe2l50i2EinJIhjLCL15A/RN9u
         No4J0Js2Ychj7f9w/5cum7T4uLtrgTmGd2MNWr8rCMNUA0gA5zOmA86WdT28zIV73TS8
         g/0CwMME2kbePSa/mi0q0UGiHtOUSkLLz79lr8sPJjK5MQNH2yH7dafzXwTM7cuANhgi
         jan5DFEZ5VtOzRh01Jm+8LoX8Jy1xzq3dTZGekqdygLWaKqu5rVpsoullD2LtdcurIZY
         aeA/zF5pI7UmHP/OYShsRPXDldLiyBRspOBzo99bh4Z5dPuzXfI4INmCR3UPpp05DH7R
         ls7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=FalhFLP6E8s3NKoZ3mocGoumscHehcVbJvsfHxyqr68=;
        b=uMLJwLOmqnCG1V7uV5EBUePunK4GMi+ZzLLM6EyC4lRlpuXexTEFHq30coh8XX+78T
         00bnqjvS6DCU79JJn6qe/CeMxQmBBt8yIvnHjX8pk8Cda9S1xwMkVupPcupBGf9efXl/
         f72vgCc3oLEth6EhRZPOJJ8CR4hgAnBJ0C5z7A0IOgAz3qJPukqDdGAaG7CTTgaSQWhX
         PGtezSt2qa8zddsfj4LG/G/QY7iIKE9JxP6iIiCmLqTQeV7Hli+GhC4ZSMg+ub/rLy1I
         a8j3dpn8x3CRSTRnM5j0QOLFmxRoy/ga3ZCDuR8HTwgjqzcUjrj8qbAIjAjBFdyDTdxR
         MpJQ==
X-Gm-Message-State: AGi0Puag1mbVat0Ip+8dcZD3BYqRlaGkz1ESADwhOFLh6IDlRg/O9MUP
        KY70FBwTeTtgheknVZqbHEzPYA==
X-Google-Smtp-Source: APiQypJCmA2kezBe5CdrbA/94VscVCu2n5N0CMovezJRRNOvUbUsbGv7XxjfwQeHhPFqWFZRZr/poA==
X-Received: by 2002:adf:e541:: with SMTP id z1mr36924430wrm.218.1588142001918;
        Tue, 28 Apr 2020 23:33:21 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id h188sm6815465wme.8.2020.04.28.23.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 23:33:21 -0700 (PDT)
Date:   Wed, 29 Apr 2020 07:33:19 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux HWMON List <linux-hwmon@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Robert Jones <rjones@gateworks.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v8 2/3] mfd: add Gateworks System Controller core driver
Message-ID: <20200429063319.GV3559@dell>
References: <1585341214-25285-1-git-send-email-tharvey@gateworks.com>
 <1585341214-25285-3-git-send-email-tharvey@gateworks.com>
 <20200428094426.GL3559@dell>
 <CAJ+vNU0UCugbM7Q7WZ1Hw-U=Je483jYGdrvS0Vq6idxtuUmz2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+vNU0UCugbM7Q7WZ1Hw-U=Je483jYGdrvS0Vq6idxtuUmz2Q@mail.gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 28 Apr 2020, Tim Harvey wrote:

> On Tue, Apr 28, 2020 at 2:44 AM Lee Jones <lee.jones@linaro.org> wrote:
> >
> <snip>
> > > +
> > > +static int gsc_probe(struct i2c_client *client)
> > > +{
> > > +     struct device *dev = &client->dev;
> > > +     struct gsc_dev *gsc;
> > > +     int ret;
> > > +     unsigned int reg;
> > > +
> > > +     gsc = devm_kzalloc(dev, sizeof(*gsc), GFP_KERNEL);
> > > +     if (!gsc)
> > > +             return -ENOMEM;
> > > +
> > > +     gsc->dev = &client->dev;
> > > +     gsc->i2c = client;
> > > +     i2c_set_clientdata(client, gsc);
> > > +
> > > +     gsc->bus.reg_write = gsc_regmap_regwrite;
> > > +     gsc->bus.reg_read = gsc_regmap_regread;
> >
> > Why do you need to store these in ddata?
> 
> Lee,
> 
> Thanks for the review!
> 
> I need the remap_bus* for devm_regmap_init() in the hwmon sub-module driver:
> 
> hwmon->regmap = devm_regmap_init(dev, &gsc->bus, gsc->i2c_hwmon,
> &gsc_hwmon_regmap_config);
> 
> Is there something easier I'm missing?

This is an odd setup.  I haven't seen one driver registering another
driver's Regmap call-backs before, related or otherwise.  Normally the
Regmap is setup (initialised) in the parent driver and child drivers
just make use of it.  Here it looks like you are registering 2
separate Regmaps, but using the same call-backs for both, which seems
wrong to me.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
