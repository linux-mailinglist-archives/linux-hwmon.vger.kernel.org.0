Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62BF9427B17
	for <lists+linux-hwmon@lfdr.de>; Sat,  9 Oct 2021 17:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234283AbhJIPGP (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 9 Oct 2021 11:06:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234280AbhJIPGO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 9 Oct 2021 11:06:14 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B3C4C061764
        for <linux-hwmon@vger.kernel.org>; Sat,  9 Oct 2021 08:04:17 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id m3so52191031lfu.2
        for <linux-hwmon@vger.kernel.org>; Sat, 09 Oct 2021 08:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OGLe+JiUqi54F2ySkYsS2QtCX9LvehXQPY8S3qSaldE=;
        b=I+eXPqnyOBKaP7ZCe8NDNREAhvgj1Smo9KSis2Ca746ylAN2D8hwMNdC+llB5Id66f
         nzL+L4Kbob01fdTUCPIhUlDQlXDwu12BsSWx1Wy5UVfNrdx8vbAYKDv2gO1S2Mr18Hmj
         UEMRfU6YbUtaBNa7OApZ39rSgDsrSnzlDboVIzrWiHntB4cUoEoBnh8IceFQ6YyRRqtt
         JItUKm9XdHefcut6cLD5xClPGMEvLmmLPzxcOiKkIdDEz1d25QdqwN8HwHb+TR7AXbYj
         7t49k+Mdaq66SJi1j3zc46lTK5Vuk0/3d2jf4WCotEFp91caF4r9z9E9CKnQmGlKd71B
         iLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OGLe+JiUqi54F2ySkYsS2QtCX9LvehXQPY8S3qSaldE=;
        b=msnmxtnHsGGKqpSr1ZEiXN2y9l3YmBcH60/FliAj8+XZCzlkkrdq+uTZTKXbGwKFxi
         FDAnJFXQ0Vgh9S7Dzkha0/5nCc3rv/7DzFHcRScZONIUMsg4OB38r0unnMMDvohXj+/n
         l+pxDN3PU9jrX2XT3CtfbGlmogj4X8rXGTiCNnKN3pgpMfbgdRI/hdYge7CDwhCNvgtv
         irstrCzh02J1Ql+0OOr6a0vqjwGjcg9ctcLf0kaipcz6+/VhskKMGWE7wLxdL32CYKvN
         RuViWOA5aBY0hUg917X12khaiERRhHaU9DoMrqrMnZz5zv5IpUFD5zOo/II4CvIxQSQ2
         RMDQ==
X-Gm-Message-State: AOAM531KAw8qZWuFHOkQT0RsJkb57Ra/bUBBj5Ya/kKZBDmOoPdY5NO9
        QDjczNzRH15sal8LYKt0GddDkRILh2LeAOJ3wg/d0w==
X-Google-Smtp-Source: ABdhPJwuv1AfC/v3+61gVtwUHbxRn+7J7M5NkHomfve/dLIPI1fRqJFmU/N5GJYDX0n1nV/oVLeDcndMMBR/GXXCZcc=
X-Received: by 2002:a2e:9c56:: with SMTP id t22mr10513412ljj.85.1633791855450;
 Sat, 09 Oct 2021 08:04:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211009025858.3326725-1-osk@google.com> <20211009025858.3326725-2-osk@google.com>
 <0674a2d0-f0a2-d6bc-33e3-483614602bae@roeck-us.net> <CABoTLcTL42a23=P501UoqNWr76A3fmEoxwjymz1-g0MNMyYPRA@mail.gmail.com>
In-Reply-To: <CABoTLcTL42a23=P501UoqNWr76A3fmEoxwjymz1-g0MNMyYPRA@mail.gmail.com>
From:   Oskar Senft <osk@google.com>
Date:   Sat, 9 Oct 2021 11:03:59 -0400
Message-ID: <CABoTLcTqhoFp0EafC5Asn-nPkkKVeYCROefXHDcQvZs==RijDQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] hwmon: (nct7802) Make temperature sensors configurable.
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

> > Please align continuation lines with "(".
> Oh, even if that would result in a lot of extra lines? Or just start
> the first argument on a new line?

> > space around '-'
> Oh yeah, I'm sorry. Is there a code formatter I should have run? I did
> run "checkpatch.pl", hoping that it would catch those.

> > Unnecessary continuation lines. There are several more of those;
> > I won't comment on it further. Please only use continuation lines if
> > the resulting line length is otherwise > 100 columns.
> Argh, yeah. After refactoring that function, I thought I caught all of
> them, but obviously I didn't. According to [1] we should stay within
> 80 columns (and use tabs that are 8 spaces wide). I assume that still
> applies? The rest of this code follows that rule.

For all of the above: I found that running clang-format within subl
for the new code does what we want. Sorry again for that, I'll start
doing that from now.

Oskar.
