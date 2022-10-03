Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01C865F316C
	for <lists+linux-hwmon@lfdr.de>; Mon,  3 Oct 2022 15:41:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbiJCNlr (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 3 Oct 2022 09:41:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbiJCNlq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 3 Oct 2022 09:41:46 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1264B4314B
        for <linux-hwmon@vger.kernel.org>; Mon,  3 Oct 2022 06:41:45 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id f1so4735642ejw.7
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Oct 2022 06:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date;
        bh=87EL5HCbLLc+SMKcWI2SMW0ZJRDyqTkrepU7eacPBXo=;
        b=bROpYd1TRQxhngvEXGNWkS18E+DYiatO48+xhU5QOfEjeAUzEWhgS+cVsrcbnqm8Dr
         Dv5kL210lbVcRyadxC+0GPIMXkX5sITIe9vPhGudkUYQlgMmftFMLXUf1kPtA/FwLU+j
         Th/H3rfNDKQjooAERqLS3MK60PnFsF6+8V5JdN33P+8xZRqgp+Ew7n1n5pwHHVX7v6yk
         7HrSD0zU6JEeoKVjV+QXtGYAqWikdZm4a5qrinZr2F23O94qvgKwAmYbIeiB/W/QDuY3
         doporzl+Jnd4FxCKwY2IQwoZ9hAcB0huW0cgQ1A4W0gcGA+10jOpP3LO6iT1WRKRvqqL
         AGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=87EL5HCbLLc+SMKcWI2SMW0ZJRDyqTkrepU7eacPBXo=;
        b=d034jdYJy4GyDGW5HN5dXhuDThv7N/6xaP4zULtiJETQzXS7D4CC/dCWFsegWRI8b4
         E5yuGk6TivxUyEbKPpYoXshf85PniBRguFIehbcA+0Xe5en7og742OXP/MB4oHGHzJeZ
         RLG8iku4jnT58dMOh/YPW2TSY0tKdLyphPuNEUqycATyju5nOVNtR0M33cb/5WYELRzt
         Y0AgxjjH66iSX2lpSWOOjXrAeMt+7IACKQyWDU1FSXvU159ThnP2XpJ+bDReCALSKuDe
         4TQRdTZtYmgEvVmvbrbx1C6gssQgjxiY0sSDmlm67nD9TnCgWL44ZOkgHoNwZWbuhuUI
         2CuA==
X-Gm-Message-State: ACrzQf1cZj9cRpPNE4RoWaQD36PeL482vumUi2E3CuF1sDykGDMA2NRo
        cqbZXYDNfP/8NpDtQTU3pLbmztcVvpoBM39z5BVPPOz1/wE=
X-Google-Smtp-Source: AMsMyM4MtG7MaK01dm5TqTezCp4r6Y+UQZbLaKBt5WcmRnpJkUUeK1WSrB1Om9R9Xzn/SyWXSINPAK3grDK6ThKhPEk=
X-Received: by 2002:a17:906:ef8f:b0:77e:44be:790 with SMTP id
 ze15-20020a170906ef8f00b0077e44be0790mr15082456ejb.409.1664804503195; Mon, 03
 Oct 2022 06:41:43 -0700 (PDT)
MIME-Version: 1.0
Sender: aminamama100284@gmail.com
Received: by 2002:a98:b504:0:b0:186:894d:3107 with HTTP; Mon, 3 Oct 2022
 06:41:42 -0700 (PDT)
From:   Tomani David <davidtomani24@gmail.com>
Date:   Mon, 3 Oct 2022 13:41:42 +0000
X-Google-Sender-Auth: 60x0f43PIqNx_OaJ9fcjR9valF0
Message-ID: <CAPk9rGXnQ703HTUn01nSXG_gfOWfbmCP6dxgr9SNCQjuCV2WRQ@mail.gmail.com>
Subject: Opportunity
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Good afternoon,

I want to discuss a business with you.


Regards,
Mr. David
