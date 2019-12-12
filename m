Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 267BE11C1A1
	for <lists+linux-hwmon@lfdr.de>; Thu, 12 Dec 2019 01:50:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727359AbfLLAuF (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 11 Dec 2019 19:50:05 -0500
Received: from mga04.intel.com ([192.55.52.120]:30335 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726673AbfLLAuF (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Dec 2019 19:50:05 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Dec 2019 16:50:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,303,1571727600"; 
   d="scan'208";a="388124032"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143]) ([10.7.153.143])
  by orsmga005.jf.intel.com with ESMTP; 11 Dec 2019 16:50:04 -0800
Subject: Re: [PATCH v11 06/14] peci: Add Aspeed PECI adapter driver
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jonathan Corbet <corbet@lwn.net>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        "Darrick J . Wong" <darrick.wong@oracle.com>,
        Eric Sandeen <sandeen@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>, Wu Hao <hao.wu@intel.com>,
        Tomohiro Kusumi <kusumi.tomohiro@gmail.com>,
        "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>,
        Frederic Barrat <fbarrat@linux.vnet.ibm.com>,
        "David S . Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Vinod Koul <vkoul@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        David Kershner <david.kershner@unisys.com>,
        Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
        Sagar Dharia <sdharia@codeaurora.org>,
        Johan Hovold <johan@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Juergen Gross <jgross@suse.com>,
        Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
        Tomer Maimon <tmaimon77@gmail.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        openbmc@lists.ozlabs.org, Robin Murphy <robin.murphy@arm.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>
References: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
 <20191211194624.2872-7-jae.hyun.yoo@linux.intel.com>
 <20191211202818.GD32742@smile.fi.intel.com>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <e05cdec0-1120-7e2d-bac0-e4a1ba1ceb3d@linux.intel.com>
Date:   Wed, 11 Dec 2019 16:50:04 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191211202818.GD32742@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Andy,

On 12/11/2019 12:28 PM, Andy Shevchenko wrote:
> On Wed, Dec 11, 2019 at 11:46:16AM -0800, Jae Hyun Yoo wrote:
>> This commit adds Aspeed PECI adapter driver for Aspeed
>> AST24xx/25xx/26xx SoCs.
> 
> ...
> 
>> +#define   ASPEED_PECI_CMD_IDLE_MASK		(ASPEED_PECI_CMD_STS_MASK | \
>> +						 ASPEED_PECI_CMD_PIN_MON)
> 
> Better looking when the value completely occupies second line without touching
> the first.

Yes. Will change it.

> ...
> 
>> +static int aspeed_peci_check_idle(struct aspeed_peci *priv)
>> +{
>> +	ulong timeout = jiffies + usecs_to_jiffies(ASPEED_PECI_IDLE_CHECK_TIMEOUT_USEC);
>> +	u32 cmd_sts;
> 
> Like in the previous patch this one has hard to read timeout loops with inefficient code.
> 
>> +	for (;;) {
>> +		cmd_sts = readl(priv->base + ASPEED_PECI_CMD);
>> +		if (!(cmd_sts & ASPEED_PECI_CMD_IDLE_MASK))
>> +			break;
> 
>> +		if (time_after(jiffies, timeout)) {
> 
> This is actually main exit condition (vs. infinite loop).
> 
>> +			cmd_sts = readl(priv->base + ASPEED_PECI_CMD);
> 
> This make no sense. If you would like to have one more iteration, just spell it
> explicitly.
> 
>> +			break;
>> +		}
> 
>> +		usleep_range((ASPEED_PECI_IDLE_CHECK_INTERVAL_USEC >> 2) + 1,
>> +			     ASPEED_PECI_IDLE_CHECK_INTERVAL_USEC);
>> +	}
>> +
> 
>> +	return !(cmd_sts & ASPEED_PECI_CMD_IDLE_MASK) ? 0 : -ETIMEDOUT;
> 
> Ditto.
> 
>> +}
> 
> Now look at the other variant:
> 
> 	do {
> 		...do something...
> 		if (success)
> 			return 0;
> 		usleep(...);
> 	} while (time_before(...));
> 
> 	return -ETIMEDOUT;
> 
> * Easy
> * less LOCs
> * guaranteed always to be at least one iteration
> * has explicitly spelled exit condition
> 
> BUT!
> 
> In this very case you may do even better if you read iopoll.h, i.e
> readl_poll_timeout() has this functionality embedded in the macro.
> 

I see. I'll simplify this function like below:

#include <linux/iopoll.h>

static inline int aspeed_peci_check_idle(struct aspeed_peci *priv)
{
	u32 cmd_sts;

	return readl_poll_timeout(priv->base + ASPEED_PECI_CMD,
				  cmd_sts,
				  !(cmd_sts & ASPEED_PECI_CMD_IDLE_MASK),
				  ASPEED_PECI_IDLE_CHECK_INTERVAL_USEC,
				  ASPEED_PECI_IDLE_CHECK_TIMEOUT_USEC);
}

Thanks a lot for your review!

-Jae
