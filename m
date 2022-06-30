Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6DAC561E45
	for <lists+linux-hwmon@lfdr.de>; Thu, 30 Jun 2022 16:41:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235176AbiF3OkI (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 30 Jun 2022 10:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236496AbiF3Ojo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 30 Jun 2022 10:39:44 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 298E22BE7
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Jun 2022 07:39:43 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id y141so527221pfb.7
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Jun 2022 07:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=yiwxoqos/EgkmMPok/dKKFK/Ibklr21MP0XAPJlruYo=;
        b=IGI0KpTEkuFLU09GPe0413XNSitpPHvZktraglcZZZVdBap3WW3Qke7ctf1t877uKq
         03g9j09Y5jUpTl/oWUu2PbIfOivHTFYeChdGZdqzgI8scfCchDERDeFK6WoJyP1wWcLU
         tJ9Aq7SXSGD5LD8sv+RZPBLU4tSGr2pBfjuBiWgoorm2hsS0VjmzYPo1r1MRIUrX7pcj
         iL4Hm7uvdelCLovAMvr1uRQ0bWah2v4YqAZQVqSzPVEMglGo5TNvFifbqcwo4/bSf3oe
         roitbNRbKy/w3uZOCSiUSNKMpNkYSpYrYpF+qPn4orn3GaMrlA7fnzdHLLqPu88qDYe1
         qzpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=yiwxoqos/EgkmMPok/dKKFK/Ibklr21MP0XAPJlruYo=;
        b=5Na8DT3YKkmNe8uUXBjB0hbr2khuPmKERNYw6D+9V16zlzfdjNsg7+v/CQYwoO84RZ
         jnKG9lWXAzDXNlPp8/Rw/QipjK6u4A9U2F2wSi44zzdW8LuTFVjwvIg5nLKAkuSbC6g5
         c3cdp5lq7laEa4ojho64dKLxQ5WGLrr3pOKOWHV0iQ1RFiMwXGrwoAGi50rj43KDopjo
         RPL+C/WemNufzCzTHinmYkHtIQcZEMKoDoycLOcdtlX6TdEIHXwoiie3tfRbbfIzjGWb
         raT4NAwTInvsBFd1KyfKZ7uaVPe80h6+6i7wl+7DP5yGEGzpp1sKGTfZCx42Jeg/LMRr
         jUfQ==
X-Gm-Message-State: AJIora8MTVSo5eE+t3JjkDkuZ9+g6emhEw0H/L8TAHTW40RnQakv5RSH
        TVUWJz9egUP33cJl7hXCPCuF9IVqVhKQlZ9Ef4I=
X-Google-Smtp-Source: AGRyM1vj8nW/cek7Mzd3kCOQTSvs3alZgDdMrmmc/QMma1M+YVzZHAph4RbfMOSnPh+7DfFAce1sGo34JiUzKu1Cack=
X-Received: by 2002:a63:2014:0:b0:411:90a4:6e9c with SMTP id
 g20-20020a632014000000b0041190a46e9cmr5777416pgg.500.1656599982673; Thu, 30
 Jun 2022 07:39:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:c655:b0:2b3:6b69:5436 with HTTP; Thu, 30 Jun 2022
 07:39:42 -0700 (PDT)
Reply-To: michellegoodman45@gmail.com
From:   Michelle Goodman <michellegoodman358@gmail.com>
Date:   Thu, 30 Jun 2022 14:39:42 +0000
Message-ID: <CAAnwc9tiTQx3eEdNc0prMDCdJ-oCNvhZad7wEwLegGFAFTiDeg@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hallo, ich hoffe du hast meine Nachricht erhalten.
Ich brauche schnelle Reaktionen

Vielen Dank.
Michelle
