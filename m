Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99EE54EB5E4
	for <lists+linux-hwmon@lfdr.de>; Wed, 30 Mar 2022 00:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235540AbiC2WbO (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 29 Mar 2022 18:31:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237209AbiC2WbO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Mar 2022 18:31:14 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61C1863BDB
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Mar 2022 15:29:30 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id r7so11185320wmq.2
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Mar 2022 15:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:mime-version:content-transfer-encoding
         :content-description:subject:to:from:date:reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=mkykjw0sZFsP3YGnBI2LiMNcc+a5omLcd1m9Z6KilXwroOFKH62wLjaq4b/cxew9Gx
         i+MH4yD+orUBcrnd4fZVEsJmwukUT+ktP+Kw0jhabcTNHH/NkgPjKHf2JTrAn5oWxDPj
         6hKzn7WUeoCFxOGqCHbczwvSLP3HoEnsAL4ktweuf15NSyhP+wK2G5eZ4mBx0xU5Xr22
         taRN7Z+Ill6HqCeeoEDVKkbPJYp7erpcYjn9QQeWCD09Qbyk73GpvNqwcfTRkMRqzSSH
         5jVs7Tkoog6t9MR2237NVcvVkBcd/aXmZjJMoY7leNYvw0wXa3e0Uhy/+OCLRemzWi/9
         3qqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:content-description:subject:to:from:date
         :reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=kzenWI8YohpC4brDAdi/qpmK3YgQJoP4R6+moysJta6rzwgF79xg4jZi/lWU3QNHk3
         uuxUaFl/+EQxO046CpZehMIlqzYQfvCXWCfVPrLRNAISFpNmitt9iF/Js3dGOXCmvy+7
         OReCtlLvdKD0NDYII8/5jMELnxUjR8l6MmSH6vI3y58hriX1uwJ8Dzy6LZkVxRWo+3gr
         86kYA7VeKiO4vFXAu/06F0JANTokPxTjj3hLX7Eyk5z7zJKKVVwJHQMC8hQB029mqvfs
         dzfHrnAx2bffvcN52QK4g+YmJhAPTxSa0mcNdbcErwjkObtJs0kWW8TvnVFYpjoey3LK
         +q5w==
X-Gm-Message-State: AOAM531CyhSryf2m6Ywcc6MVKUoGf1Rm/Usr3wSqDUWajDfjx1UOF7hJ
        4hBwIgx2jnOg8Je38qVV2WY=
X-Google-Smtp-Source: ABdhPJyR+f9YqXUEJZUOd1Im8tNkHTDvXLSQUKIZzvGBS21Xdfz09rFmmxF17e4nAQgCiO+il8V4DQ==
X-Received: by 2002:a05:600c:358f:b0:38c:c046:cb05 with SMTP id p15-20020a05600c358f00b0038cc046cb05mr1614398wmq.76.1648592968986;
        Tue, 29 Mar 2022 15:29:28 -0700 (PDT)
Received: from [172.20.10.4] ([102.91.4.27])
        by smtp.gmail.com with ESMTPSA id n18-20020a5d6612000000b00203fbd39059sm16004923wru.42.2022.03.29.15.29.22
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Mar 2022 15:29:27 -0700 (PDT)
Message-ID: <62438847.1c69fb81.4d4fe.f2c7@mx.google.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Gefeliciteerd, er is geld aan je gedoneerd
To:     Recipients <adeboyejofolashade55@gmail.com>
From:   adeboyejofolashade55@gmail.com
Date:   Tue, 29 Mar 2022 23:29:16 +0100
Reply-To: mike.weirsky.foundation003@gmail.com
X-Spam-Status: No, score=2.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,T_US_DOLLARS_3 autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Beste begunstigde,

 Je hebt een liefdadigheidsdonatie van ($ 10.000.000,00) van Mr. Mike Weirs=
ky, een winnaar van een powerball-jackpotloterij van $ 273 miljoen.  Ik don=
eer aan 5 willekeurige personen als je deze e-mail ontvangt, dan is je e-ma=
il geselecteerd na een spin-ball. Ik heb vrijwillig besloten om het bedrag =
van $ 10 miljoen USD aan jou te doneren als een van de geselecteerde 5, om =
mijn winst te verifi=EBren
 =

  Vriendelijk antwoord op: mike.weirsky.foundation003@gmail.com
 Voor uw claim.
