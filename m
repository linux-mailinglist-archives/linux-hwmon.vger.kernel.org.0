Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D87766C1D4
	for <lists+linux-hwmon@lfdr.de>; Mon, 16 Jan 2023 15:15:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232470AbjAPOPQ (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 16 Jan 2023 09:15:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232748AbjAPOOc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 16 Jan 2023 09:14:32 -0500
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9A1D2ED6A
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Jan 2023 06:05:37 -0800 (PST)
Received: by mail-vs1-xe2b.google.com with SMTP id v127so24724759vsb.12
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Jan 2023 06:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3yAnab8PEgOF+WmFVlDZxg35fp8oU18y6F8A28iJ8M=;
        b=i6t1nAYDQEvMy/TNDw/ys7Wb48i6BV5Qfus/zQGAkr1guVTJ1qHcYQ47twwhlUiciW
         bUqrS4U6DvNtcrcxwCoKh9idRKQfOXbs6kj22/B8bguTSJFnzZXPwMfzpiJsQEFBr8yc
         KJwvE6itycco9fLi5SBNXwM0Oh9q7h6fUH5Eqlm/eCJW1e0W5U4QjWPS9eWLnbL0MgxB
         oMekri1LSwuZeq3o2sqWBGdOZapWaN2fJxNx+JKhUikv0beEdroGrLYaERtiOcwj7gnf
         FPwg2JymB7FDgqml96KDfG6+BJ3/zwSxVJ9BZc56YXplGDYUK/+eNPq5arfmUS31ATO1
         CbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r3yAnab8PEgOF+WmFVlDZxg35fp8oU18y6F8A28iJ8M=;
        b=ak/lY5si3eHbyhXp8sWWtjI05S43fPg9KIpstMIwJ80D7liMRzY/s812FaoM/wC/dy
         nhKJOn2cQzBVGmqd+OrbMrYnkGu0n5MX6T2SRovy5gvRAGfoklfY7gsAcJaqPUiRZJPc
         HQF/XegBbT+pcWl08w22ARNwvlfNrC6Lj88ll6LhF9Dzq9FwBgCAY0z6/8VYMDGc1U05
         CJrEiTrLcvt1ddUyZRkrvBFlyyxwfvjH80SLdmyGf8K2yFDb6PJpIC3HonXCR9dmsSwv
         lGPJqiC1W5Hs7o/R8shJAfqQEPRb4Cl28inGgJAjspSZVGMpQZ3msMIMjFpLWo0xjRX1
         8omg==
X-Gm-Message-State: AFqh2kods9sw05QR/86HwsKb+cVwMqoxA/gHSxCl+KuhkJyHNPJDrlwc
        EfeG2LeyWIM4bfqnRGmmautqSNEY38ymfVgidD0=
X-Google-Smtp-Source: AMrXdXseseE6BSNpkM71rU/x164zHlVYlCoYSODmC8ZiZ7TDo0pD9KUoPAREkMX0z20wYcB1iNee7YzfHjAltY3b2tU=
X-Received: by 2002:a67:d48a:0:b0:3d1:2167:11ad with SMTP id
 g10-20020a67d48a000000b003d1216711admr1540866vsj.2.1673877936854; Mon, 16 Jan
 2023 06:05:36 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:612c:2806:b0:389:85df:af67 with HTTP; Mon, 16 Jan 2023
 06:05:30 -0800 (PST)
Reply-To: bsmyatee@gmail.com
From:   Grace Colbert <union.b.africa.ci@gmail.com>
Date:   Mon, 16 Jan 2023 14:05:30 +0000
Message-ID: <CACcPegjVbG+GQrmfRuzZFP9UPxt2gDMJqvBB+x+j_+g3hWvrQQ@mail.gmail.com>
Subject: from Grace Colbert
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.4 required=5.0 tests=BAYES_80,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e2b listed in]
        [list.dnswl.org]
        *  2.0 BAYES_80 BODY: Bayes spam probability is 80 to 95%
        *      [score: 0.8572]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [union.b.africa.ci[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.6 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Good morning from Republic of Lome Togo my name is Grace Colbert I am
an orphan girl I'll share my troubles if you reply my email ,I have no
mother no father No sister no brother.
When you reply me i tell you the most beautiful part of myself and
your help is needed to carry on my inheritancy to your country.

Thanks
Grace Colbert
