Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 899B05310D1
	for <lists+linux-hwmon@lfdr.de>; Mon, 23 May 2022 15:20:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234779AbiEWL2o (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 23 May 2022 07:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234793AbiEWL2l (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 May 2022 07:28:41 -0400
Received: from mail-oa1-x42.google.com (mail-oa1-x42.google.com [IPv6:2001:4860:4864:20::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A52444CD64
        for <linux-hwmon@vger.kernel.org>; Mon, 23 May 2022 04:28:38 -0700 (PDT)
Received: by mail-oa1-x42.google.com with SMTP id 586e51a60fabf-f1d2ea701dso18022235fac.10
        for <linux-hwmon@vger.kernel.org>; Mon, 23 May 2022 04:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uc-cl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=qRpLPEXifhdSAN4HELhHufSxIshxP72+dn/Z3U8FF88=;
        b=MC/0Cul2Ww+RxaVaSGrFYipmaNM3McFP4bZMoWTOEZR+wDKlFdlJxT1wQ/vAHBx4bu
         NKtKFPp7M4QX+rDyatLFsh1ffQlytiNIu6NfBUgH9QRBdTWxcCKvpVjnigus1eJScAD1
         rY4TkDFUEnEVA0CjECwOeCZz5+uYlbE7oN+PUQcKulUvVajWEk12k9TNaFO/r6+TZk93
         Tw21gf8OTdgGit/JGPCtiJuTsJf7rGYZzw9O/f8D0+iXMJsqpxEinHUxvd4HN/b5xjeN
         7PWhuAIhaJR3Mv/cI9XEWsGdRzf0cHKAQsAAZH6x5yquhyFcGyyFqrYSDfdRYHfP3y1j
         /hhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=qRpLPEXifhdSAN4HELhHufSxIshxP72+dn/Z3U8FF88=;
        b=nbMPF2iJP/Y2oAw+u29qB6ADX/q3qAnmhDFhI3C04EM3heeLuZciMmRmrlNmabxenb
         obd5sYBa1RMmkIH7rh8AFR6Aq5RBYlfNSIC1mnv65KnNB9J67nuS3QW1r3C4mtIMTEBs
         u0HDnp9r2Fso4hNi+s+irs1SiMqR8GcgVHOOee66anYI/HUd1xo30YbC4wU0UWbJnq7k
         UpYT5Y5m3PBVTX5dhQcPNW3Nxktg/jtUkzL0Rqt+82/KRExulrwsQRFi/D51LDBsg69K
         jQGzctD6k7W/71xZduOVaN8I5qCt3L6eKlsSejBaOIV2p4xGPKW+XbZMdyUOdI4RtHUv
         gHDA==
X-Gm-Message-State: AOAM532FbVfA31TuoMMeTWtTN7TxkT623Ge1JC3FsUBMjio4GrhO1nqR
        Wm1tlV4NmCrONpkUnIvfFaVhJLEmUofiWsbd4Jaf8Q==
X-Google-Smtp-Source: ABdhPJxm+D2iL6Ohh6DoVvQ2oyMQnVunTxkLTCClI8UXqjaCFDWWed+9WpK8aH2rbx1l4graIIY1sxIPnWzWUtveA+I=
X-Received: by 2002:a05:6870:a449:b0:f1:9e97:5b6f with SMTP id
 n9-20020a056870a44900b000f19e975b6fmr11874067oal.179.1653305317527; Mon, 23
 May 2022 04:28:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:8790:b0:a1:c98:6be7 with HTTP; Mon, 23 May 2022
 04:28:37 -0700 (PDT)
Reply-To: cinoj00@gmail.com
From:   "Jack C. Financial Home" <npsherling@uc.cl>
Date:   Mon, 23 May 2022 19:28:37 +0800
Message-ID: <CAF54Vf6uMLftw37mU=irtJ4-Zp-GJx2fJCit368-Y4ZvzcVJYg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FORGED_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

-- 
Jack C. Financial Home is giving out stress-free loans to new
applicants at a low interest rate of 3%. If interested, kindly apply
via cinoj00@gmail.com, call OR WhatsApp +1 (602) 730-1930. Thank you.
