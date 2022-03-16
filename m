Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6644DB614
	for <lists+linux-hwmon@lfdr.de>; Wed, 16 Mar 2022 17:24:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344344AbiCPQZm (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 16 Mar 2022 12:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343776AbiCPQZl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 16 Mar 2022 12:25:41 -0400
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA511EEE0
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Mar 2022 09:24:27 -0700 (PDT)
Received: by mail-oo1-xc2f.google.com with SMTP id y27-20020a4a9c1b000000b0032129651bb0so3293847ooj.2
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Mar 2022 09:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=rwiTA4Y7TJWNOsGAlMTD/9bfqq6FTQ/w+q4REGzF+YI=;
        b=pKDV6HiDnIS0o7tnapIG6QpuwLs2cf6eomv9wccDU6U6txc9HmdbS05qeXEWkjy2pb
         yDw7P6DSnLizvo52gh/dWXZz1udeR+vGwamzywySUoZGxAMH3WoaHkJHeM8iCS1/HH6k
         daRB801P+fEHGgBMzPHXl/XhEdWJFYxKujOsWRBUbFuPON+AmIu2cUu+utQk0v9vK4mK
         g+1+ymDjaeLPk1vuwufq3nJHOqSxk7au5Hatda4uvihuMmGntM/Qmbv+USn0XIrrNQ/5
         EuVRtUdEEYgLJg3Bfsq+a0NN0z28XVVB3IR9R9d2RU13e0v7y5Ui0KRx81x3qabXCp3N
         oHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=rwiTA4Y7TJWNOsGAlMTD/9bfqq6FTQ/w+q4REGzF+YI=;
        b=zWInXL/u5PYL5edIh9/FUWQEvKpaXIBvvK+sbYxPxtiNPKqboep7PJpuK1ilWv8WAg
         jMMgS97PV0h/rGiiDF8UPOVkTU9fPSNlBI5Oslxem0aZqaiwfWBertXmtCWRWbjR8dpj
         1EFrAVGLJGngeGwC3x3bs9hKsmUDfoiFDhcra3mx+6xvyWEcGKzaUL94+Y9FpyQ1Afz4
         HbSHVP1SIjpIdnNlWS5YIb8y492+Nqo7L9eKwE5vOUHsDTIL72bqAlivxSh2FZ1vLjkN
         cwRYs+W0h37QHeAwbbPtbvsr3Tn2vi1OPSdANr4JYWHZj0RFLIeiOVUvh0LwkTAcuy5G
         99Gw==
X-Gm-Message-State: AOAM531J3xHR+Mxe9eAnHQL8K4M7+FJBeLVwSQtZu9q6wOvmYzZiGGIk
        rQ3rzG/DYnXauCNrK8cIOY76NIqz49s6cWFiR0s=
X-Google-Smtp-Source: ABdhPJyBhcojQH36dTFiseFrmD8TpCOYBBmxk08sbe2uFjhXGUOEzKk8qAVDVd3MLabEKNGS7gd6f7j3mvuPvr4pLFE=
X-Received: by 2002:a05:6870:8186:b0:da:b3f:2b2e with SMTP id
 k6-20020a056870818600b000da0b3f2b2emr3769368oae.205.1647447866354; Wed, 16
 Mar 2022 09:24:26 -0700 (PDT)
MIME-Version: 1.0
Sender: eldristanko@gmail.com
Received: by 2002:a4a:b682:0:0:0:0:0 with HTTP; Wed, 16 Mar 2022 09:24:25
 -0700 (PDT)
From:   MRS AMINATA ZONGO <mrsaminatazongo@gmail.com>
Date:   Wed, 16 Mar 2022 17:24:25 +0100
X-Google-Sender-Auth: pQzpJWvW-DyEJx-_ADwkJ-hpn1I
Message-ID: <CALry08U_oisvZ7Z__gB7g0OcPMyKBg1rK+bch9BeB7z-MpyzuA@mail.gmail.com>
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
