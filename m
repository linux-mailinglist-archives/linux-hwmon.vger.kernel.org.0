Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 173454584BC
	for <lists+linux-hwmon@lfdr.de>; Sun, 21 Nov 2021 17:46:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238146AbhKUQtl (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sun, 21 Nov 2021 11:49:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230454AbhKUQtl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 21 Nov 2021 11:49:41 -0500
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09005C061714
        for <linux-hwmon@vger.kernel.org>; Sun, 21 Nov 2021 08:46:36 -0800 (PST)
Received: by mail-il1-x135.google.com with SMTP id l8so15676846ilv.3
        for <linux-hwmon@vger.kernel.org>; Sun, 21 Nov 2021 08:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=egauge.net; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :organization:user-agent:mime-version:content-transfer-encoding;
        bh=HuFgrGg2bNqZfAVR0F7+pPQW9sww/mE5aTG7ilf+0e4=;
        b=Bt1kDRz9ap4XGE/8gsQwAbG/EpWvpqYYrQ6Hsirta3pqThaza9MYYUAEWiHslezgcY
         GUhhKPOzSYtRCu3lHMOGKRKveBhUhzzVO0vK3xsz4BvRFjkziq1DD6lkoqTYfhOqFmnt
         +9yfCL4oPGizrgdamfM1gP+i2xfKRp/tn3lJ5VjoKhEWx3oSzGtgrV/ozXGAOGQlafPk
         5vNs8IzQulILMNQMUQXd82Q2kiBQ3UNHLV08Kxi1YKvNexqRQp3EeWt2MuOBwGR7bjKI
         c0qpLnna8Cohgc+KK0kKq2K3ZFJUHi2IHpLPSWntfJVMcnyxKNStxHcNgxVBpZ5G/HyH
         n4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=HuFgrGg2bNqZfAVR0F7+pPQW9sww/mE5aTG7ilf+0e4=;
        b=miby3JCuQztf5OV3e4dJY3UnHRq6fh05+P35oKvFBB+ACyfXey28Gm3NZ5hQBDyFnm
         TEqHOjUSoBlYT5Ebbl3jycdE85AxDSDnbeDuz6jW1j6tXgSabNtJ2iPXVHQ2DFEq9dUz
         5q9qPsYC/o/HxildYz7DFupMwSMReYh7PJ910bcamHwnjwblprHUxOPkUH6q3kmYdkqB
         uB0rXt9ZKaOmHSkXwfONsR82tBHbz87udtBe6isnLlL85nLePbuiRZ0lxjCAvFXhgfA9
         5AZ75vr5Jp8s1yjgkQS7UxFFdAy16z9/JUdxGkEYWPu7AMzWkRiqxCft8o5YS6Li1a0g
         iSGw==
X-Gm-Message-State: AOAM531qESgj1Cqhrji6ZDVSM7Y4SULKVTjvef2phdXJZhN5coPA0qZ0
        utx03AfJuoF0EjR+DK+LtV4Qh6u5WJV+KxA=
X-Google-Smtp-Source: ABdhPJzdjbC8MkTh06xDYAl+ykRvm2SdDwuq1d5v4/3FtjoIB3xnSEcfgVETjzbw2h4E5jfcqtcYFQ==
X-Received: by 2002:a05:6e02:546:: with SMTP id i6mr3912979ils.208.1637513195004;
        Sun, 21 Nov 2021 08:46:35 -0800 (PST)
Received: from ?IPv6:2601:281:8300:4e0:2ba9:697d:eeec:13b? ([2601:281:8300:4e0:2ba9:697d:eeec:13b])
        by smtp.gmail.com with ESMTPSA id k8sm4239846ilu.23.2021.11.21.08.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 08:46:34 -0800 (PST)
Message-ID: <f4ec6ca2fd8994fcd43bb1cb553371beea5de261.camel@egauge.net>
Subject: Re: [PATCH] hwmon: (sht4x) Add device tree match table
From:   David Mosberger-Tang <davidm@egauge.net>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Navin Sankar Velliangiri <navin@linumiz.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Sun, 21 Nov 2021 09:46:30 -0700
In-Reply-To: <20211121163137.GA3534505@roeck-us.net>
References: <20211121160637.2312106-1-davidm@egauge.net>
         <20211121163137.GA3534505@roeck-us.net>
Organization: eGauge Systems LLC
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, 2021-11-21 at 08:31 -0800, Guenter Roeck wrote:
> On Sun, Nov 21, 2021 at 04:07:02PM +0000, David Mosberger-Tang wrote:
> > This patch enables automatic loading of the sht4x module via a device
> > tree table entry.
> > 
> > Signed-off-by: David Mosberger-Tang <davidm@egauge.net>
> 
> I'll wait for the DT patch to be approved before applying.
> 
> Please send related patches as series in the future; this should have been
> patch 2/2, with the DT patch as first patch.

Ah, I misunderstood.  I thought you wanted me to send the two patches
to the relevant maintainers only.  I got it now.

Thanks,

  --david


