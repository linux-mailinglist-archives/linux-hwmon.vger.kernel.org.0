Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D2D3206F30
	for <lists+linux-hwmon@lfdr.de>; Wed, 24 Jun 2020 10:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388671AbgFXIph (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 24 Jun 2020 04:45:37 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:43968 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388638AbgFXIpg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 24 Jun 2020 04:45:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592988335;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=S2b8jLigyZb+R3i3+e/XAVkUga1RYeny5NHhX1UTOHk=;
        b=NDsFpPQmqP926OgaJGRqsawR73LhV3HTo/zx4s2ikUwF60rN8F6cijRig7pS/DtQsGx4jb
        2rS1vRTsMgwDFPlOXxkznSoYH9y7qAeQnnFXlwiN3kBMUo6qWtEghZ2eIOaTpkKLnxNAoa
        WKKOArHTdEdGcNTdapC2+6NSgpBSbxQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-1FzK3LHXPi6LtyKjuKsLMQ-1; Wed, 24 Jun 2020 04:45:31 -0400
X-MC-Unique: 1FzK3LHXPi6LtyKjuKsLMQ-1
Received: by mail-qk1-f200.google.com with SMTP id o63so1118001qkc.8
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Jun 2020 01:45:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S2b8jLigyZb+R3i3+e/XAVkUga1RYeny5NHhX1UTOHk=;
        b=XNqnbA8OjnjvW+zaGST9So1P+2oGBbsKA3oqxl/W1WebOx9+Er7tW8cGggk9Uea1xx
         DI8zr7/D/wEd3l+QoxpvqGFNZRVqZbcVM8OqHGS+d9GqShB6vUtThlI9zAEdU056S2wY
         kVzyj9rwoIIuTZmV1VwW8pT2/vma8bZvJF5FY3WWoou3eXugJpvqeHTaGa2nR6GZdMmH
         LnGMiLvQO8wC8BKR3iR9htMkbDjrWYnOMg8hxSSU6qpFezUXEpC22VEDi1RHHvhUgOEi
         Qe2jAkaq4RRb8wxWJt8Paet6Qdg8QMxeozde2ckKS3WM3/V5Nm6r67BUVQ6s7cn7fOcw
         GBTg==
X-Gm-Message-State: AOAM530zfscZ7ZAYQy6H8pLPEv71T15aUEmxGZXPljZ13gvAY7YqOurX
        goS1XmufZPoVype9Jbe3872TXHWfyoPocjw4o4wiBY2m0A2zXmIZW28Flh7fBYMFU/SrbVxAYR+
        KiTcqXe+Z46SmWY4oHVaUi+kJVN7KwCRh5STQDoI=
X-Received: by 2002:ad4:598f:: with SMTP id ek15mr30211367qvb.196.1592988330634;
        Wed, 24 Jun 2020 01:45:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAHk0i+wHdD9G0k78iapc862XPazRlaJgWStCZlsc5eOWTiAArDIkkFFTWqAuPKUUS2wS+4zC0nEtxoN1lNz8=
X-Received: by 2002:ad4:598f:: with SMTP id ek15mr30211352qvb.196.1592988330427;
 Wed, 24 Jun 2020 01:45:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200624072154.22486-1-mail@mariuszachmann.de> <20200624072154.22486-2-mail@mariuszachmann.de>
In-Reply-To: <20200624072154.22486-2-mail@mariuszachmann.de>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 24 Jun 2020 10:45:19 +0200
Message-ID: <CAO-hwJLo_v5mWaVJHcdf2aaK4yQHfKd8Xk2XTpUa61q_NsTb4g@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] input: add to hid_ignore_list
To:     Marius Zachmann <mail@mariuszachmann.de>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jiri Kosina <jikos@kernel.org>, linux-hwmon@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Marius,

On Wed, Jun 24, 2020 at 10:16 AM Marius Zachmann <mail@mariuszachmann.de> wrote:
>
> Signed-off-by: Marius Zachmann <mail@mariuszachmann.de>

I wasn't Cc-ed on the cover letter (0/3) if any, but there are a few
things to improve here (not code wise, I haven't reviewed the series,
but on the form).

Every commit needs a commit message. And here, this particular commit
just disables 2 device IDs from HID, which, without explanation seems
like you decided to remove support for 2 keyboards from the kernel. So
please add commit messages explaining *why* you are introducing a new
driver/change in the code.

Then, it would be much better to have a single commit that disables
the HID support and add the hwmon driver in one go. Leave the
synchronisation between the trees to the maintainers, and keep it
simple: you can squash your 3 commits together, so it's one semantic
action. This way, if there is a need to bisect or revert this patch,
we won't have side effects and can revert just one patch. Think also
that if someone needs that to be backported in a stable or a
distribution kernel, it would make everyone's life simpler.

That being said, if you squash the 3 patches and provide a good enough
explanation on the series, from a HID point of view, there should not
be any reasons for us to not give an Ack.

Cheers,
Benjamin

> ---
>  drivers/hid/hid-quirks.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index ca8b5c261c7c..7b7bc7737c53 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -699,6 +699,8 @@ static const struct hid_device_id hid_ignore_list[] = {
>         { HID_USB_DEVICE(USB_VENDOR_ID_AXENTIA, USB_DEVICE_ID_AXENTIA_FM_RADIO) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_BERKSHIRE, USB_DEVICE_ID_BERKSHIRE_PCWD) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_CIDC, 0x0103) },
> +       { HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, 0x0c10) },
> +       { HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, 0x1d00) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_CYGNAL, USB_DEVICE_ID_CYGNAL_RADIO_SI470X) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_CYGNAL, USB_DEVICE_ID_CYGNAL_RADIO_SI4713) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_CMEDIA, USB_DEVICE_ID_CM109) },
> --
> 2.27.0
>

