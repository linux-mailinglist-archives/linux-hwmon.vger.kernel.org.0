Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CBC561158E
	for <lists+linux-hwmon@lfdr.de>; Fri, 28 Oct 2022 17:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbiJ1PLS (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 28 Oct 2022 11:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbiJ1PLR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 Oct 2022 11:11:17 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04C101958DC
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Oct 2022 08:11:16 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id e22so1916052uar.5
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Oct 2022 08:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=huYKu3zCGUAjNe1V+fwzWUibgp5qt9T7Bp033OSK+pw=;
        b=H06sIArNmMbKUshTpaxUcEaZryiYkJjUrXdxKAF2CpbnnKxYQHni62AXv8Hshe0VKV
         gYHTWIxBsBBTwVYtgWR/W085mX00UCsb6UmZvvwYmKHsxIOVY4b3ncwsUKxdXW76GJy1
         X53iYuq6SPSoHbCzWUsYqpcXgVt6beWRiH6O183+cKkpKucRHW9XeJzKMuNif+Ki1mQX
         a45lzBVNKSkB5MeGIJv74I4J3w4DVbCP6/AhNHJ1pvktefqa2YZxXf9fW2oBX/EgATqe
         i4uTUTDuMh8WUPzehTK7wnPMzgmtf2TuSC6bGp3EZoECdivUeYTsOYOKDZ28gHuTQTGv
         tUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=huYKu3zCGUAjNe1V+fwzWUibgp5qt9T7Bp033OSK+pw=;
        b=HEI5vLlTnT/L6VS3vdjmsZklCTMALllsf2am4QKZyZBm+EQX21aXvPaETpMduv3yY4
         HxBM/Ku505q0e0SfwAc2TjqywZlJo8YVo8ZkIc4azZPeKHTYJKgg57pu15r33pJoSG3r
         peR1YUbXpYf1KlDPkydhmRztSu+UQlq64gVwxeIPJrQ+T4TBOyYKjk4t6cnC1GVnBAZ0
         FJbqKxIx+SkHiP6s2rG4pWkYcWDIALTbVp6DP7XFwnMwcUEBfdf6cKgNsZAvp+Oi/beH
         ClgUtstz3nZJKvS9moqA/5bjoI0gpG2uC6jzhWHT7jboSmQBGKiDhcz/4GYWOSOOIlcK
         sa5w==
X-Gm-Message-State: ACrzQf3jA6wn8i+vq4q4viglv+wyJbIaThMC+ScELETIcAAqCa+eMjKe
        N1f0mX7ZmH4Hqj4FA1KaBqE34u+j0mG2Ladn4xQ=
X-Google-Smtp-Source: AMsMyM5MlpT3ZMmRUoEMQOemKXqIecSZm1GpGTzRfdAZg8FBAko8pw5Rn7uSXGHwsOxEOADHZjPyN6x+cYAxOh0JQBs=
X-Received: by 2002:ab0:2546:0:b0:411:2adf:98ad with SMTP id
 l6-20020ab02546000000b004112adf98admr43557uan.72.1666969875120; Fri, 28 Oct
 2022 08:11:15 -0700 (PDT)
MIME-Version: 1.0
Sender: hamp56690@gmail.com
Received: by 2002:ab0:274f:0:0:0:0:0 with HTTP; Fri, 28 Oct 2022 08:11:14
 -0700 (PDT)
From:   Pavillion Tchi <tchipavillion7@gmail.com>
Date:   Fri, 28 Oct 2022 15:11:14 +0000
X-Google-Sender-Auth: t5DzOAD-YJBXcwEVmZnnZFkNJQE
Message-ID: <CAGPqaA5zQ0nWJddcZp04sUZxDR8sjA7n5edPBJCXXnCEcbtrfA@mail.gmail.com>
Subject: Hallo
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

-- 
Hallo
Erhalten Sie meine vorherige E-Mail?
