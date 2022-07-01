Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 543085636EA
	for <lists+linux-hwmon@lfdr.de>; Fri,  1 Jul 2022 17:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbiGAPbA (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 1 Jul 2022 11:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbiGAPa7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 1 Jul 2022 11:30:59 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 766042558A
        for <linux-hwmon@vger.kernel.org>; Fri,  1 Jul 2022 08:30:58 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id l24so2565197ion.13
        for <linux-hwmon@vger.kernel.org>; Fri, 01 Jul 2022 08:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=SuAs5+SqNuiPKMk34YV4HDlfxT26nEDXVcRkJfG6AAI=;
        b=MTTiI6Tmpy1D8yxCU54A8L/2WQhFiR88ew0OKjy+vwilUBd2q7qtihZtrfrAGEF+CT
         woMAXWP7I0fi1u4LzPSB/JxLI/HdGv4Dt/dT+QP+p67oP7ykBxDz2DCy4N72nJztbDJH
         HL7fab2pAXikUJwFX/hyYOqw8AuwrNV7eIiF+FwVqBubXp3U1M14WMUKUyUDwAzisQl0
         vwZS5ojE1hLZnZModVplgQj/Rx9fzl/31Uhr0h6TyO7t3a+IKsfzTq7MUfqY+LPOFx1r
         sOPLFoCvKsJGpFNyAGbpxKV9kbyLMmw7PBis4kHQ4YzuIYQtqp1YGcKjqG7rDDf3iOKt
         Sacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=SuAs5+SqNuiPKMk34YV4HDlfxT26nEDXVcRkJfG6AAI=;
        b=8K7JOUU7QagKpg2kHUMg4KA96US0JvMW0wY6S6N/p+Ev25KUWmnFLpq0ySlWiBtskr
         Xbl9ERkuJAcYTxeUFfKgz6K/IPZfRpSrnagOgIoode7dXl6vIfaih+XZdGymyS7kKGop
         ubNwoj9/t66HERiXi2heThCEjWYjLLl765MRRqM1ChR4j0ln44+0zHUnA4hJgc0ywzaU
         l1VgeF4Ec0Zt14R6+rDpi8wop5sm9E1mO0audqeWX2CFe/K3Nzsl5Gr8j38I7GTqqf3V
         AaNeTz4pZLnmsc8+vWW59s+EGwTaz95wvZMzroN19UtAbM2AkGoTHjf98kYZxD6vhaI/
         WZPA==
X-Gm-Message-State: AJIora8XNIQREUcMJm9J04TgbwTUZIPXqTqxLEF4flyf9nUgKuv/3gfm
        ouXa8iocucpB+BKPFs1AnPBfWPKIhVGG5C31nNY=
X-Google-Smtp-Source: AGRyM1uD//V31BOcha6wGgP+ZrHSIl5YE1hjw2KsCV12Bbxa6B3htkt+u9gsGcapvyGlQKnNYGSF/vCX1Au5xhgsK9k=
X-Received: by 2002:a05:6638:f95:b0:314:58f9:5896 with SMTP id
 h21-20020a0566380f9500b0031458f95896mr9023981jal.228.1656689457800; Fri, 01
 Jul 2022 08:30:57 -0700 (PDT)
MIME-Version: 1.0
Sender: vincentgeorgeag1@gmail.com
Received: by 2002:a05:6638:40a7:0:0:0:0 with HTTP; Fri, 1 Jul 2022 08:30:57
 -0700 (PDT)
From:   MRS AMINATA ZONGO <mrsaminatazongo@gmail.com>
Date:   Fri, 1 Jul 2022 17:30:57 +0200
X-Google-Sender-Auth: 0Zt0VGFVWvgUrpNyRCQ7u_ksyvs
Message-ID: <CAENe5cv6zPeQ8GiHcKTuofptwic1i3XQgwpgVFN9T+fjtT432g@mail.gmail.com>
Subject: ATTENTION PLEASE,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,MILLION_HUNDRED,MILLION_USD,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

ATTENTION PLEASE,

I am  Mrs Aminata Zongo, a personal Accountant/Executive board of
Directors working with United bank for African Burkina Faso (UBA). I
have an interesting business proposal for you that will be of immense
benefit to both of us. Although this may be hard for you to believe,
we stand to gain a huge amount  between us in a matter of days. Please
grant me the benefit of doubt and hear me out

Honestly, i have business transaction worth the sum of
(US$8,200,000.00) Eight Million two hundred thousand united state
dollars to transfer to you through proper documentation in position of
your own Account

Most importantly, I will need you to promise to keep whatever you
learn from me between us even if you decide not to go along with me. I
will make more details available to you on receipt of a positive
response from you

This transaction is risk-free; please urgently confirm your
willingness and interest to assist in this deal, I am in good faith
and with trust waiting for your Urgent respond and maximum cooperation
for more details

Best Regards,
Mrs Aminata Zongo.
