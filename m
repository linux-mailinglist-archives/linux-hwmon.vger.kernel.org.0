Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81CF84B4078
	for <lists+linux-hwmon@lfdr.de>; Mon, 14 Feb 2022 04:44:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240102AbiBNDon (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sun, 13 Feb 2022 22:44:43 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbiBNDon (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 13 Feb 2022 22:44:43 -0500
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA0C156212
        for <linux-hwmon@vger.kernel.org>; Sun, 13 Feb 2022 19:44:36 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id t1so14415375qtq.13
        for <linux-hwmon@vger.kernel.org>; Sun, 13 Feb 2022 19:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=N9tEFmJ5EUuxB+3+X+96jFuGp4B/wZQHGYlWHIoC8HU=;
        b=qaHl6B8AsYM2ePzaEYwIOMQf8nTj4HbD9xbTi9nkwyJc/0wkCHcpyEikWhlD6PZx/8
         27A4londVmXvkfOYyak0CtksLGnTtMqqaQW/5NndhpDNBarfpHMdOBYevHNwQ1j2h8Nn
         AyvvfOeKhzT83Fy+dAvWbc5BdNmzlv/dvRtEblWMYIDUMl4FTDimVma3szfO6QN6R5E9
         EOep1lt+TvNlXmH4Q1RT6EEyiNSApgownDFC9uQMoY/77HQpWcBRCtY4YiGwMKWxQZ9t
         FQEmffc12bY8TQ21fxqfiHtdeKgN8VxEEC1GNorj7d6W+Zk2hmGVhPBhmybzM2NgBKil
         TBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=N9tEFmJ5EUuxB+3+X+96jFuGp4B/wZQHGYlWHIoC8HU=;
        b=qBGscUfp8iydUdxxyUQIuJhLiDbPHaepafNfbgvMuTZl8LjSl0eHLTlqzb8AkBKUEO
         dVeaYTJjuSDP0LP+M/40LV/nUnlmzwnOrHj4XGHTyqWxmNIGKjfwyRYudg+Dc4Nmqs64
         ZNcfxOze1nIrdVSFK8t/IYATOKU6+uwGOuiOOKoZuzYH+GiEg3K8cXM7GyVhGXzpclmd
         6tiwBW3LU20plXkFooG3HVqqOfvo8+UHGdOvOS/KkUe6cuuK4Ye8BJ+PdQriYZPtvWg4
         dxi1mV1jXy3UiXiTH6t44sLgL4+Pu/q9N39v0bircb9L+H3HKTZUe/eO1Z2935F8hcHn
         8VZQ==
X-Gm-Message-State: AOAM533H4URVnVSjOszF6J3tckT1cNbxEkcIbjcYr+klb5TklVpYvryk
        ZWh6vgHWPmPlTaRRAyDoo1M6hHSJb9mwN1Y2Abo=
X-Google-Smtp-Source: ABdhPJzexJwldjd95Ap5wfOaoMVjO4Q0JwCURUxtjNK/36Zm7kQ+JfnJf6uHwPSCEpowlsojX5X7VSttK4kzctOQTEw=
X-Received: by 2002:ac8:5a50:: with SMTP id o16mr8193791qta.260.1644810276040;
 Sun, 13 Feb 2022 19:44:36 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad4:5c69:0:0:0:0:0 with HTTP; Sun, 13 Feb 2022 19:44:35
 -0800 (PST)
Reply-To: tiffanywiffany@gmx.com
From:   Tiffany Wiffany <ivanroberti284@gmail.com>
Date:   Sun, 13 Feb 2022 19:44:35 -0800
Message-ID: <CAKp8dfo_OCa+pUj=ODuJcbAbHNJO_Wr45nJMYk_DmrHsPm6oQA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

-- 
Hello, Please with honesty did you receive our message we send to you?
