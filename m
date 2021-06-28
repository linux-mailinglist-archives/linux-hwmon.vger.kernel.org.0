Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D90E73B5C82
	for <lists+linux-hwmon@lfdr.de>; Mon, 28 Jun 2021 12:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232641AbhF1KgN (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 28 Jun 2021 06:36:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232625AbhF1KgJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 28 Jun 2021 06:36:09 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21420C061574
        for <linux-hwmon@vger.kernel.org>; Mon, 28 Jun 2021 03:33:44 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id i94so20655734wri.4
        for <linux-hwmon@vger.kernel.org>; Mon, 28 Jun 2021 03:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=GIGzDkjYpMYYcMV5RqlKoJGmaST1cvK174JxTj86cYw=;
        b=qkId5XP/gDFWBYbhE5fxBwPKbrAaoDqv0KdktsZhUzkzKw5HFCl7vNukEkPXrIGVT1
         UPtZQgemL3W61gWTdy7SufoTyNkS5D1oY5wW4WKDDauH/5qdOF7kd3sgdpox6kEXbcbS
         a53UoGRp1J4EnDXkHSBjLZr3GuBQMU6aQ3e7pgl1yvyvxa16Zf8BeaYXd5HFjJJEbeYP
         eS+vXjDO3WfciCvP+zQnlm0RbqEBrUsItbf3hAEKUUwVyUcbQd5wCLrDCG+7hdp4+HKG
         DC3TrBd10TpNk+YTaC2zfmNIUMC7DNCPXtPQLfxMk12kbsIkOFwtWzhUS7dzoZTVpUaE
         Gciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=GIGzDkjYpMYYcMV5RqlKoJGmaST1cvK174JxTj86cYw=;
        b=etDsSITFjxuAFfvagvWjtbdMzi6kuCicDLq9cmaSfWQOHRTEUICsI+Tw7ggqv5Lxqm
         1rLwgiAQrsWzvzGHOpG1cTLHacjz067t1Wsw36yJSCb+bm1DnRaKd9d6VjcrVyKt0TSR
         IorQsMHd0xWsO1rSpE/KRDRNkkWQRcT5CCF851qDOqenTw+E9V/IED5C0Wxae6qkpcon
         xR6/F/TNQFBAyRqhBmWUnMwyt7974VgJwbu4o2dCFBfaHabHtRLiQzRt8jsy5lU4MJBf
         jMwvdy5L7VDeHamlmXGFQf+oQgNEyq2kdpBXEjM+QU1yvDSh5d8xeZPRzZxsxw5dkQLs
         RS3w==
X-Gm-Message-State: AOAM530eA24vsr3oVvJFkfj38gvt15F3GaBg2BzA8N6A/eZpDWaVH6zF
        cMZfzYBCUFEnRyei+XB7l8gcUw==
X-Google-Smtp-Source: ABdhPJxiFmlLKEIXNMbZ1Kh48F8904JRqw1IOBpgNb6LA2rdOVM+ZUd7tqNfSLul3mtJIC73CTIa5Q==
X-Received: by 2002:adf:f20c:: with SMTP id p12mr26363513wro.257.1624876422753;
        Mon, 28 Jun 2021 03:33:42 -0700 (PDT)
Received: from dell ([95.144.13.187])
        by smtp.gmail.com with ESMTPSA id s18sm14593601wrw.33.2021.06.28.03.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 03:33:42 -0700 (PDT)
Date:   Mon, 28 Jun 2021 11:33:39 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Xu Yilun <yilun.xu@intel.com>
Cc:     Martin =?iso-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>,
        Wu Hao <hao.wu@intel.com>, Tom Rix <trix@redhat.com>,
        Moritz Fischer <mdf@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Brown <broonie@kernel.org>,
        Martin =?iso-8859-1?Q?Hundeb=F8ll?= <mhu@silicom.dk>,
        linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v2 4/5] mfd: intel-m10-bmc: add n5010 variant
Message-ID: <YNmlgz7wdJSGzMh9@dell>
References: <20210625074213.654274-1-martin@geanix.com>
 <20210625074213.654274-5-martin@geanix.com>
 <20210628055942.GD72330@yilunxu-OptiPlex-7050>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210628055942.GD72330@yilunxu-OptiPlex-7050>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, 28 Jun 2021, Xu Yilun wrote:

> It is good to me.

Please provide a proper *-by tag:

  See the: 'Sign your work - the Developer's Certificate of Origin'
  section in Documentation/process/submitting-patches.rst

And please don't top post.

> On Fri, Jun 25, 2021 at 09:42:12AM +0200, Martin Hundebøll wrote:
> > From: Martin Hundebøll <mhu@silicom.dk>
> > 
> >  The m10-bmc is used on the Silicom N5010 PAC too, so add it to list of
> >  m10bmc types.
> > 
> > Signed-off-by: Martin Hundebøll <mhu@silicom.dk>
> > ---
> > 
> > Changes since v1:
> >  * Patch split out to separate mfd changes
> > 
> >  drivers/mfd/intel-m10-bmc.c | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mfd/intel-m10-bmc.c b/drivers/mfd/intel-m10-bmc.c
> > index 1a9bfb7f48cd..8db3bcf5fccc 100644
> > --- a/drivers/mfd/intel-m10-bmc.c
> > +++ b/drivers/mfd/intel-m10-bmc.c
> > @@ -15,7 +15,8 @@
> >  
> >  enum m10bmc_type {
> >  	M10_N3000,
> > -	M10_D5005
> > +	M10_D5005,
> > +	M10_N5010,
> >  };
> >  
> >  static struct mfd_cell m10bmc_d5005_subdevs[] = {
> > @@ -28,6 +29,10 @@ static struct mfd_cell m10bmc_pacn3000_subdevs[] = {
> >  	{ .name = "n3000bmc-secure" },
> >  };
> >  
> > +static struct mfd_cell m10bmc_n5010_subdevs[] = {
> > +	{ .name = "n5010bmc-hwmon" },
> > +};
> > +
> >  static const struct regmap_range m10bmc_regmap_range[] = {
> >  	regmap_reg_range(M10BMC_LEGACY_BUILD_VER, M10BMC_LEGACY_BUILD_VER),
> >  	regmap_reg_range(M10BMC_SYS_BASE, M10BMC_SYS_END),
> > @@ -192,6 +197,10 @@ static int intel_m10_bmc_spi_probe(struct spi_device *spi)
> >  		cells = m10bmc_d5005_subdevs;
> >  		n_cell = ARRAY_SIZE(m10bmc_d5005_subdevs);
> >  		break;
> > +	case M10_N5010:
> > +		cells = m10bmc_n5010_subdevs;
> > +		n_cell = ARRAY_SIZE(m10bmc_n5010_subdevs);
> > +		break;
> >  	default:
> >  		return -ENODEV;
> >  	}
> > @@ -207,6 +216,7 @@ static int intel_m10_bmc_spi_probe(struct spi_device *spi)
> >  static const struct spi_device_id m10bmc_spi_id[] = {
> >  	{ "m10-n3000", M10_N3000 },
> >  	{ "m10-d5005", M10_D5005 },
> > +	{ "m10-n5010", M10_N5010 },
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(spi, m10bmc_spi_id);

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
