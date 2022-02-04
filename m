Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5B54A9C87
	for <lists+linux-hwmon@lfdr.de>; Fri,  4 Feb 2022 16:55:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376344AbiBDPzo (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 4 Feb 2022 10:55:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376408AbiBDPz1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 4 Feb 2022 10:55:27 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ACA9C0613E3
        for <linux-hwmon@vger.kernel.org>; Fri,  4 Feb 2022 07:54:25 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id k25so20547756ejp.5
        for <linux-hwmon@vger.kernel.org>; Fri, 04 Feb 2022 07:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=0WvPIjvJySmeyGBuurh091SczFdPjzfvwwQjXNn6vDw=;
        b=XWochSNXHEL8ot1aOT4kMc8JFfZLXE+cxwBtAjMTii1VPGKt8EDgvdTgsWXEPge0Py
         2e4Tan/OoMN/RIQBoSZf6+kZFNT34Wz3yE89TfbtPbdWtZg3eHMGAFQ6DOGBSrLRtyhV
         UiOqoePKJ5x7TIxYAqSVQ/HPXMEzTTaz+4fR3y3XX9p97EU83YrAg2kfZoTVOISH7SIc
         waDiIqc23n613kezMGtaXo4YluZQyrcPCr+80ZP6SPAA5TN/QCJaUh0DjIDwVMIbPVGE
         T6apn95jmg+wpYPxp+FD9OUL5NXwDcLUFbgY6PeNnRL2nVqbaXDWi20pfNh3QdQOlplF
         g3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=0WvPIjvJySmeyGBuurh091SczFdPjzfvwwQjXNn6vDw=;
        b=uLsN74rI3d+HIxfalzmJqfREtpBAEkwoyMYMOUJU7DxAaTj6+utinbyGFXS+JkiaIV
         /GyRyouLOU3rehfEdUrA7U71wgbZ/LeACXhFF4LtQoSOzMKOwItWkURv9c+BAp78iS0s
         EjBTAPH7ekygE+QwTbqgkvlQz9XX3acSxG0xgI3teijuBpOP8LspT/Ad1E84qqX6tACq
         RXTxeh1nfdQD/Z8qfJeffNQnIfPKLK7sIePzC4GQyvqGDHiV3VDdav0EvKXJCDg/Ry3R
         1HM0yvHyTizJgrFEr4PlryAHULBKed1QyYta1RCFj60Q76hBx6QAKrBYgaPCyIZKNWFq
         tX2Q==
X-Gm-Message-State: AOAM531Ta/TJr038E3ZcwCJ6NYWb/lDtJRKuytG9eoPAoAlLl+z+06rz
        L4iwGuxkktKcWgUfKQf/sfNlJoy11AGoYQOxYA4=
X-Google-Smtp-Source: ABdhPJwTT20Roh0JGKYF1WIG77iPo/2n1No+CujnonUtGcF0B2LJIv9YUg86LRXJ6KH3tDN9lLP/Fi5393aKcYu2+Q4=
X-Received: by 2002:a17:907:62a9:: with SMTP id nd41mr3016856ejc.50.1643990063047;
 Fri, 04 Feb 2022 07:54:23 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:906:a45a:0:0:0:0 with HTTP; Fri, 4 Feb 2022 07:54:22
 -0800 (PST)
Reply-To: fionahill.usa@hotmail.com
From:   Fiona Hill <dr.sophia.moore@gmail.com>
Date:   Fri, 4 Feb 2022 07:54:22 -0800
Message-ID: <CAJUx1i-Q0w2b2Z_Cn+7Yocxb595ceq+DS0o_H97xrgDLBOnAfg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

-- 
How are you and your family you receive my message?
