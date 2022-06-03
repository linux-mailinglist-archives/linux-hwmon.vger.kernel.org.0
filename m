Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1870753D378
	for <lists+linux-hwmon@lfdr.de>; Sat,  4 Jun 2022 00:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348887AbiFCWGj (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 3 Jun 2022 18:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345833AbiFCWGj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 3 Jun 2022 18:06:39 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 110412EA06
        for <linux-hwmon@vger.kernel.org>; Fri,  3 Jun 2022 15:06:38 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id g25so9766636ljm.2
        for <linux-hwmon@vger.kernel.org>; Fri, 03 Jun 2022 15:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=XNJwV6t2iwnx+lObZP90z+4kjLtVO7C183KXFCzBYuM=;
        b=Qq1Pwb0W70h0k1Yctyg1NTdOG24aGt7wDn7gXLt428PZwd+A8MRFyT0U+pf/4M7d5U
         RK6cMfytvr6zZO87AqOGqqrLGge+RNs5l9dcszrAoiMhiA64TCoGUgluw0mpKs36DOss
         /TccHbwqZgKNmt8pxfbdmPYkZ2J4X/ONO1apaAxtLJJL8+QD19FZL9UrxDn8pO4gHb0b
         E6NRzjaVZS62VZOZQkXDnhW6nMSwJijffJ11JlVPWP9FAnGxD62gTFlb9cO84SwfY4gu
         pwfcldiZ2nJWXV8bJd87CtUIs+OfS1YNvlMVc382PDcGmCztcQEPj/JEam8NhC6sikpm
         dHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=XNJwV6t2iwnx+lObZP90z+4kjLtVO7C183KXFCzBYuM=;
        b=7+rIZW04DiKkTQKNmgOChFVB8lerezKouLzsg6wgwArvr0XtneLwhfQ6Tc6tx2Ozyo
         czMkhWbVnHinr98sHVUe4yEu6pwHz4LMdGT+c16yAzFEMQ3wl3yTxFLvxFwWYrSbPufd
         6Yq9wdhYxcXkakeQEh3+9x/QI2/DDKF0UGx75iPusn/5oaD7RWQvwM3RlUJN0JAkjgmw
         vf5fsLF5fvnollKWSqdGbYGByMEzfsfiGGq/N6uRDaDCXCNgBouWwhNjup6beikjJ3R8
         NqywFFjRXgsSNxwEPmpHOqMMgHdv7btqFaMJ3bkDjVL3fSK2Dnm1RMBvfLEfmmjNLmKa
         avxA==
X-Gm-Message-State: AOAM531VAWb1TEDzRTXigN/H3y0/juK3rHOLZdtaG5gje72dp9g/02MK
        GvYYhIvMBASe0YSOImcLkeDk6XdSCN+Y1Ww+7ho=
X-Google-Smtp-Source: ABdhPJwB5H4hKuCk0M4gwtprmaRGpPhTj6kRtB3u8JNpLCt3qzgq8o9/1lTjYNA1NmnSofY1EqeA1hHuzVD3N72ut+I=
X-Received: by 2002:a2e:8196:0:b0:255:673a:b215 with SMTP id
 e22-20020a2e8196000000b00255673ab215mr10666952ljg.338.1654293995971; Fri, 03
 Jun 2022 15:06:35 -0700 (PDT)
MIME-Version: 1.0
Sender: abdourahamane20180@gmail.com
Received: by 2002:a05:6512:715:0:0:0:0 with HTTP; Fri, 3 Jun 2022 15:06:34
 -0700 (PDT)
From:   Sherri Gallagher <sherrigallagher300@gmail.com>
Date:   Fri, 3 Jun 2022 10:06:34 -1200
X-Google-Sender-Auth: BryG_vuQHp0DHKMK9QFPy-ASctg
Message-ID: <CAB+b2ShnYxXjPkqFC8-kRsnN3xOjPRLRcsK3-2Y6ao2Y4nVJWQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

-- 
Greetings My name is Sherri Gallagher please reply back?
