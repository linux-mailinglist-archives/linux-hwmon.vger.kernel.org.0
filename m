Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F996394711
	for <lists+linux-hwmon@lfdr.de>; Fri, 28 May 2021 20:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbhE1Sec (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 28 May 2021 14:34:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:56484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229463AbhE1Sec (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 May 2021 14:34:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D6D0E6135F;
        Fri, 28 May 2021 18:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622226777;
        bh=p5h6PQiQGkd+DsbcK2hpo2B3BDwWq3Cc4Nuy4HR0a20=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KlQplnzm+nWhsSAuyn8AwV0XsiY4BiHdVlB5uwEw5ozn48EfM7xBJ3fD1m/hUfDQ8
         BJnHLwouyDBAHj1yL5lIXDVOztmdoeEkn3cxD3VwgdIIZLW+9TnJDtIHUGr8tOhkND
         SXFVphTeOHnUUPpS+84Wj3NKK9LgroooIqMcXyNCn9ht+MOT1Q6lsfRNO7fv8fuLuQ
         oVyLO0mbKYLCLYw34wTF+uY5zBWxyGNJm+KCnkVs6OdWi0u4Tdij5E5cfm7iwwxy1Q
         N3l8BWkdxnLsnJtRap02mqCjmoIYWxLR8rOtqJecLZZCiZ0PXDkZ5WA81EC/Lc7kQ9
         7ULCE3qVD9uMA==
Received: by pali.im (Postfix)
        id 5D581B0B; Fri, 28 May 2021 20:32:54 +0200 (CEST)
Date:   Fri, 28 May 2021 20:32:54 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     W_Armin@gmx.de
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Convert to new hwmon registration api
Message-ID: <20210528183254.cvleypq54gz2m5sj@pali>
References: <20210528173716.10975-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528173716.10975-1-W_Armin@gmx.de>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Friday 28 May 2021 19:37:10 W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> This patch series is converting the dell-smm-hwmon driver
> to the new hwmon registration API. In order to do so,
> it introduces a platform device in the first patch, and
> applies some optimisations in the next three patches.
> The switch to the new hwmon registration API is done in
> the last patch.
> 
> The caching of the fan/temp values was modified to better fit
> the new hwmon API.
> 
> The patches work fine for my Dell Latitude C600, but i whould
> appreciate someone testing the code on another model too.
> 
> Changes in v2:
> - Fix coverletter title
> - Update docs regarding pwm1_enable
> 
> Armin Wolf (6):
>   hwmon: (dell-smm-hwmon) Use platform device
>   hwmon: (dell-smm-hwmon) Mark functions as __init
>   hwmon: (dell-smm-hwmon) Use devm_add_action_or_reset()
>   hwmon: (dell-smm-hwmon) Move variables into a driver private data
>     structure
>   hwmon: (dell-smm-hwmon) Convert to
>     devm_hwmon_device_register_with_info()
>   hwmon: (dell-smm-hwmon) Update docs
> 
>  Documentation/hwmon/dell-smm-hwmon.rst |   2 +-
>  drivers/hwmon/dell-smm-hwmon.c         | 860 ++++++++++++-------------
>  2 files changed, 426 insertions(+), 436 deletions(-)
> 
> --
> 2.20.1
> 

Hello! I tried to apply this patch series but it failed on error
malformed patch. I guess that it is because patches in emails were sent
in quoted-printable transfer encoding (instead of transparent 8-bit).
I will look later how to convert them into 8-bit, for clean apply.
