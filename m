Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAD684F1A51
	for <lists+linux-hwmon@lfdr.de>; Mon,  4 Apr 2022 23:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348457AbiDDVSU (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 4 Apr 2022 17:18:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378915AbiDDQEu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 4 Apr 2022 12:04:50 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B65A427D2
        for <linux-hwmon@vger.kernel.org>; Mon,  4 Apr 2022 09:02:54 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id gt4so3321044pjb.4
        for <linux-hwmon@vger.kernel.org>; Mon, 04 Apr 2022 09:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=AWQj0xMfgcrQexRXcREpVygq7xbKIh3fCnrIBlB3bPjYI5PndCdAAWiqltStEp5edN
         sd8etuic+XyNYdX+4nTSs79JoFMnmIDmxL8cTUHCWPLOUmLdmX3q2Ck9S62M1ieKUtBz
         fd6mDzQRENY0c/qP2QLowESbp/F+VcLAsCfw109gP0F77bHKtIhpxuvs8vVcqu6qG8uh
         OcJ8bdamDCzFjn6uyaZbpDQuFGO7iIDKPpZLnXLwHkQoAZ18Lkp1pvoEwYvHv1w7S4vF
         B3am6KoV74q7kKEVLRN83i4HX9BsE98v+aALedwzdT0b8iMR2h8N/cts67oaz1VWDyeB
         hHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=3oH/qIwfx1gx2YymK2Ck8YAVkAQStoo1RSGEc4IkBZC2ZH3mnWHwyNzbFjiCkUUzgq
         p9eqqzAvof7qpdMiasKxJK7rn8n6AzE0lWvqJpdNCkTgwwY1/wqbKYYQ+UnDJYXMKCqB
         iJj4EePDQ+iXEe4+fIAwpsM84aI08QAErlyzqcpaqDmJht2rDuzqzJTsFWOe9uZeZ3Mn
         eRAA5z5kNSeXT4FsAq3utilcLhYN1fw9jg6SADMhzBWiWvTMCIf/iz7cvrDNdoBV0QLW
         hXodq2GCL3eR5ioXxmeFHoSTkYehEsOfS2VQnKT/byLq4mtXR7Bhi7FlF/+aXua/rh/p
         Ynrw==
X-Gm-Message-State: AOAM532P66HWEckxF/ioLCQbnUMy4rFR1FMeHDLUFbbNbgrbbnuRbcEF
        GYxuodvZez+FN64e8F1C4yk9AivRgQxPjrVgtIQ=
X-Google-Smtp-Source: ABdhPJwuuaNHvJLrzxZhka72nZI5BuutVsF71qrHz1ZKY6yROxgtx1Ef65tPp7AUzY1XOPlNB1nwcLCcUKlc361We+c=
X-Received: by 2002:a17:90a:888:b0:1ca:a9ac:c866 with SMTP id
 v8-20020a17090a088800b001caa9acc866mr529946pjc.203.1649088173724; Mon, 04 Apr
 2022 09:02:53 -0700 (PDT)
MIME-Version: 1.0
Sender: liaahilliaahilliaahil@gmail.com
Received: by 2002:ac4:cd93:0:b0:4a1:b6d7:fb5 with HTTP; Mon, 4 Apr 2022
 09:02:52 -0700 (PDT)
From:   Lia Ahil <mrsliaahil070@gmail.com>
Date:   Mon, 4 Apr 2022 16:02:52 +0000
X-Google-Sender-Auth: Wc8Xc9LyfldK-66V1wfAG0melTo
Message-ID: <CALfBs9G3aGKXBpPiv=CGqHa++j5u-9xNPszRdpLJ7DHXTGk3Dw@mail.gmail.com>
Subject: Hello,Did you receive my email message
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


