Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97B5C4CC253
	for <lists+linux-hwmon@lfdr.de>; Thu,  3 Mar 2022 17:11:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231693AbiCCQLo (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 3 Mar 2022 11:11:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231336AbiCCQLl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 3 Mar 2022 11:11:41 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64A11198D2B
        for <linux-hwmon@vger.kernel.org>; Thu,  3 Mar 2022 08:10:56 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id bx5so4931237pjb.3
        for <linux-hwmon@vger.kernel.org>; Thu, 03 Mar 2022 08:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=XtI1f9sWRZ2UC78GPu4V47vwU7sGdDfWHDLuspgulf8=;
        b=XB0jY9odwewPf7BjZWvYEQoeU6oe1lLDshi6euQr7NvftabDxp2O8Azd0CvtUnE/kC
         N75q9kQVjJl1vbp/0PlgUYMsmfHj8pf0zLJzU+ZisSO+MEeWmSbrw2HS0twTAcIR0d+W
         ucKifwEaX/s9tFUDLG5DVL0lICdlxGcd1n1kGCggL6Q4Q+7EoIAWRuCn8/B2TbqAAsTp
         AAFd2U6SUQIgVRebsLeWHWjrPk4V7pqS1Gcz38J0CPediT+/kvOm9TrH+FFoGrFh/AkY
         MuDurGt4hCew2bXjHu/P0E6kU4IVzrPZCfjaVPrledFm6kt35jOOyq3WtW5F4XS9CFoX
         eQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=XtI1f9sWRZ2UC78GPu4V47vwU7sGdDfWHDLuspgulf8=;
        b=2vbKd14+Dun+cf9m0W/5x0JxF4EDnPllXcciJgnnKVYiy3wmN1q52tkGnCwOI7xvi0
         pg+pwZdDrXpFl28ayMq7wHlmMJXgcoFi2g/TGuHZ9bLUnqmSRTmo49uLvpErknNlpVKz
         0d21FvM5/onrRKPVvnHixsF9JHTEVxlbFK0f6lQy+6DwQvSCX8z9hbRHyLacdo3c8O64
         iCJ0b6qhdZ2TZasD+ZZ5FOGOEl55qLC9RTC4TU+IOBHUbqxSb68X6OhRoMOH2hS61Jeb
         NFRutQsIhFLXsaEy1HV5U84Z2uaftpoQvSkKp2m4cFXQvrSvFbiiEF9HoBz32d+7WOJ8
         TG3g==
X-Gm-Message-State: AOAM533L4pQjjZC91RYfhYxoB+uLGI+7OnHM+xUnjycehWk1TKwUbn3j
        61kACoQihgkcyQtyGDnJj4WzQLQ/5smWmB7vnK4=
X-Google-Smtp-Source: ABdhPJzxHJTm6PN3KYLue4eJbIwc1OSqCrK0sjgcVrB87N80gaj02XYaEhV5R826XowAC6cm6QKUuOtr8wP1pkT/2HU=
X-Received: by 2002:a17:902:e745:b0:151:5474:d3ed with SMTP id
 p5-20020a170902e74500b001515474d3edmr25289088plf.106.1646323855934; Thu, 03
 Mar 2022 08:10:55 -0800 (PST)
MIME-Version: 1.0
Sender: drzandhazz@gmail.com
Received: by 2002:ac4:d346:0:b0:4a1:dfd8:3e14 with HTTP; Thu, 3 Mar 2022
 08:10:55 -0800 (PST)
From:   MRS AMINATA ZONGO <mrsaminatazongo@gmail.com>
Date:   Thu, 3 Mar 2022 17:10:55 +0100
X-Google-Sender-Auth: f79T-DACC6Q9ujr4Bpy1BI4n0kI
Message-ID: <CAEaXoG-MaShrn3e=jjDG0_E9PigxduOwuWguD9kOfnQfKDNqRQ@mail.gmail.com>
Subject: ATTENTION PLEASE,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,LOTS_OF_MONEY,
        MILLION_HUNDRED,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        SUBJ_ALL_CAPS,T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
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
grant me the benefit of doubt and hear me out. I need you to signify
your interest by replying to my mail.

Honestly, i have business transaction worth the sum of
(US$8,200,000.00) Eight Million two hundred thousand united state
dollars to transfer to you through proper documentation in position of
your own Account.

Most importantly, I will need you to promise to keep whatever you
learn from me between us even if you decide not to go along with me. I
will make more details available to you on receipt of a positive
response from you.

This transaction is risk-free; please urgently confirm your
willingness and interest to assist in this deal, I am in good faith
and with trust waiting for your Urgent respond and maximum cooperation
for more details.

Best Regards,
Mrs Aminata Zongo.
