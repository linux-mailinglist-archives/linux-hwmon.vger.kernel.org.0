Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71622188BA3
	for <lists+linux-hwmon@lfdr.de>; Tue, 17 Mar 2020 18:07:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbgCQRHR (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 17 Mar 2020 13:07:17 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44135 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbgCQRHQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 Mar 2020 13:07:16 -0400
Received: by mail-ot1-f68.google.com with SMTP id a49so19654911otc.11
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2020 10:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VudPPbgid+IOVvMAP116P9IN7W1PK4r6e92xmQ1xmVM=;
        b=sIqg0VzxFQwfl+NWdXDi591J6crh9n/XZpMU6biUNq1ohIi87AXY3udpx2XqMHkG9G
         AmFbSuaTV0n71kWgl2dwunxBA3bdTceAz5Tv6B7qbX+ChY+tJ8rO4aySoZwGR8ugZwWe
         JletsY23VuybykQ/pY2k6o4WLc9+SMC9quU/Z035kTOMLlD3FORwXXL7orXMI9gJ6bpO
         13TIqF+0JAf8hKTlpUgovjbiqHvCPNDR5K49lKbQ3IXF6Pr8vp0reLw6qA3Wz6J39zec
         we0h7fcwjRIXljWqhkCLie48zTmUzg17Vg16TPXJmn75bDntjrDD60Ilz7aU34a84sKu
         cUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VudPPbgid+IOVvMAP116P9IN7W1PK4r6e92xmQ1xmVM=;
        b=S71++t19Mz1i6xZqGvW1hdyknYtB6BgUQwM17v9qacqODs+YasTjfHoK5PXs2ZRkzp
         G7A8Mah48UBqcL3pu40VX6Souglb5Fxm/HQwJkkflqqY6S3sDYK2sBSB5ZuwbIuXFzI1
         xYqHnSMieEAZaAj50cuv+OR53MnV+KwZMoyQ65P1bfon7kLKZ8XdPpK9tCybWCTGX8Iz
         /hjb2kuTF8OssgWaVTOwl9ibBibQlB+LQ3NNdi8UjGKDrmbzr4ssUsHJxBkZXeE7toeE
         tf7N6OpDho2jSw934txyI/VxxI9Fnfb1tP7T4uMcitXMWyt6+MfN9J9DDKujFRroGb7D
         GTwQ==
X-Gm-Message-State: ANhLgQ2AXfFIemWoK4V5xwo+Ntw2T7DiG2pdQgsiW2QhQ4fyTCwYnX9q
        Fzzgk6EHKVBoabH3QrEgWl0Uqdvzt/MDCVRQ6OJNSA==
X-Google-Smtp-Source: ADFU+vu5W+BZZpY/VMpqNkUZ9RU5okoO9lMPTYpCARTmV5yjADrHMwmK0PiXPRTBtmoi8/X9ZZHucwoULMi4fh6GVLk=
X-Received: by 2002:a9d:63d2:: with SMTP id e18mr158576otl.277.1584464835611;
 Tue, 17 Mar 2020 10:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <1584464453-28200-1-git-send-email-tharvey@gateworks.com>
 <1584464453-28200-4-git-send-email-tharvey@gateworks.com> <f7ccbdb4-917a-2dd7-bf6b-8c82b87bc167@infradead.org>
In-Reply-To: <f7ccbdb4-917a-2dd7-bf6b-8c82b87bc167@infradead.org>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Tue, 17 Mar 2020 10:07:04 -0700
Message-ID: <CAJ+vNU3Bgn5W7E6RQbfygz=pGsDLLZ9tkQ0J4EPGn1COk9XLSw@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] hwmon: add Gateworks System Controller support
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Lee Jones <lee.jones@linaro.org>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux HWMON List <linux-hwmon@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Robert Jones <rjones@gateworks.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Mar 17, 2020 at 10:03 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 3/17/20 10:00 AM, Tim Harvey wrote:
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index 23dfe84..99dae13 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -494,6 +494,15 @@ config SENSORS_F75375S
> >         This driver can also be built as a module. If so, the module
> >         will be called f75375s.
> >
> > +config SENSORS_GSC
> > +        tristate "Gateworks System Controller ADC"
> > +        depends on MFD_GATEWORKS_GSC
> > +        help
> > +          Support for the Gateworks System Controller A/D converters.
>
> Hi Tim,
> Those 4 lines above should be using tabs for indentation.
> + 2 spaces on the final "Support" line.

Randy,

Thanks - can't believe I didn't see that. Checkpatch didn't catch it either.

I'll fix for v7.


Tim
