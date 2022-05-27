Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 748E15359B1
	for <lists+linux-hwmon@lfdr.de>; Fri, 27 May 2022 08:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344512AbiE0GzE (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 27 May 2022 02:55:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344648AbiE0Gy7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 27 May 2022 02:54:59 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5CFDBCA7
        for <linux-hwmon@vger.kernel.org>; Thu, 26 May 2022 23:54:58 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id l30so392777lfj.3
        for <linux-hwmon@vger.kernel.org>; Thu, 26 May 2022 23:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=33H7bzlF73boyoKARvolMJlGymprQ+hHPrvlaQBxLsY=;
        b=cFB7s0A6Vncow/pUpyHYeS5uRA3Sa1oL7zKnv4ZePJIBO1Hlol5vIxoRR8Pf9MTFN9
         oS93ak0fZyAhEeiY9jUgF6ruvGq0YdAcUA/FlNpE9Yi9Vzbw7BtUCGUziY3UdhZZ/vaf
         BOcIBSc1JtgDPny3sWXd1/rxfYsgb2ftoQVLZkOGNEO8qVK7fkH47I/rHZNBAPQ9aIBE
         Ws3Q6Neg6HiOA13NJiFH+4aMsQXXH0Qtnyn5l7BDNF2MbdsXBuc2uQSh4/OKnVb6hoRD
         /05oteHXZuuGdsvtQhqtoONPPPaSdkAusn+RjVQFzIjchroyCy7VqFLfAJAFNgzS6Elj
         kkWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=33H7bzlF73boyoKARvolMJlGymprQ+hHPrvlaQBxLsY=;
        b=LFL7MSOxKO7MZ/5OvbmOYK+tc2HER+VK7ZrmAegUy/BGqI+zM48O61KnK6l6ld1eAF
         u25tN8T70TXe++Lle4rQHXrMvA8l8pL4ieFIMC4IvgkE/dlpnSX8a7ZGgUJQEda9Zndm
         rE+2VjkoDfDNYYFrHs9dRjqe8I9PLW2rnBKtIG4KCCKCifgGcNBaYu9BmDJe+s1UHqT6
         LfdhLYf3jewZt2BgNJK3BLJ49TTw8nAadQ+wjVI+s0Xns7CYbaoXIYd7OMQzrKx1+d0y
         hdn3P7lvYFIIIXpU9mWUQJc1EWC9TFk6TtLkY1PY26r2yI3Y5s10CjwirpmiyGTIBpkE
         ia/g==
X-Gm-Message-State: AOAM533mC77iSJ1cSiKIGLYKAC0z8bnniFAhKyKLpDCLJDuDZaC5afzV
        OdtvPrVHWsWLpKkwxoDpmn7xUJSPqxcVQe9yO/I=
X-Google-Smtp-Source: ABdhPJxl8H0jAMQNpnwAKcBcQ33aGejJlX/037l/K5+4xKUMvuR/pjYp4WPxSC7JK7gs2uOWP4QKrWTIYDKqWUkuF1k=
X-Received: by 2002:ac2:5a07:0:b0:478:8433:30c1 with SMTP id
 q7-20020ac25a07000000b00478843330c1mr12757539lfn.377.1653634496714; Thu, 26
 May 2022 23:54:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6512:b84:0:0:0:0 with HTTP; Thu, 26 May 2022 23:54:56
 -0700 (PDT)
Reply-To: BAkermarrtin@gmail.com
From:   Martin Baker <alfaroukkhadija@gmail.com>
Date:   Fri, 27 May 2022 06:54:56 +0000
Message-ID: <CAF1Q0JmVfSYK8Jf00Amkz8uT+RCvTW6Tq6L7uA8Gx=d38KfR4w@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello,


I wrote to you this morning because I have something to tell you, please
let me know if you read my previous post today.
