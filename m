Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0D838C28C
	for <lists+linux-hwmon@lfdr.de>; Fri, 21 May 2021 11:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235157AbhEUJF0 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 21 May 2021 05:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235175AbhEUJFZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 May 2021 05:05:25 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FAB3C061574
        for <linux-hwmon@vger.kernel.org>; Fri, 21 May 2021 02:04:01 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id c14so18495045wrx.3
        for <linux-hwmon@vger.kernel.org>; Fri, 21 May 2021 02:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=NVeFvnslJm0NrUQoEG65cVcipY5NIH0ZF36v3zq0FTg=;
        b=og2k8/CLk2k/C88E/bMpECPEveew+ihVAZE8yefd7VEVD6xcfUaGDOwdZzpdgLH1kf
         BeEQy5oj++ccKoLUpvj7ToMHYdPUh0JfHZW7djmv4yUAlGLKRHyyFb62n4kT49s7iCiN
         PTPT1m4f2VYtK2k7wWHcUyV9D1wsRu3SrC7ziGkG33pSquRv64HnYxqU3mvPu9t+/VNF
         yG74Ob9PIhSkuY0hPGgLCofWkjFQW7ghmIrmkyLcB6xEQpZHJltAPRAGUeaph+NcPB7y
         nsVCtYr4y7srRTBBGgZjeYMca2NCUq2Db1O+GEdSLovs/gsmVwIi8qv8PiMOE/2EQ+hq
         uzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=NVeFvnslJm0NrUQoEG65cVcipY5NIH0ZF36v3zq0FTg=;
        b=HMyXRBz5I0er0GpxO5WWfMQ21JJQOrhVNQ/nr8SoAo8MlsTFFxPxfpYk/IBST46cXh
         eZA/B3nEBYrcgAOxPVDdowQA4LWOSWtVOAJY1knAWW2kjp2Diobdd9fMeXfTIWPJ7U3s
         KfRExT9QrOSuz40Wes3Yg9/+jUoOvvd1ETfXA0Gv9Yw7Z0+H+gg6+4bjcPvkHoYJCgNg
         B2Reu/snuwndFda+fqQvNmB4bUFPzlKR4rCTNsQdibMpUFyGIInTQrLB0S0kwt8V1pnu
         Bzw9ubRx6WmcnNQogk9D61rh1irELDiE2ZANDsRHrl+TKsAuMqRI3DmJAX0Uxq8ZhWvl
         gYTA==
X-Gm-Message-State: AOAM533T7279xgAEXaup/p+5v8oQzaT474cNe+qEFoct0O+ImcpfiEt7
        LxRJkl/xxOhV1hBa/5w5/cpXGQ==
X-Google-Smtp-Source: ABdhPJxGMHN79aI1VciSmLzY53Q40z6lvTHZkKTHQkNh6HslHR8WvnxN8dBCYdTzhlEpg1Wt5zLUHw==
X-Received: by 2002:a5d:58d0:: with SMTP id o16mr8407362wrf.420.1621587839871;
        Fri, 21 May 2021 02:03:59 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id k7sm1349133wro.8.2021.05.21.02.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 02:03:59 -0700 (PDT)
Date:   Fri, 21 May 2021 10:03:57 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     Michael Walle <michael@walle.cc>, robh+dt@kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        bgolaszewski@baylibre.com, jdelvare@suse.com,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-hwmon@vger.kernel.org, Luka Perkov <luka.perkov@sartura.hr>,
        jmp@epiphyte.org, Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Subject: Re: [PATCH 1/6] mfd: Add Delta TN48M CPLD driver
Message-ID: <20210521090357.GD2549456@dell>
References: <20210430123511.116057-1-robert.marko@sartura.hr>
 <af4923ef1ed0693fcd67d7986348b164@walle.cc>
 <CA+HBbNHCnpg9qCzZbT9KVNqX-daC68iaJKNdyEf7do3w98miWw@mail.gmail.com>
 <0f28cabf858154842819935000f32bc2@walle.cc>
 <20210520064929.GM2549456@dell>
 <CA+HBbNG62bJC4ZiH0WRVYnN1AC=J5eJQPo_46tS67xNzP1L0DQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+HBbNG62bJC4ZiH0WRVYnN1AC=J5eJQPo_46tS67xNzP1L0DQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, 21 May 2021, Robert Marko wrote:

> On Thu, May 20, 2021 at 8:49 AM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > On Wed, 19 May 2021, Michael Walle wrote:
> >
> > > Hi,
> > >
> > > Am 2021-05-19 13:53, schrieb Robert Marko:
> > > > On Thu, May 6, 2021 at 6:34 PM Michael Walle <michael@walle.cc> wrote:
> > > > > Am 2021-04-30 14:35, schrieb Robert Marko:
> > > > > > Delta TN48M switches have a Lattice CPLD that serves
> > > > > > multiple purposes including being a GPIO expander.
> > > > > > So lets add the MFD core driver for it.
> > > > >
> > > > > Did you have a look at mfd/simple-mfd-i2c.c?
> > > >
> > > > Yes, that was my first idea but we have a requirement to expose CPLD
> > > > information via debugfs as there are userspace applications using it.
> > > > And simple-mfd-i2c does not allow us to do so.
> > >
> > > Mh, last time Lee wasn't very fond of having a driver that just populates
> > > sub-drivers while doing almost nothing itself. See
> > > https://lore.kernel.org/lkml/20200605065709.GD3714@dell/
> >
> > Right.  I still feel that way.
> >
> > > That being said, I'd also like to expose our CPLD version, but until now
> > > haven't found a good solution.
> >
> > Why though?  Does S/W *need* it?
> Because we have userspace S/W that uses it as the same CPLD is in
> multiple variants of the board but the correct board model is set during
> manufacturing and we can read it from the CPLD.
> 
> We also have information about PSU1 and PSU2(Some models only)
> power good, whether they are present and some other info that I need
> to expose as these are monitored in userspace.
> 
> I planned to do that via the hwmon driver but according to Guenther they
> are not hwmon attributes and I agree.
> 
> Would it be possible to have a dedicated driver that would only expose
> the required information via debugfs?
> Then I could simply use the simple I2C MFD driver with only a GPIO
> driver on top of it.

Yes, I was going to suggest that.

It should probably live in drivers/misc.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
