Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9916314D5
	for <lists+linux-hwmon@lfdr.de>; Sun, 20 Nov 2022 16:19:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbiKTPTv (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sun, 20 Nov 2022 10:19:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiKTPTv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 20 Nov 2022 10:19:51 -0500
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17B181F626;
        Sun, 20 Nov 2022 07:19:49 -0800 (PST)
Received: by mail-qt1-x832.google.com with SMTP id jr19so5985257qtb.7;
        Sun, 20 Nov 2022 07:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ypUtPNoFB3mh/CgcevncMX24Xjrk6w7DdryFib7Qc4=;
        b=dC2aH075LenVNqxDeXxCqwPz5MkHpWiGlISkPXGX38TTdBRH4JDO4bfpyw8mdPIBrs
         M5kebHp1Ih0nu1UQjWylwaTkpCveHF3sZ7cbI3tR+sb3Q3Zqklwfyo/NOpi/QLGqvLY5
         pq+xZJ5tnj0NDk7noyMGA7HPEjUAaoaB9xaDdNFKkYhdjDg0G/tyCjpyQ4F1C2tb6p2Y
         xDis9w3CdKOygUlou3f/73343sRw6kDzr5ITPmlxcjWFYNFrHvpahyFiBUnn1yR8aEOj
         MYnWvIl4txjNoVLkFkm8SeuVp2l3lE3LlCYNK7tn/XmPh3jNURjFWg0XeeqOP4PhE8VZ
         fdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ypUtPNoFB3mh/CgcevncMX24Xjrk6w7DdryFib7Qc4=;
        b=AeT/SIXjicSoihglQHqV/Vuc91x8RYPvCw/o152PkhcehCwjUYC0uXTmaRRqr+2tbu
         JqPp81gWe2olLLfuQFh8L8bQwqzupNTscvvCm3QFzg6gs2YhUPRemez39nEvh5lI0sHf
         /B7IEBu5Scb50v73sgFfE1nPaER6/AzM5XTLV/QJUxaBeOFhpDIw1GNoih7TA9krD3i4
         2p8VcghOm2H/uk9zow5GJFZmajwXImpy4e0V0lT5GPdZXdXkF/OcvSMhw9VsVy3qNo2j
         talj5EKASDxe3Kpqcux7EHrsEgg5AfOzTh9PHLC5rtYPrc2Ufd61+s/WssNPGp8GTvfR
         dnxg==
X-Gm-Message-State: ANoB5pl75thDwxB2P8wpmqiUMcBXuUWvG8WKqfJwwN+egmbfuN5CQo8e
        +NvUCegMbxei4hKjLjURElc=
X-Google-Smtp-Source: AA0mqf5FCrqtE30Vj+40bPh/FgYC4XSyMx2nJKIWQmhx3Q936ygj74daBnDo3FcwEIULt5Q9rW1PNQ==
X-Received: by 2002:ac8:7285:0:b0:3a5:9dc:d83f with SMTP id v5-20020ac87285000000b003a509dcd83fmr14147149qto.28.1668957588182;
        Sun, 20 Nov 2022 07:19:48 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id gd10-20020a05622a5c0a00b003a5c6ad428asm5262511qtb.92.2022.11.20.07.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 07:19:47 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 20 Nov 2022 07:19:46 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Naresh Solanki <naresh.solanki@9elements.com>,
        devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Marcello Sylvester Bauer <sylv@sylv.io>,
        linux-pwm@vger.kernel.org
Subject: Re: [PATCH v6 3/3] hwmon: (max6639) Change from pdata to dt
 configuration
Message-ID: <20221120151946.GA1791682@roeck-us.net>
References: <20221116213615.1256297-1-Naresh.Solanki@9elements.com>
 <20221116213615.1256297-4-Naresh.Solanki@9elements.com>
 <20221117074510.qqtjc6h3bnh5rccx@pengutronix.de>
 <81cd642f-c5fb-77ec-a634-5655d5b6088c@9elements.com>
 <20221117091324.h7etwyzckzvpoa4p@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221117091324.h7etwyzckzvpoa4p@pengutronix.de>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Nov 17, 2022 at 10:13:24AM +0100, Uwe Kleine-K�nig wrote:
> On Thu, Nov 17, 2022 at 02:10:45PM +0530, Naresh Solanki wrote:
> > 
> > 
> > On 17-11-2022 01:15 pm, Uwe Kleine-K�nig wrote:
> > > Hello,
> > > 
> > > On Wed, Nov 16, 2022 at 10:36:15PM +0100, Naresh Solanki wrote:
> > > > max6639_platform_data is not used by any in-kernel driver and does not
> > > > address the MAX6639 fans separately.
> > > > Move to device tree configuration with explicit properties to configure
> > > > each fan.
> > > > 
> > > > Non-DT platform can still use this module with its default
> > > > configuration.
> > > > 
> > > > Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
> > > > Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
> > > 
> > > What changed here since v5? Please either add a changelog below the
> > > tripple-dash for a new revision, or make sure that all relevant people
> > > get the cover letter.
> > > 
> > > It seems you didn't address my comments for v5 :-\
> > Not sure what I missed but did following changes:
> > Removed unused header max6639.h
> > Used dev_err_probe instead,
> > Removed of_pwm_n_cells,
> > if condition for freq_table
> > removed pwm_get_state & instead use pwm->state
> > division/multiplication optimizations,
> > indentation of freq_table,
> 
> In the cover letter you just wrote:
> 
> | Changes in V6:
> | - Remove unused header file
> | - minor cleanup
> 
> which is too short in my eyes. If you wrote instead:
> 
> 	Address review feedback by Uwe Kleine-K�nig in patch #3, patches #1 and
> 	#2 unchanged.
> 
> This would be much more helpful as people that were already happy with
> v5 wouldn't need to look at the first two patches and I would know that
> you addressed my feedback and would have looked in more detail.
> 
> What I miss is the most critical part of my feedback, i.e.:
> | My overall impression is that this patch mixes too much things. IMHO it
> | should be split in (at least)
> | 
> |  - Add dt support
> |  - Drop platform support
> |  - Add PWM provider support
> |  - Make use of the PWM API
> |
> | maybe also add the 2nd PWM in a separate step.

Those will definitely need to be separate patches. I am far from convinced
that all fan controllers in the hwmon subsystem should implement pwm
providers just to match devicetree requirements. That adds zero value in
99% of all use cases. Actually, I don't know of any use cases where it
would add value or even make sense.

Guenter


> 
> Best regards
> Uwe
> 
> -- 
> Pengutronix e.K.                           | Uwe Kleine-K�nig            |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |


