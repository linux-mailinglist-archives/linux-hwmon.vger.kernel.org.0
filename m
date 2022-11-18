Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4376262FC08
	for <lists+linux-hwmon@lfdr.de>; Fri, 18 Nov 2022 18:53:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233929AbiKRRxR (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 18 Nov 2022 12:53:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235344AbiKRRxQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Nov 2022 12:53:16 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52BFC64541
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Nov 2022 09:53:15 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id be13so9406457lfb.4
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Nov 2022 09:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DLuxvrtTwLpjQCdZkBOlAPtT4PuOt7o3XUb4SWGRYeY=;
        b=gc2LXZ+OTJLhv4I9lm7jwrFHBlwEjy3I7KBxepbmSV10GxuyjuejJMVWZge0VWxvpp
         CFZL5ZsGS1msWuerYvaCIhVesWoSm6pr+4E6sEzRnS9fmZZv4DNKw6XvDL1DAhjZV0rY
         dcDg59Gf96vio2Jq4j52CNWR9YBtIuzN+ZgRpXL/H+9kG+lOvUDgMl99ip3GTYpvvAj6
         pqPmbbhFQx57FB2vY4gwFmNalaLujK/sLZR6kRhuSMcxhrFcJML9JxZZ5sqU7jLFzMuM
         bYofblzG/1sPeFdWGUDYyizGSCysILWtvaghUPVG3MeLXPWWa/6NwgYtELAqrtEty/xr
         o6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DLuxvrtTwLpjQCdZkBOlAPtT4PuOt7o3XUb4SWGRYeY=;
        b=p20rwijF5Ih351yUXq9ADaxBgQ2TXlXAu6cuANbo6WviO+4rNR+RS7+HTj1P+4PprV
         Hq6CliEH7VJ4zC3wz8KWSzn1CPXtEyhZ29e0GiJSjLX/KKCI5yT7NPi16tZyGtNJ25bN
         KQht3wyzXgCi6RVEIuYY14w4phHMxKdc3jGKdkqXZpunx4fXUhaZXPM1jcmVo66R9y4D
         NbUs03fiJ/wQ5BWE6iYFkw7+1zjgnDFlBARpSYksNhb78vr+om2j8w/ZlrYMRJuScfvh
         K9xu/Q0VsK5klMXn3fYbQwhldc094sKC+GMSiLKS9woerL5ID6TrBdZmFwXqkbkA/npr
         7j8g==
X-Gm-Message-State: ANoB5pk8IRXB4xZAsTqa0NRUQsvCYquZ6L2h8olp9EsXGpjZhQjPjBoL
        xGwBZWyHY/JbbSUr8VQLWrG19PmsL136vr9xYsM=
X-Google-Smtp-Source: AA0mqf6+4QbDn4g3hUVQiuJTLhFwbbEczrZSv0Hr3za+VJ6tPQuOMwdudPg6rGNTOVoPtyqvhEa8F3xAhtZdUUt4gb8=
X-Received: by 2002:a19:f70d:0:b0:4ad:952:83eb with SMTP id
 z13-20020a19f70d000000b004ad095283ebmr3169074lfe.116.1668793993586; Fri, 18
 Nov 2022 09:53:13 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:651c:4cc:0:0:0:0 with HTTP; Fri, 18 Nov 2022 09:53:13
 -0800 (PST)
Reply-To: thajxoa@gmail.com
From:   Thaj Xoa <arounayawo@gmail.com>
Date:   Fri, 18 Nov 2022 17:53:13 +0000
Message-ID: <CALU0pJfZY-T8Wbt--Hwev7X=WgF20=mfkHjgsOq8WJfNqwiVVg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

-- 
Dear Friend,

I have an important message for you.

Sincerely,

Mr thaj xoa
Deputy Financial State Securities Commission (SSC)
Hanoi-Vietnam
