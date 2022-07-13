Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D518573C97
	for <lists+linux-hwmon@lfdr.de>; Wed, 13 Jul 2022 20:36:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236470AbiGMSgi (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 13 Jul 2022 14:36:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236391AbiGMSge (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 Jul 2022 14:36:34 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D98E2F386
        for <linux-hwmon@vger.kernel.org>; Wed, 13 Jul 2022 11:36:33 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id o5-20020a17090a3d4500b001ef76490983so5018061pjf.2
        for <linux-hwmon@vger.kernel.org>; Wed, 13 Jul 2022 11:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=h3E5IxIktqpSL+jOAYWPZjxWaDX/g7craifQNzPycXE=;
        b=ByexOtA7Ty+OVgUQgn6kqweWVbIgcSKIDsqMuB68IWaKRgC3FIUE2J1OUN02toSIuw
         Uw7qhyZrwz9RsQ/GRXSNHuFZICA/faqF7bNlxwKjXaGYyDURXg9fIByWUxCLyaDAkdm5
         YLyzEo4XZ17UchQ5bWJZTixafeVsbWwSUMrk7P1vPKtS1V+UkozrHZmFFa5ragqSauWY
         yXNmrRzhJruK70380sm0Xd7YBLsXVk2GRezvc/oKSwC5S4NPLhE9Lcd21vKbcFxD2v+s
         Saha0vrZlr0KbzilwhF0BGFuEqJcKIJPHcnDuberws9Vdw/dIevqAhN2476u51OvEMiR
         A+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=h3E5IxIktqpSL+jOAYWPZjxWaDX/g7craifQNzPycXE=;
        b=Dpe9gdJhOa6laPfqafVZcWZ8mYzwFqTEzqlA387AniSg6agE2P6TsyeSkPPJ01p7lF
         AUi9exm4g+EKRfNQ5+lUSV9NEGLl2Kqp9bsESB5VoD3Cnxy2IMzglzx9egXLRMTve3sl
         Qd2tMV2pFS3nioa2ZQd+Y+XidZDEYcbnF/EH/bpPZBFS7Q/cs8KDVnVLDaXhu1QLg9Hd
         ujmAmCsmfNmUYmFoKp76+U5gAFLdiC1qpgyZj3/EFAjdnpCz7LAE2ckoGujCaDP5Ey8A
         7v6jx8NJMbliaR3yhmbGtyxfNjNWXfCyJv0GR3jKcHgWSkWqpqunYFNpj79w/iE92qG/
         5hcw==
X-Gm-Message-State: AJIora+JA5gapu2rW3W7Bql/SyrHOTYK/qTm4M4cdXWSBp6gJ7pDDwVG
        wN4D82SIFV3u7mKTHIXo8PMDpPFmdSO8uC/4D9U=
X-Google-Smtp-Source: AGRyM1sGlnd+UJbN2i9MrYME7ZhKij/lVUlglpmkFnCbtgmQCJmkICl6880ar0fbUZXPvMkvI27KxMddG1vzRIlqx6g=
X-Received: by 2002:a17:90b:4b49:b0:1ef:a03e:b671 with SMTP id
 mi9-20020a17090b4b4900b001efa03eb671mr11355529pjb.108.1657737393056; Wed, 13
 Jul 2022 11:36:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a06:15cd:b0:534:2eb7:18c3 with HTTP; Wed, 13 Jul 2022
 11:36:32 -0700 (PDT)
From:   Mama Marigo <mmarigo19@gmail.com>
Date:   Wed, 13 Jul 2022 19:36:32 +0100
Message-ID: <CACWfLDGzpmpbD2S5mPdYSRHTKAjiWSB+M3y5uyrV0gbyNmZu4w@mail.gmail.com>
Subject: hi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

-- 

my name is olivia ,i m single honest woman looking for a good honest
man to spend rest of my life with, if you are interested reply me back
i will send you some of my photo when you reply to know more each
other thanks and have a nice day olivia
