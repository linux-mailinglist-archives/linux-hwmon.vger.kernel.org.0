Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78C863CC4C9
	for <lists+linux-hwmon@lfdr.de>; Sat, 17 Jul 2021 19:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232601AbhGQR17 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 17 Jul 2021 13:27:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232010AbhGQR17 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 17 Jul 2021 13:27:59 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C14EC06175F;
        Sat, 17 Jul 2021 10:25:02 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id s6so12116383qkc.8;
        Sat, 17 Jul 2021 10:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=HIdelOYVkXvp/qxPz8WJBlan8q/XWkh40by+RoPxkac=;
        b=UMH2OacpsSTnRsZBFhtCW8E1OCl2tEVoUprcTgbC8vT/3KSiAwGz69qVQdr7xN0DgJ
         vz3rLbPZ2x0P+J3iOlFOL9HmfHIyMmjjtwHR/jw7bnErwdUW2Or3Ov8iB8ZlNze//mtq
         7Y1WHL3CHUt3Ydd8OVnJPi3snivqXm+t6Gdwk8Qlbw/TXlkOZpZ+1/etvcfGXHd5cjtu
         FBTKJH15wSQ4+OyrcIDmYUevgAoyQyVxinsQxOP0Zu8ItmBcRNR8hPS/DbIOjkukkmh5
         ypSSa0qgCeSmRTP/XFWP8qWlW9Civ45FiaXDzPSqUdao62npV7/GcXWv//tQEAk6O7TL
         ojXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=HIdelOYVkXvp/qxPz8WJBlan8q/XWkh40by+RoPxkac=;
        b=c93Ka2gDe+7msnHIDw9B/ijnEy9ZAIpleejx/GRC2P3760/xV35PcWhqXCwP1jp/Zl
         0b0hFDjcaFrZxE/FSBl7IsY681N+tpoFgD9kgiNbn5pUnDLjLIWxoHJUIdv+d4hwCjjH
         etBHhRNt9b34leQPhYXccRBaEyfUtlUROowv4ttp42w7q36HMtvbg0Ui6KMftTrVGw0U
         irxZ4wa+xWnWUhwkoD8TwnEKjdcGG5nonIAUmUOPFMtX/K6v3/5qKhtrngCaLbRhkfQ3
         yg/f2+4ny1QbPf8iAbQDnfJtRGw0VQpuw0GQw/efMxJwpY4nht3nC36UXSlVtwkB5Ig+
         TevA==
X-Gm-Message-State: AOAM532gMiwYgVvOdxhjls1ai3rJbio5m9L3K7w8BIs//WzPgC9QJeZy
        FG0TgPXOup/eQ95ioVVafAw=
X-Google-Smtp-Source: ABdhPJwZKoqZj3Z+7iTS3sOrZSbZREHsozp+NoTnkeKzs1s6aA2Q9Kjvk04qhRqaGc4LkoKG5/hr5w==
X-Received: by 2002:a37:6701:: with SMTP id b1mr16139356qkc.260.1626542701438;
        Sat, 17 Jul 2021 10:25:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s6sm5570928qkc.125.2021.07.17.10.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 10:25:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 17 Jul 2021 10:24:59 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [RFC PATCH 1/6] hwmon: axi-fan-control: make sure the clock is
 enabled
Message-ID: <20210717172459.GA416538@roeck-us.net>
References: <20210708120111.519444-1-nuno.sa@analog.com>
 <20210708120111.519444-2-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210708120111.519444-2-nuno.sa@analog.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jul 08, 2021 at 02:01:06PM +0200, Nuno Sá wrote:
> The core will only work if it's clock is enabled. This patch is a
> minor enhancement to make sure that's the case.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Can I apply this patch as well as patches 4/6 and 5/6 as-is, or
do they depend on patches 2/6 and 3/6 ?

Thanks,
Guenter
