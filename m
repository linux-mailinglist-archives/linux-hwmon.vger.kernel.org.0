Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84C72661542
	for <lists+linux-hwmon@lfdr.de>; Sun,  8 Jan 2023 13:56:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232885AbjAHM4x (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sun, 8 Jan 2023 07:56:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbjAHM4x (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 8 Jan 2023 07:56:53 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A251DEF7
        for <linux-hwmon@vger.kernel.org>; Sun,  8 Jan 2023 04:56:52 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id s5so8675518edc.12
        for <linux-hwmon@vger.kernel.org>; Sun, 08 Jan 2023 04:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IEfjnjRXE9QZTXb79EM1wVeXy9mwHMOyVXXO9n++FAQ=;
        b=I1P9NqkE2JoAH0oUWLcJ4SQi3L7R3BtR29RXVP4BQlVXzVyD/YKIr0Vy3iDahHQRoe
         uMkXLbQ0HTR6bpRI7lJeuUqDowJftn2o2PfAHfevGOzi8peWMZy7cD+kf4T9Sv3gByXe
         p+P+YD8Hfa1L6IGHQQDDODMCyaNtHG63rwa0U0AmqZsvFMGjX7I3qTkJnH+KLll7XNpF
         1V3OWBmXfQWN6Q6byQgcp24ibFuBJxSBDAQjAJCaA6A86VQJjJlToyvdgIZIOU5sgRmf
         YFe0J8dHKevb6RCPL6QBWHr3OTOnjdEUssBOykZDuuns8fd7Fu1jGEwJfWBLGnu8Sspz
         vHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IEfjnjRXE9QZTXb79EM1wVeXy9mwHMOyVXXO9n++FAQ=;
        b=RPFEM/3PyWTXuJOLsbC1wbdCh6diRJvzJkbIufC7louAGhbITfOSq4KOEQu1Y8D3Li
         lqrROA5ii5mcT9+Jam8D69vrJp2I1BFtR1ZiNU32TumqsNZT8lx6KoAqWKYHOI7G0Mx/
         3tBNBp6WOTziSml09yx737dkmQMYSCxpFiHwKdduKQcPfMvDJV+rDxIDIX7zqVG3vT3g
         9jxVhgfBqn7gqvMMcLaz6N3A+SwHgrH5lsdKm9/65CgAaRB5Te25mMja9QbQ3jer4j/D
         qYIpvkBzY/CBhCX2d0S57N2eoZn3U1QHTQtbACbAvIxXxclOISqDx0TLA66+3nXBm6od
         M/3g==
X-Gm-Message-State: AFqh2krIxOi0CPlIe4VEzgjwcyhFGZQGZL42KG4qiWMgB7A8Enj5EBe7
        /ng5iq7SGJtERR+KYU9rd2XJGfDhRc/pt6OxpiiQnJ1vwLo=
X-Google-Smtp-Source: AMrXdXvIOo3+169lCRuE5Jk8POonXmh5SMNPI+nRitQfGYRBcyrMl/GUqPtL0mQv5A3Xr37AUiX1/V07ZXuTybR6b4I=
X-Received: by 2002:aa7:d35a:0:b0:46c:4b56:8c06 with SMTP id
 m26-20020aa7d35a000000b0046c4b568c06mr5594837edr.230.1673182252467; Sun, 08
 Jan 2023 04:50:52 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:906:160a:b0:84d:390c:46fb with HTTP; Sun, 8 Jan 2023
 04:50:51 -0800 (PST)
Reply-To: susanklatten0411@gmail.com
From:   Susan Klatten <luiskyunguti@gmail.com>
Date:   Sun, 8 Jan 2023 04:50:51 -0800
Message-ID: <CAFX96k=b-0KrUncxBANeASgodUY8JdaFRV3T1VheCWGyGkhpQQ@mail.gmail.com>
Subject: RE:
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

-- 
Hello, I am Susanne Klatten.

Do you know our company gives out Xmas loan offer, Do you need a loan?
If yes contact for more details..

Email : susanklatten0411@gmail.com

Executive Chairman
Susanne Klatten

click link below to know more information about us .

https://en.wikipedia.org/wiki/Susanne_Klatten
https://www.forbes.com/profile/susanne-klatten
