Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5CE5689A20
	for <lists+linux-hwmon@lfdr.de>; Fri,  3 Feb 2023 14:50:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231347AbjBCNuF (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 3 Feb 2023 08:50:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231495AbjBCNuF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 3 Feb 2023 08:50:05 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59BA79A81D
        for <linux-hwmon@vger.kernel.org>; Fri,  3 Feb 2023 05:50:01 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id a1so6270498ybj.9
        for <linux-hwmon@vger.kernel.org>; Fri, 03 Feb 2023 05:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aHi7L3ElqiR5rawxK6RGMrG2QP2Us+NIPyq+8gsU7A8=;
        b=hQlGcys3oEHCvlELfZZzpcJj677hC++fv9ffePNp/yuY+rkjP6xY3AkyoXtRlYqF1j
         D5zdGCcP1F646/8vUXt/bSXEA17YT+EClS1DGAiP33v5fveMuvAyLYuQthdr5HdNDXBG
         SHNEBOBYR+CAfgFpQjQ/mxvbY897BQCZFaxn7Bb4igwFxwpporjhswvvPeLl3d0ekbH5
         U2+psHcgD0zVUGEDOMQStx9Pjelo2svUPhgtbOo5rRtB0+OSdsR5P7Ibf1Drlm4yeY01
         eYHYUp+vxeTeO0/HQR+Qz9AZ5gsZyNB01IVXp+nyb086MdazRaVAnXqdLvaN2NxYwQ4A
         pkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aHi7L3ElqiR5rawxK6RGMrG2QP2Us+NIPyq+8gsU7A8=;
        b=yEUwXHEtOwuqrWh9WYCFA5wt5HcU2QwzQ4D0QoW5zDy587R0E0FM7lt/LvM7Q+5a1Q
         es2SQM9byhyvfF0KC07O/+im4U28uOtKLpmBQ+nRDj//63E6vsRVC8vTuZu6CerUBx/c
         sre7hVghVNGiRZ5W3h9JJ6gyhdfXVP/NTMNtLLcAGsYOBdpUps1DB87srE3mackTwBj3
         P9nY1r0IC15Vy/wZkLf7fqBNERbtGSlp2nCR62Z9m48n8BiL+0v9y2ntxkodc3v/62cS
         DL0vkLaKrXIiXEulFR9KkO4KfZ2VIsaYYW8mY/03WcSwlJ01cmkP/MxDc6SkPFtt8UAp
         7kiQ==
X-Gm-Message-State: AO0yUKWrxtEaLapMLIzynDhYAU897xe9vbb9LtTJxQj7EaHMg2rULK9k
        hXM4W5Des7jNjvVoIy7NaZPcuBgJoDWZ0fzCjOM=
X-Google-Smtp-Source: AK7set8HrUXyn0fEG7FXfr3yopYmbUEldFyaQzOd9zuSpTCZeRlXo9utzZrKo4FGTMMYeiBhIgo9Qp83kyBJVm4k5Vw=
X-Received: by 2002:a05:6902:4e2:b0:80f:3b51:ddf5 with SMTP id
 w2-20020a05690204e200b0080f3b51ddf5mr1224071ybs.507.1675432200589; Fri, 03
 Feb 2023 05:50:00 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7000:a050:b0:467:ccb7:5991 with HTTP; Fri, 3 Feb 2023
 05:50:00 -0800 (PST)
From:   Duncan Whiston <pacesslaw@gmail.com>
Date:   Fri, 3 Feb 2023 14:50:00 +0100
Message-ID: <CADCSMa=4QbdE8Sr6mYVefyOUyG=Jck2wLYj0K-tCHfYsJBZL=w@mail.gmail.com>
Subject: Fwd:
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

I have been waiting to hear from you or don't you received my previous email?
