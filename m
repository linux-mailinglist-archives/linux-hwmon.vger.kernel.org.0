Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74B81A6AC0
	for <lists+linux-hwmon@lfdr.de>; Tue,  3 Sep 2019 16:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729313AbfICOFS (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 3 Sep 2019 10:05:18 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41262 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbfICOFR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 Sep 2019 10:05:17 -0400
Received: by mail-pl1-f195.google.com with SMTP id m9so7940207pls.8;
        Tue, 03 Sep 2019 07:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qtPPg5GqUhEobWxZd2+sHLIYtebNTUnoITCh7ZrUMVw=;
        b=q5WaH2n/KEV7bv90Rzgt4ZxK6vTg4R3z/QjtWRq9YmtVxEgl1bSDYsI28rRpFhMOUY
         ty/MkrHMs3Kku2/prOEGnwtMlVDOTWJjwi3ewVOTcqKlbqqXH0aypsVkvih1oE3S1fFj
         RpLFBXtbECANC3dQXCrOz/r6ge05qOha7+DmmvPi5DIWzHcMYs5LO4ckS0gh+g2Qy90l
         VYhilCAsod2I736k+txNQ6cNwkVAxsjpWIgkkcsJJlBO8kfno25x83vLlZFI9vYervJ0
         UJC8UrE412R9A2CbrWWuYZUVJeEkKkQsc3QaqB9bpuAmHpbpsWKSu/lOOdHgaXi4gANY
         v+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=qtPPg5GqUhEobWxZd2+sHLIYtebNTUnoITCh7ZrUMVw=;
        b=KhgYQIAWFRS6B/D2QQ43DB/7UWosq/3aCqw3avaZP+C5E4lExp9hheN+ewnzhymvdZ
         CqG3gyDOMKZl5hbRMt1z9vYq2yf+9nv5sx26CXbe55TTysbT+PRxeH6LplOY5dTZN982
         +kn1x5k+GjbdFge/Mob+t61wK2t0rkLjSklSjUPXUnfyGtpC7Suq1RcUntr9PZr7Xphf
         sXaldWOUfT5odc0COHNr+w2fqFzNZOvFollAWO6IhU5z43Y7jIiwmigvvpfqfGuz74uS
         TbKUtvTkqqYAqJsJfn9Hjr9QUhu3uh8uCswlzwTL/2EXjzLeKKE6g3RcCxFct49mbjW9
         1+Dg==
X-Gm-Message-State: APjAAAUzDpo/b5DWdbltltyCqo4NunDqLaMLR701LscaWFTTKvuZO8LQ
        cSzeWuVUrLp0qKf4p82dUb0=
X-Google-Smtp-Source: APXvYqzkqnsdir2zt5OJPtTipf1rSsjwGymZG1cnM9kXXpM+tj3z1yhdNDaMT7pwxwBSXTpc9VEM+A==
X-Received: by 2002:a17:902:9041:: with SMTP id w1mr36170722plz.83.1567519517159;
        Tue, 03 Sep 2019 07:05:17 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q186sm6777816pfb.47.2019.09.03.07.05.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 07:05:16 -0700 (PDT)
Date:   Tue, 3 Sep 2019 07:05:15 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Julia Lawall <julia.lawall@lip6.fr>
Cc:     Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, kbuild-all@01.org
Subject: Re: [PATCH] hwmon: fix devm_platform_ioremap_resource.cocci warnings
Message-ID: <20190903140515.GA16775@roeck-us.net>
References: <alpine.DEB.2.21.1909030646180.3228@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1909030646180.3228@hadrien>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Sep 03, 2019 at 06:47:52AM +0200, Julia Lawall wrote:
> From: kbuild test robot <lkp@intel.com>
> 
>  Use devm_platform_ioremap_resource helper which wraps
>  platform_get_resource() and devm_ioremap_resource() together.
> 
> Generated by: scripts/coccinelle/api/devm_platform_ioremap_resource.cocci
> 
> Fixes: 658e687b4218 ("hwmon: Add Synaptics AS370 PVT sensor driver")
> CC: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
> Signed-off-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Julia Lawall <julia.lawall@lip6.fr>
> Reviewed-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
> 
> tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
> head:   9c551fac9ea9629cdc6deb205292c2bbe7b38917
> commit: 658e687b4218b42d03a5b0b79a292c9c48f1ddaf [32/34] hwmon: Add Synaptics AS370 PVT sensor driver
> :::::: branch date: 7 hours ago
> :::::: commit date: 7 hours ago
> 
> Please take the patch only if it's a positive warning. Thanks!
> 
>  as370-hwmon.c |    4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> --- a/drivers/hwmon/as370-hwmon.c
> +++ b/drivers/hwmon/as370-hwmon.c
> @@ -103,7 +103,6 @@ static const struct hwmon_chip_info as37
> 
>  static int as370_hwmon_probe(struct platform_device *pdev)
>  {
> -	struct resource *res;
>  	struct device *hwmon_dev;
>  	struct as370_hwmon *hwmon;
>  	struct device *dev = &pdev->dev;
> @@ -112,8 +111,7 @@ static int as370_hwmon_probe(struct plat
>  	if (!hwmon)
>  		return -ENOMEM;
> 
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	hwmon->base = devm_ioremap_resource(&pdev->dev, res);
> +	hwmon->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(hwmon->base))
>  		return PTR_ERR(hwmon->base);
