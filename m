Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2971C4BAA
	for <lists+linux-hwmon@lfdr.de>; Tue,  5 May 2020 03:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgEEB6M (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 4 May 2020 21:58:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726482AbgEEB6M (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 4 May 2020 21:58:12 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E613C061A0F;
        Mon,  4 May 2020 18:58:10 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id h11so165143plr.11;
        Mon, 04 May 2020 18:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iFj80LRwMRvCtXO1RDtLVy/aid0h2CgjaTRQRdfP1mU=;
        b=sMGEMCl0KBrFfVmFnIgHJjbeeE9+mxkaSMyj2H/U4/qsfiJo3bjt42kPbeU1C7bi4N
         DR0rRPV1p2ycQI9nX6WgVyT3poc68xlUXsi8BNO2aE60kLfOeEltvR9Aq7TzqZ4aGQJy
         kk753Zjpp+fdHKZONWhyhRu5unKWyZkkge0ggW4hL3onny954QlbIx6GrwS48gHgWTl0
         Uh8gEQYZtNEq7i/+iQBmUGkkaQXa9F+N296OE/4bsENzVq3FRmPMsjZ4Bg73P7iJfb0N
         e6fte1gt/2arV4i7cf5CTMz3Fdo7GRunZ1TEz7zSqUyj9Rl74ojcBPesL1VoJQVKpFW2
         qU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=iFj80LRwMRvCtXO1RDtLVy/aid0h2CgjaTRQRdfP1mU=;
        b=LlCQMiO8/m8Ly5WFbVItUADr7KricYz9+CKKRXDuvaFXE1H11uVuOtyTN+ALDTAha6
         z1vVHF5Jta8ARUsRurUCVSKVeiM/F/WIBGF34uj0ZisXOYeXoQz7jmdxi8z4uNxEgFCh
         2O7hm4EVMmqXoFyheJInky9vs3UW1Dx8sQgfAj2vjxOYSnx9dgnVxrXcbE2TG80ZUJqy
         pd0o17L7kAABixL8sV+jFCFgvmPDjQt0nEsHv6ackJfMfsSLDv25mqwdK87JBUOR1xVk
         oqdVCQRWvacKkgeWQI8L7no/YfFJcXPlyBAZplG7ALu617qNBaSvOUR2m/KN76s6QeuE
         /UJw==
X-Gm-Message-State: AGi0Pua9DQ8b2G+E14UFL2DV7vRt16jaW+xChP82C955UYGIIUFNVve/
        wxyUbvlY1mTd8JUpG063h4Q=
X-Google-Smtp-Source: APiQypJFsd56BbcfdHAd/1oV50TMFykWR74sQyZlowNzEI0k568UoaWP/VS+cA3dLMT+YRMfBnMcjA==
X-Received: by 2002:a17:90a:5aa7:: with SMTP id n36mr21456pji.45.1588643889930;
        Mon, 04 May 2020 18:58:09 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r26sm376481pfq.75.2020.05.04.18.58.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 18:58:09 -0700 (PDT)
Date:   Mon, 4 May 2020 18:58:08 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Michal Orzel <michalorzel.eng@gmail.com>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fix all coding-style warnings on lm75 driver
Message-ID: <20200505015808.GA139531@roeck-us.net>
References: <1588255534-28073-1-git-send-email-michalorzel.eng@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588255534-28073-1-git-send-email-michalorzel.eng@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Apr 30, 2020 at 04:05:34PM +0200, Michal Orzel wrote:
> Check/fix all warnings generated by checkpatch.pl script on LM75 driver.
> 
> Signed-off-by: Michal Orzel <michalorzel.eng@gmail.com>

Applied, but for the future please prepend your patches with something like
"subsystem: driver:", or for hwmon "hwmon: (driver)".

Also, please keep in mind that such cleanups are not encouraged unless you
also provide functional changes.

Thanks,
Guenter

> ---
>  drivers/hwmon/lm75.c |  8 ++++++--
>  drivers/hwmon/lm75.h | 31 +++++++++++++++++--------------
>  2 files changed, 23 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> index 5e63922..ba0be48 100644
> --- a/drivers/hwmon/lm75.c
> +++ b/drivers/hwmon/lm75.c
> @@ -797,8 +797,10 @@ static int lm75_detect(struct i2c_client *new_client,
>  
>  	/* First check for LM75A */
>  	if (i2c_smbus_read_byte_data(new_client, 7) == LM75A_ID) {
> -		/* LM75A returns 0xff on unused registers so
> -		   just to be sure we check for that too. */
> +		/*
> +		 * LM75A returns 0xff on unused registers so
> +		 * just to be sure we check for that too.
> +		 */
>  		if (i2c_smbus_read_byte_data(new_client, 4) != 0xff
>  		 || i2c_smbus_read_byte_data(new_client, 5) != 0xff
>  		 || i2c_smbus_read_byte_data(new_client, 6) != 0xff)
> @@ -849,6 +851,7 @@ static int lm75_suspend(struct device *dev)
>  {
>  	int status;
>  	struct i2c_client *client = to_i2c_client(dev);
> +
>  	status = i2c_smbus_read_byte_data(client, LM75_REG_CONF);
>  	if (status < 0) {
>  		dev_dbg(&client->dev, "Can't read config? %d\n", status);
> @@ -863,6 +866,7 @@ static int lm75_resume(struct device *dev)
>  {
>  	int status;
>  	struct i2c_client *client = to_i2c_client(dev);
> +
>  	status = i2c_smbus_read_byte_data(client, LM75_REG_CONF);
>  	if (status < 0) {
>  		dev_dbg(&client->dev, "Can't read config? %d\n", status);
> diff --git a/drivers/hwmon/lm75.h b/drivers/hwmon/lm75.h
> index b614e63..a398171 100644
> --- a/drivers/hwmon/lm75.h
> +++ b/drivers/hwmon/lm75.h
> @@ -1,17 +1,15 @@
>  /* SPDX-License-Identifier: GPL-2.0-or-later */
>  /*
> -    lm75.h - Part of lm_sensors, Linux kernel modules for hardware
> -	      monitoring
> -    Copyright (c) 2003 Mark M. Hoffman <mhoffman@lightlink.com>
> -
> -*/
> + * lm75.h - Part of lm_sensors, Linux kernel modules for hardware monitoring
> + * Copyright (c) 2003 Mark M. Hoffman <mhoffman@lightlink.com>
> + */
>  
>  /*
> -    This file contains common code for encoding/decoding LM75 type
> -    temperature readings, which are emulated by many of the chips
> -    we support.  As the user is unlikely to load more than one driver
> -    which contains this code, we don't worry about the wasted space.
> -*/
> + * This file contains common code for encoding/decoding LM75 type
> + * temperature readings, which are emulated by many of the chips
> + * we support.  As the user is unlikely to load more than one driver
> + * which contains this code, we don't worry about the wasted space.
> + */
>  
>  #include <linux/kernel.h>
>  
> @@ -20,18 +18,23 @@
>  #define LM75_TEMP_MAX 125000
>  #define LM75_SHUTDOWN 0x01
>  
> -/* TEMP: 0.001C/bit (-55C to +125C)
> -   REG: (0.5C/bit, two's complement) << 7 */
> +/*
> + * TEMP: 0.001C/bit (-55C to +125C)
> + * REG: (0.5C/bit, two's complement) << 7
> + */
>  static inline u16 LM75_TEMP_TO_REG(long temp)
>  {
>  	int ntemp = clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
> +
>  	ntemp += (ntemp < 0 ? -250 : 250);
>  	return (u16)((ntemp / 500) << 7);
>  }
>  
>  static inline int LM75_TEMP_FROM_REG(u16 reg)
>  {
> -	/* use integer division instead of equivalent right shift to
> -	   guarantee arithmetic shift and preserve the sign */
> +	/*
> +	 * use integer division instead of equivalent right shift to
> +	 * guarantee arithmetic shift and preserve the sign
> +	 */
>  	return ((s16)reg / 128) * 500;
>  }
> -- 
> 2.7.4
> 
