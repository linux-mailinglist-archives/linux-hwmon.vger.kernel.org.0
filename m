Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C401D496E38
	for <lists+linux-hwmon@lfdr.de>; Sat, 22 Jan 2022 23:45:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235016AbiAVWph (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 22 Jan 2022 17:45:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbiAVWpg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 22 Jan 2022 17:45:36 -0500
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46EC7C06173B
        for <linux-hwmon@vger.kernel.org>; Sat, 22 Jan 2022 14:45:36 -0800 (PST)
Received: by mail-qv1-xf2d.google.com with SMTP id g11so9324654qvu.3
        for <linux-hwmon@vger.kernel.org>; Sat, 22 Jan 2022 14:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=2sXe8OnEy5tHpjKg60R0Ff0ADmQIY55eD9X8p0CO2Yg=;
        b=NHB+8TYN8vebEY6QLk/xIMvwoBu1uzBhzxRy463HZaVGZylPKI36T1SkmOAgadpXUH
         k3Z+6c9LgteaFNlacS3BQb3liL9B3qyfs2AR3d15CB4GA0hTxNV8m+BIw3/HV3x0jN6N
         6HGfDeocrIGeYqwe+bu1o47xKRcyR1qMLCJ64ThQQndn/iEajEa3C2P/n2AGPfpE1XaL
         NTc7EN0fcqqTqx6wd19fvgFdgi8wktwlEoCg0HtnxiqQymKlvhNLugZqTDjg0NNryQXN
         HBx+wWMXlKgypEoOruJYsT1ciP/k8f4j/u0ZxKGvpLkcNtUo4IS93HnvLfURq6Q2NzoH
         7nFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=2sXe8OnEy5tHpjKg60R0Ff0ADmQIY55eD9X8p0CO2Yg=;
        b=gQesu7ExykpS7upECpc4rRrrIauay8QW2tHnXtuIc7CNqry83qBT07ZtOFumvxbYZg
         cbsb56KjmKr8zSZoJN4iesyVY4HWuxyctTgdB0BFoMAu1ra5dKD+o/3vYwk6t7t8rSdw
         8BkZpXF7d8MfEyhffr1sl218ziKbaxJ8+wguaE8jH752qPk1uGjFdHbN0umpIpF9XiWu
         ZC7Ww0aRZuJDC7wYqUQIyBZDEGN5Sw9q4RgCyArbngt6jtMy5R1rntJmpkNB7d+nkjHp
         V2d2+ZNQ7JSiU4YGlKKt4kWubbW7Wt6k53fmZ3vOjZjpNRxScXFs3R0j8PY0Yw6bQpIl
         E5nw==
X-Gm-Message-State: AOAM533INKmhK1fW5Rr1bjULAxQOWXhDndW0hnslqyy73quFjz7q/OmE
        f+ZJNRN6uZiNaaBaEZA8LPebrr7ii3p/aDT/wQg=
X-Google-Smtp-Source: ABdhPJxQLT5V5w0XnwLfEcTT8kw7hbbLZVkcCBFjb/SlCAc7v/AN1EHsWNh8DYGOSWeSdFFJoL+iM8G0w+h2S6eAIVk=
X-Received: by 2002:a05:6214:d43:: with SMTP id 3mr7253056qvr.21.1642891535378;
 Sat, 22 Jan 2022 14:45:35 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad4:5fcb:0:0:0:0:0 with HTTP; Sat, 22 Jan 2022 14:45:35
 -0800 (PST)
Reply-To: fionahill.usa@outlook.com
From:   Fiona Hill <sylviajones045@gmail.com>
Date:   Sat, 22 Jan 2022 14:45:35 -0800
Message-ID: <CAEsQPx42x232jz+qp_h0FUmQgJT+ai90AykVKZix03LkkHs+ZA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

-- 
Hi,Diid you receive   my  message i send to you ? I'm waiting for your
urgent respond,
