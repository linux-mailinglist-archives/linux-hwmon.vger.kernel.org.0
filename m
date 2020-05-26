Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B912719A233
	for <lists+linux-hwmon@lfdr.de>; Wed,  1 Apr 2020 01:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731498AbgCaXC5 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 31 Mar 2020 19:02:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:39438 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730589AbgCaXC5 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 31 Mar 2020 19:02:57 -0400
Received: from pali.im (pali.im [31.31.79.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8C58920787;
        Tue, 31 Mar 2020 23:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585695776;
        bh=RDr5TB2wv3VlgO3MORuYf5f3VFVISMMWhvEYqR+u2n0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=naLp6hgsZrmQ5EVpGKNR8qCmsxuQw22SFQ7f6AStKryG6QbiKnAZSkGsN+gcMnnHH
         uI0jKyLIRednUBhP2lALGV7qva9WhsMCnX1EjULO7e9jgJ1GBmvqgU8CzvaYmOFG0P
         D3eD3JjfoXrDxn4auqTwGkKVXuXxomESl/cYkiF8=
Received: by pali.im (Postfix)
        id 9D2C7888; Wed,  1 Apr 2020 01:02:54 +0200 (CEST)
Date:   Wed, 1 Apr 2020 01:02:54 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Michele Sorcinelli <michelesr@autistici.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] drivers/hwmon/dell-smm-hwmon.c: fix blank line
Message-ID: <20200331230254.hxntiaq2s3ynk7pi@pali>
References: <20200331225708.52822-1-michelesr@autistici.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200331225708.52822-1-michelesr@autistici.org>
User-Agent: NeoMutt/20180716
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tuesday 31 March 2020 23:57:08 Michele Sorcinelli wrote:
> Fix missing blank line after declaration: reported by checkpatch.pl
> 
> There are other missing blank lines reported in the declaration of
> struct smm_regs fields (line 120) but they are probably false positives
> so I don't think they need to be changed.
> 
> Signed-off-by: Michele Sorcinelli <michelesr@autistici.org>

Hello! I'm fine with any coding style which is consistent. With or also
without this blank line. So if Jean and Guenter as subsystem maintainers
want this change I'm fine with it too and in this case you can add my
Acked-by: Pali Rohár <pali@kernel.org>

> ---
>  drivers/hwmon/dell-smm-hwmon.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index ab719d372b0d..7b61b613aff6 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -1276,6 +1276,7 @@ static int __init i8k_probe(void)
>  	id = dmi_first_match(i8k_dmi_table);
>  	if (id && id->driver_data) {
>  		const struct i8k_config_data *conf = id->driver_data;
> +
>  		if (!fan_mult && conf->fan_mult)
>  			fan_mult = conf->fan_mult;
>  		if (!fan_max && conf->fan_max)
> -- 
> 2.26.0
> 
