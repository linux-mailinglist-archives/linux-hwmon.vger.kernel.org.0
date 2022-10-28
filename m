Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD6661159F
	for <lists+linux-hwmon@lfdr.de>; Fri, 28 Oct 2022 17:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbiJ1PQS (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 28 Oct 2022 11:16:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbiJ1PQO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 Oct 2022 11:16:14 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDC79196EDC
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Oct 2022 08:15:24 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id y14so13643486ejd.9
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Oct 2022 08:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=huYKu3zCGUAjNe1V+fwzWUibgp5qt9T7Bp033OSK+pw=;
        b=DRBR8Gt5rK3lvlnfUunfI45nnZxBmRZOIBi+s12jFupA7imnvF7Q/vpHeJ3je5J7tT
         4+RycvkhuJW9XLWwZh5j4UMICuYyf3rhxNwmExFnMrwu7M3S/U5DohJtniR4WeSRiAah
         WpkNfhsGBRLgOfdrBB9rOTCG8meHOs5b35Yl5aYGZw/YRfJ2RTN0oaXjox9yBq+ErItL
         tAhj35ppZkga+kVDDSjYSoJ6kvjwL0XHcDdeVEwVNYzzKys3/kEMJfYc+CAQcn3WPXMZ
         /lFGJjxIZBJI5Ex5tTFOLQQMj0xsOCXKNHFm+9KAtmez2xQIUIvwyevZSzAG5Cp+Q/Rb
         MmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=huYKu3zCGUAjNe1V+fwzWUibgp5qt9T7Bp033OSK+pw=;
        b=yjEVyfQcYh5hiJ4Ih4wKy85KG5Mqr9pPz7YURqBH82/0LG3JSxE3YWNxFsGrX1fL2j
         Qf1Vx2V9Rc07kU1WXMA1X0aMu0yELNzDlj3om+C6FwjhSbACqYR7XqXLT/YRa3AOgOuU
         eXHH4JqZTAfd3b4+hnpurGjjnifT/obMK41+ZibqYin3G/dC4bg/q6rgqd60gzWMcCXk
         gvm01lXZ9qpI5CvaYKprJpHv1p+Y6AI/YM4X7NdPhqK+h/WwqYEk8ZnD1ywi3ETYtTgI
         AE0wXGVTshrVLtULVIoEhhkJ01n+VOg/TV9Wsa4hrVfLoO4hrpOaRzA4zu6wJCudS+33
         NcDQ==
X-Gm-Message-State: ACrzQf2xGWyATXSRv7yI9rdueJofWNQqifYAKRXiExTd1QI+ALGvSV6g
        W3NxZIEmu/0+dGhyJdflqOFK+uiFgJt/pc5+CYs=
X-Google-Smtp-Source: AMsMyM73T7sQinBCzLekjAyDwAmNbnozGWE+kGcpD0tocJ9mTYKW9DGs1JYdQO+Swp/Gs9Qswqxcnlr6878Xglf7kKg=
X-Received: by 2002:a17:907:2bd2:b0:7ad:9ada:a6ca with SMTP id
 gv18-20020a1709072bd200b007ad9adaa6camr4401791ejc.637.1666970120209; Fri, 28
 Oct 2022 08:15:20 -0700 (PDT)
MIME-Version: 1.0
Sender: paanhamzi178@gmail.com
Received: by 2002:a50:200c:0:b0:1da:a9eb:12c9 with HTTP; Fri, 28 Oct 2022
 08:15:19 -0700 (PDT)
From:   Pavillion Tchi <tchipavillion7@gmail.com>
Date:   Fri, 28 Oct 2022 15:15:19 +0000
X-Google-Sender-Auth: to3QvOH-BD2_u2jdNI1g9gMEaB8
Message-ID: <CA+gcyoUsT6dUmTVj4c6XtUwbGvM+8DErPa7wRN79coBBmkk2sg@mail.gmail.com>
Subject: Hallo
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

-- 
Hallo
Erhalten Sie meine vorherige E-Mail?
