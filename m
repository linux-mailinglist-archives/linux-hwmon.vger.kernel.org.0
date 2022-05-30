Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13D055374BB
	for <lists+linux-hwmon@lfdr.de>; Mon, 30 May 2022 09:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232918AbiE3GfW (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 30 May 2022 02:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231372AbiE3GfV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 30 May 2022 02:35:21 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 968015522E
        for <linux-hwmon@vger.kernel.org>; Sun, 29 May 2022 23:35:20 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id gh17so18860835ejc.6
        for <linux-hwmon@vger.kernel.org>; Sun, 29 May 2022 23:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=dhKVbHB+tGxKra04y2wjmI3gGDhr700suXI/higJUsk=;
        b=agjmAGASm2I9fBY3U1HqRuhR6dFT9o2Krx+91iJODnjieGYpQ1gNCRqBKvnQTDu703
         TmRlrIebM2tQjGcaNE2Cju5JRpEHA7q3lKalPQ8BBwgBfQtQAVgklC1Hpc4p0vr2EPUM
         GR+nXg1hMUENhhCw+tWFJWEOrx7Z9A+Ht2zxdcak1uxJY0a3gYntPf9rbx2ZcHI63rnF
         iH/lP2J7MWcL2Lw5NxVdgaQMugzpHe5gPsT+xhDZ3yh0tXhdoNC56S83ZkwmM3p7M/7b
         8ntmDke19s+j3oTJhL/+7F6SENSZgRh/sQBUlBvAoFBCOrPxQ4JW8GkKeaceIaZZ1Y4O
         wTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=dhKVbHB+tGxKra04y2wjmI3gGDhr700suXI/higJUsk=;
        b=Gc+pfnlylqKRFcegIus1FGawwBAwwejFxNFMHKD4Wf2ZhEkO4qbSMh2SoaWoh7ask7
         vfBFUpioY+6uTDi2VxTXiDuh8Kp/Qe7eanwSEFRm8eXl3rtMzRcTM6TDm2SgfXCWEGBS
         V+KF8GSGa4/1hExLlPYAaoArERJapNkEu+zwJ86a4AFWTKuSKdy2tQc+j7WZbs8ZrdK7
         hwqtcdbnbYzLkAzaGuLKyGH1pEIJTqzVa/PqYQ0W9aa5PzuLqqABaybF1G7WOrdw+zKM
         eA/QlqYyGL7uv88PLZQExVnWj9Xr5YvgEhIJKLd+kiDDM3+pUkYktKmppemZ3BUTReUH
         AmSw==
X-Gm-Message-State: AOAM532nfjbf0m92nn2eH+ZRp/W6eyMe8PWxlDEh9ikn8v47cs+ZeiWs
        EH+Ba72W3DDYcewaMe8CeSodrpDSGt8RGPPn3HA=
X-Google-Smtp-Source: ABdhPJxEBU2Q82eNW1X7AopLLfWH3ic/SMwZC7tVthcPdrm9iI189TdAJEdbIJuLMI27zXx3wYlXmGb5KhYWJiiUjVg=
X-Received: by 2002:a17:907:7294:b0:6ff:200e:8d62 with SMTP id
 dt20-20020a170907729400b006ff200e8d62mr17249550ejc.719.1653892519245; Sun, 29
 May 2022 23:35:19 -0700 (PDT)
MIME-Version: 1.0
Sender: leilatraore817@gmail.com
Received: by 2002:a05:6400:2417:0:0:0:0 with HTTP; Sun, 29 May 2022 23:35:18
 -0700 (PDT)
From:   Kayla Manthey <sgtkaylmanthey612@gmail.com>
Date:   Mon, 30 May 2022 06:35:18 +0000
X-Google-Sender-Auth: iMYlqJcgZi1KzGWAdgw85BPtalQ
Message-ID: <CAC9MqxND-qP11b0_zH_xOjjKk_p4-CCrcXyw77sg9J0fHy5E2w@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=2.0 required=5.0 tests=BAYES_80,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Bonjour, je n'ai pas encore re=C3=A7u de commentaires de votre part
concernant mes pr=C3=A9c=C3=A9dents e-mails.

Hallo, ik heb nog geen feedback van u ontvangen met betrekking tot
mijn eerdere e-mails.
