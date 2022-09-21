Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8F625BFC3D
	for <lists+linux-hwmon@lfdr.de>; Wed, 21 Sep 2022 12:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbiIUKWE (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 21 Sep 2022 06:22:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbiIUKV5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Sep 2022 06:21:57 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AD4845997
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Sep 2022 03:21:57 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id a29so5459338pfk.5
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Sep 2022 03:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=j6c6RloR1f1meVJL/BrGR4Y0ez6uzlYlKHhaiRNYhs0=;
        b=qdYmRvvAYS44bF4r2Do75MklUjsJiuijVqf47SsDZn9OTsJBQXsG5SK2Fu9SQOgpDx
         1OSvs29ptBNXN06k1odNu/uz05VpQJ1i6yd6LeilCOXzf+y63G9To9F8S1+kOhZ7Bh4S
         LQ+R75OpxBmGpe9dBrawZr4QGL8rI1KSybJnV2Le5NNayAkJyQn/AyCrBRH04NMkE5GK
         xBiObQrc6gY99xrl6nDWMNEd+oRD642qbPjX6iLs8xqDWKYOXE87MoonJoSZAkoFnqJU
         8DUxpxjkaBFSfdxuA759zNwxos/mytxzDQHBrJHsGLJZTZMT/VCUX7G9awBLQ64EOGkZ
         IJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=j6c6RloR1f1meVJL/BrGR4Y0ez6uzlYlKHhaiRNYhs0=;
        b=fN5KMiDdbAnwwpr3sPSWVRw3nHe7c/MzyrKA+WB9MrqcqYYRT5JkymMcjqDdo8KHqi
         Sl6cYJNHW45wOAXW6fV32RyI6iFt+rHc9axwequvOWLqvn2iuJpe2d19OI/XHFBEIqSf
         c9vEMmSh6jHzfuw3wPz7WeAzEyPqH8wQt0kWDTIhUdViINb+znBkAtROXxqUrDf6rONC
         dbikgO4l1Zq7H+3bISdvn7v+CN2WfI/YVYO7izbilm3xBDUbp3X1YgKVM1vdDkSbG69/
         FAuQMiGtAKHouWKRvtzRJkJ9UTtSK5jHCTP7g8g3j2KtdH6njiQ1dF7DPuYSEFs+1c2r
         FOVA==
X-Gm-Message-State: ACrzQf0xzyCteGjRvuy/csQMGI3HSwEavkrNpgRp3z57qeQbdJtaJd0q
        ix+QRQ361I5Dnap5cDIAqPf/rjcmI/dpucVvZic=
X-Google-Smtp-Source: AMsMyM70vSMAUZf+f317Zb3ruK8NadjCLdLJqd3oVfImh8QnLkCcnLP3VgP2zdCrprxf5WDHYn+lc0J77kpyUfUNlD4=
X-Received: by 2002:a62:2503:0:b0:538:426a:af11 with SMTP id
 l3-20020a622503000000b00538426aaf11mr28756239pfl.22.1663755716421; Wed, 21
 Sep 2022 03:21:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7022:68f:b0:45:7316:c2dd with HTTP; Wed, 21 Sep 2022
 03:21:55 -0700 (PDT)
Reply-To: mmrstephen16@gmail.com
From:   "Mr. Stephen Melvin" <rossmrbruce@gmail.com>
Date:   Wed, 21 Sep 2022 03:21:55 -0700
Message-ID: <CAGct7GZBGbfanoUExeFxEBFB_hVUhQLHh=AwyfdotnOrjKSugg@mail.gmail.com>
Subject: Reply and let me know if you received this email!!!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello Dear, How are you today and your family? Want to believe you are
all doing great.

Please reply to me as fast as possible. I have important information for you.

Kind Regards,
Mr. Stephen Melvin.
