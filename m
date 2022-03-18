Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5464DD9BB
	for <lists+linux-hwmon@lfdr.de>; Fri, 18 Mar 2022 13:30:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236116AbiCRMbw (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 18 Mar 2022 08:31:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230274AbiCRMbw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Mar 2022 08:31:52 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 142402D63BF
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Mar 2022 05:30:34 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id u198so1039417vsu.10
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Mar 2022 05:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=rwiTA4Y7TJWNOsGAlMTD/9bfqq6FTQ/w+q4REGzF+YI=;
        b=PJk9x/BjULcUZutQMxM8IAabp57SGckZuN3UKL2V7E23cY2Lq8/StgnSPTeI1dEtPF
         Pp43pKFyXRFhJuLNEgBnlt4/UbVonQD37AOY3uMaMVDo1Scfo5pYh2yCxrsW1xKaxcVR
         KEuAZQTLPhmS8Y0Ob2xYnMFbKTtiH/oRClbyNp9MkbV59kp9dk62C5wgrPJtyetO3/2r
         sKx9gJAbeoSwK+NZRIYPQDGHlUogwuLqeSu0hWXkE1570xDtiQu1EMN10te07+AVC9dY
         LWq0bVgtTyWCBI1T/eZw/XlwNJ3npOThXhQWlZwdmOjPVP7Rd13dCqk5tBN+NFWKcqSR
         9bfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=rwiTA4Y7TJWNOsGAlMTD/9bfqq6FTQ/w+q4REGzF+YI=;
        b=nMbIdjicMRikxxX0JsxntTnBVcTylFbuAlXHNI0l4dtyMPWuLVMXkxbV2fW+TNNQMw
         5O3jg6f0qNx2LGQdFGQMqLejEcmcZmEZ1gUI1eI3bNzL0WEhgp+LWk65lgWE+R6OWP79
         HwR2X5Jcr1UZuYpomI5jbH5F9XO5OMDCiE2r1OyyoNsNZg+bl8PD1EpwAk5TkqkFoEll
         C1tZFm5altumkelBe44RBqGunlll+AQQxd+5nD4UOxcJr27WOtwLl3rJX03h2JT8UgRN
         jJNpdd8Zvc3ZPRfVrN7JVlIy+daA0Lmk5SeNzC98+svCC/8rtCTW6JEk+8DAPb78Z0//
         J9tQ==
X-Gm-Message-State: AOAM5323LM/yHMwbqk2cxcabMsZ6omQnaNk6IyHz1dl9eKGsQVvaqxzx
        FO8TIJPsWN6LR5WH1WddT8GVoIXBRidl0plKoO8=
X-Google-Smtp-Source: ABdhPJylwguT/YuylMUmcNsjdNyvkODVW5ZHmmzHM9Bi63FIkvw1fNsP5UTZxODwJSTfx/8cFEFgenJa63LdUJG/mAw=
X-Received: by 2002:a05:6102:3a10:b0:322:fba3:1d81 with SMTP id
 b16-20020a0561023a1000b00322fba31d81mr3783157vsu.63.1647606633149; Fri, 18
 Mar 2022 05:30:33 -0700 (PDT)
MIME-Version: 1.0
Sender: info.unibbf@gmail.com
Received: by 2002:a59:c32c:0:b0:299:74ba:322c with HTTP; Fri, 18 Mar 2022
 05:30:32 -0700 (PDT)
From:   MRS AMINATA ZONGO <mrsaminatazongo@gmail.com>
Date:   Fri, 18 Mar 2022 13:30:32 +0100
X-Google-Sender-Auth: CN6O3NVTkd1fktfSyGwZKYWR-Sw
Message-ID: <CA+Ps-g+XC=yXDkEF=NOydCCFsDSHX18_o4R+rZe98D3KkTV09w@mail.gmail.com>
Subject: ATTENTION PLEASE,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,LOTS_OF_MONEY,
        MILLION_HUNDRED,MILLION_USD,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        SUBJ_ALL_CAPS,SUBJ_ATTENTION,T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
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


Best Regards,
Mrs Aminata Zongo.
