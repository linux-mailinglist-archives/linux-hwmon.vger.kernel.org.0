Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CC0253AD4A
	for <lists+linux-hwmon@lfdr.de>; Wed,  1 Jun 2022 21:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbiFATbb (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 1 Jun 2022 15:31:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbiFATbM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 1 Jun 2022 15:31:12 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC631185C86
        for <linux-hwmon@vger.kernel.org>; Wed,  1 Jun 2022 12:29:43 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id f9so5866461ejc.0
        for <linux-hwmon@vger.kernel.org>; Wed, 01 Jun 2022 12:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:to;
        bh=txl4uVxW55sup1ZelsOVNrrdI0POfuRN54kLREKE82U=;
        b=Qnib4y3AiLHojAsYpys037yYK282G1MUsGsH20pvHler4OUXwZCW2OWRWyCMsQcjVp
         iwlkt+b5lh6+CRpqFvMKcgtZTD2oIF57FOsc8MvKZVh7AOoDDZLwUuYn1YDSZLqgQ/FD
         SnihN0JwAaH9DhVWqo7yCOaT02mZgdmOwYZUPNP83Q+F+oRabV3qyubCrHFswiTyVx1O
         lgyzIi1QyxAeJ/kIKxxtLOBlFeCXHpNJsPNa7x2mpkh8cwPnyZRVmtNDEu9MOVBsMmPY
         RaRLGLg5RPNIzwKXUOcM+nVIY0PB6xlGSWioPivRLWX9Kf9l9F9r3DM6Srp/VYkB1wgd
         xRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:to;
        bh=txl4uVxW55sup1ZelsOVNrrdI0POfuRN54kLREKE82U=;
        b=fozjHctegkiEuK0YSHBpLYs/CQcZfaLVBFHOACXQLOyhuOEUO6o/IlTp8buLoJ0b5v
         AZRer587mc85htjBFr22bBqDplMnWWr5Oy0FJXYZ8vCNF/eMd9DctnIiJ2zJjTRrklMh
         i8CeRKL+Vjs3BCuj0q3uexLkdDOePhmXIlu8Xq1XrJdDr7jWnxaDyHQ3qf3UQdJ0EWz2
         NEdWHvFZNXPyOVr/ZIIceJudtZp7CEaMyFPsGroOF8JueYgsEAZvnMRRQAO8hK90rxpn
         hcvdG8VoiWOvonJFc2wjjh5E9zqN5d9HyA8/7uBJg/+pzvm1jY8EoDcR71Uq3CVPjufx
         GA6A==
X-Gm-Message-State: AOAM530M/DxeMbMBqY/VyiknC4DUgMDyGxIbdH8B2Mh3RvvXp7GYc8CK
        q68BlgBVEBwuLT58inNS9kOEFGbTaZcM7uO703mcAU9TJokMOQ==
X-Google-Smtp-Source: ABdhPJy7Q79lifnJLlef+IqYVaycKmHEgPEFELUabLqdFS5hftEheS2/EF4+yNqckoeUeT3T4VUtv9Jk+iVUspN5vZY=
X-Received: by 2002:ac2:46cf:0:b0:478:edbb:37cf with SMTP id
 p15-20020ac246cf000000b00478edbb37cfmr694889lfo.524.1654111341330; Wed, 01
 Jun 2022 12:22:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6520:4201:b0:1e5:4db:7a49 with HTTP; Wed, 1 Jun 2022
 12:22:20 -0700 (PDT)
Reply-To: johnwinery@online.ee
In-Reply-To: <CAC0r5QXoEGNrz+z+u3hGN6iHCw3o72-2hfXwJPVBphH_85Nu1g@mail.gmail.com>
References: <CAC0r5QXoEGNrz+z+u3hGN6iHCw3o72-2hfXwJPVBphH_85Nu1g@mail.gmail.com>
From:   johnwinery <humghrysking@gmail.com>
Date:   Wed, 1 Jun 2022 12:22:20 -0700
Message-ID: <CAC0r5QVVvObuZ_r+fgzbSYQBD+LvkALng6epFEPkdxf7vGeC_w@mail.gmail.com>
Subject: Re:
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

   Greeting ,I had written an earlier mail to you but without response
