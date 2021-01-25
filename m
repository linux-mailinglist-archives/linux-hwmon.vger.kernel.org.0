Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 960D0303606
	for <lists+linux-hwmon@lfdr.de>; Tue, 26 Jan 2021 06:58:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728745AbhAZF6H (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 26 Jan 2021 00:58:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:45278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727468AbhAYKTb (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Jan 2021 05:19:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DA15206CA;
        Mon, 25 Jan 2021 10:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611569143;
        bh=MCTa+q6iPkQHIalIYo2lmB7dFC4VnbP/EmWCBTj00N4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b6OyhQ0gIN3pHAzEO7RpzrxN0PBbk+GjjcKXJe+76uDL3Lscc8xlNLjkqJst7GvgZ
         gEqFpXK8Mr+MXXILuasEx2doE+g6olEYwz9/h54ppRGvvsfzUd/uDXPYm7pHpiZaAZ
         X/KG/L+kIe/FqD39ZKbjbXdke/IrVgJf7p7VTa9Z6fURd0cO8d8I6a+eySrGempOSR
         0FBEXXgx2mq+kp3Q5O4BvXOEklMMj4USYkKL3q6rxI0phT/x06mHU4jaKilZ1qiEOq
         JGlzvCX5PFzl6WES/GYHmE+ATmDiwFeDTQ2p2z5UVYuZjFmrOoCLcFORvcv23XEvlx
         m1zoVhzbYwxfg==
Received: by pali.im (Postfix)
        id 18D8F768; Mon, 25 Jan 2021 11:05:41 +0100 (CET)
Date:   Mon, 25 Jan 2021 11:05:40 +0100
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Thomas Hebb <tommyhebb@gmail.com>
Cc:     linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Bob Hepple <bob.hepple@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm) Add XPS 15 L502X to fan control
 blacklist
Message-ID: <20210125100540.55wbgdsem3htplx3@pali>
References: <a09eea7616881d40d2db2fb5fa2770dc6166bdae.1611456351.git.tommyhebb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a09eea7616881d40d2db2fb5fa2770dc6166bdae.1611456351.git.tommyhebb@gmail.com>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Saturday 23 January 2021 18:46:08 Thomas Hebb wrote:
> It has been reported[0] that the Dell XPS 15 L502X exhibits similar
> freezing behavior to the other systems[1] on this blacklist. The issue
> was exposed by a prior change of mine to automatically load
> dell_smm_hwmon on a wider set of XPS models. To fix the regression, add
> this model to the blacklist.
> 
> [0] https://bugzilla.kernel.org/show_bug.cgi?id=211081
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=195751
> 
> Fixes: b8a13e5e8f37 ("hwmon: (dell-smm) Use one DMI match for all XPS models")
> Cc: stable@vger.kernel.org
> Reported-by: Bob Hepple <bob.hepple@gmail.com>
> Tested-by: Bob Hepple <bob.hepple@gmail.com>
> Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
> ---
> 
>  drivers/hwmon/dell-smm-hwmon.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index ec448f5f2dc3..73b9db9e3aab 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -1159,6 +1159,13 @@ static struct dmi_system_id i8k_blacklist_fan_support_dmi_table[] __initdata = {
>  			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS13 9333"),
>  		},
>  	},
> +	{
> +		.ident = "Dell XPS 15 L502X",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Dell System XPS L502X"),

Hello! Are you sure that it is required to completely disable fan
support? And not only access to fan type label for which is different
blaclist i8k_blacklist_fan_type_dmi_table?

And have you reported this issue to Dell support?

> +		},
> +	},
>  	{ }
>  };
>  
> -- 
> 2.30.0
> 
