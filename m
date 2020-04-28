Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7FE1BBDD8
	for <lists+linux-hwmon@lfdr.de>; Tue, 28 Apr 2020 14:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726870AbgD1Mpx (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 28 Apr 2020 08:45:53 -0400
Received: from mga03.intel.com ([134.134.136.65]:25689 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726764AbgD1Mpx (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 28 Apr 2020 08:45:53 -0400
IronPort-SDR: ITh+OnsDVeDP/TbJ6XA/qJXUjHEDdvC9FXOLN18GtmPHVhXSUBop2V1IK2fUbTmNaIuk29MwOE
 kj1Yfq++fqOg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2020 05:45:52 -0700
IronPort-SDR: TP/uYczxk/lwtQIzH/+Zyl5uqP030jf1kAkw25vGqAYSII1wYmovbE/eUDO84cwwMYEz7zYIli
 glcT10kijuRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,327,1583222400"; 
   d="scan'208";a="459221981"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006.fm.intel.com with ESMTP; 28 Apr 2020 05:45:46 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jTPcS-003YlK-Qg; Tue, 28 Apr 2020 15:45:48 +0300
Date:   Tue, 28 Apr 2020 15:45:48 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Michael Walle <michael@walle.cc>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v3 02/16] mfd: mfd-core: Don't overwrite the dma_mask of
 the child device
Message-ID: <20200428124548.GS185537@smile.fi.intel.com>
References: <20200423174543.17161-1-michael@walle.cc>
 <20200423174543.17161-3-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200423174543.17161-3-michael@walle.cc>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Apr 23, 2020 at 07:45:29PM +0200, Michael Walle wrote:
> Commit cdfee5623290 ("driver core: initialize a default DMA mask for
> platform device") initialize the DMA of a platform device. But if the
> parent doesn't have a dma_mask set, for example if it's an I2C device,
> the dma_mask of the child platform device will be set to zero again.
> Which leads to many "DMA mask not set" warnings, if the MFD cell has the
> of_compatible property set.

I'm wondering why parent doesn't have it.
I remember we have explicit patches in the past for buses such as PCI and AMBA
to set default DMA mask for all physical devices on the respective bus, of
course they can individually override it later.

So, this seems to me a paper over the real issue (absence of default DMA mask
where it's needed) and devices should explicitly define it if they disagree
with default.

If I'm wrong, you really need elaborate commit message much better.

-- 
With Best Regards,
Andy Shevchenko


