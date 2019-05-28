Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11D582CFB9
	for <lists+linux-hwmon@lfdr.de>; Tue, 28 May 2019 21:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbfE1Tqx (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 28 May 2019 15:46:53 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:35263 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbfE1Tqx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 28 May 2019 15:46:53 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 45D49P35pBz1rTD9;
        Tue, 28 May 2019 21:46:49 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 45D49P2Sjgz1qqkZ;
        Tue, 28 May 2019 21:46:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id EcJN0-bL0DV2; Tue, 28 May 2019 21:46:47 +0200 (CEST)
X-Auth-Info: bY6SZT2qgAfphZOJBw2IB6yzOz7J5oXUePZXdSE9rAo=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Tue, 28 May 2019 21:46:47 +0200 (CEST)
Subject: Re: [PATCH V2] net: phy: tja11xx: Add IRQ support to the driver
To:     Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20190528192324.28862-1-marex@denx.de>
 <96793717-a55c-7844-f7c0-cc357c774a19@gmail.com>
 <4f33b529-6c3c-07ee-6177-2d332de514c6@denx.de>
 <cc8db234-4534-674d-eece-5a797a530cdf@gmail.com>
From:   Marek Vasut <marex@denx.de>
Openpgp: preference=signencrypt
Autocrypt: addr=marex@denx.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <ca63964a-242c-bb46-bd4e-76a270dbedb3@denx.de>
Date:   Tue, 28 May 2019 21:46:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <cc8db234-4534-674d-eece-5a797a530cdf@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/28/19 9:35 PM, Heiner Kallweit wrote:
> On 28.05.2019 21:31, Marek Vasut wrote:
>> On 5/28/19 9:28 PM, Heiner Kallweit wrote:
>>> On 28.05.2019 21:23, Marek Vasut wrote:
>>>> Add support for handling the TJA11xx PHY IRQ signal.
>>>>
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>> Cc: Andrew Lunn <andrew@lunn.ch>
>>>> Cc: Florian Fainelli <f.fainelli@gmail.com>
>>>> Cc: Guenter Roeck <linux@roeck-us.net>
>>>> Cc: Heiner Kallweit <hkallweit1@gmail.com>
>>>> Cc: Jean Delvare <jdelvare@suse.com>
>>>> Cc: linux-hwmon@vger.kernel.org
>>>> ---
>>>> V2: - Define each bit of the MII_INTEN register and a mask
>>>>     - Drop IRQ acking from tja11xx_config_intr()
>>>> ---
>>>>  drivers/net/phy/nxp-tja11xx.c | 48 +++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 48 insertions(+)
>>>>
>>>> diff --git a/drivers/net/phy/nxp-tja11xx.c b/drivers/net/phy/nxp-tja11xx.c
>>>> index b705d0bd798b..b41af609607d 100644
>>>> --- a/drivers/net/phy/nxp-tja11xx.c
>>>> +++ b/drivers/net/phy/nxp-tja11xx.c
>>>> @@ -40,6 +40,29 @@
>>>>  #define MII_INTSRC_TEMP_ERR		BIT(1)
>>>>  #define MII_INTSRC_UV_ERR		BIT(3)
>>>>  
>>>> +#define MII_INTEN			22
>>>> +#define MII_INTEN_PWON_EN		BIT(15)
>>>> +#define MII_INTEN_WAKEUP_EN		BIT(14)
>>>> +#define MII_INTEN_PHY_INIT_FAIL_EN	BIT(11)
>>>> +#define MII_INTEN_LINK_STATUS_FAIL_EN	BIT(10)
>>>> +#define MII_INTEN_LINK_STATUS_UP_EN	BIT(9)
>>>> +#define MII_INTEN_SYM_ERR_EN		BIT(8)
>>>> +#define MII_INTEN_TRAINING_FAILED_EN	BIT(7)
>>>> +#define MII_INTEN_SQI_WARNING_EN	BIT(6)
>>>> +#define MII_INTEN_CONTROL_ERR_EN	BIT(5)
>>>> +#define MII_INTEN_UV_ERR_EN		BIT(3)
>>>> +#define MII_INTEN_UV_RECOVERY_EN	BIT(2)
>>>> +#define MII_INTEN_TEMP_ERR_EN		BIT(1)
>>>> +#define MII_INTEN_SLEEP_ABORT_EN	BIT(0)
>>>> +#define MII_INTEN_MASK							\
>>>> +	(MII_INTEN_PWON_EN | MII_INTEN_WAKEUP_EN |			\
>>>> +	MII_INTEN_PHY_INIT_FAIL_EN | MII_INTEN_LINK_STATUS_FAIL_EN |	\
>>>> +	MII_INTEN_LINK_STATUS_UP_EN | MII_INTEN_SYM_ERR_EN |		\
>>>> +	MII_INTEN_TRAINING_FAILED_EN | MII_INTEN_SQI_WARNING_EN |	\
>>>> +	MII_INTEN_CONTROL_ERR_EN | MII_INTEN_UV_ERR_EN |		\
>>>> +	MII_INTEN_UV_RECOVERY_EN | MII_INTEN_TEMP_ERR_EN |		\
>>>> +	MII_INTEN_SLEEP_ABORT_EN)
>>>
>>> Why do you enable all these interrupt sources? As I said, phylib needs
>>> link change info only.
>>
>> Because I need them to reliably detect that the link state changed.
>>
> 
> Hmm, e.g. this one MII_INTEN_TEMP_ERR_EN doesn't seem to be related
> to a link status change. Name sounds like it just reports exceeding
> a temperature threshold.

It's PHY over-temperature. Whether it tears the link down or not is not
clear.

-- 
Best regards,
Marek Vasut
