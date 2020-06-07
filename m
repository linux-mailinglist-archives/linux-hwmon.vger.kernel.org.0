Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A0001F1059
	for <lists+linux-hwmon@lfdr.de>; Mon,  8 Jun 2020 01:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbgFGXMt (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sun, 7 Jun 2020 19:12:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726914AbgFGXMt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 7 Jun 2020 19:12:49 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB5CEC061A0E
        for <linux-hwmon@vger.kernel.org>; Sun,  7 Jun 2020 16:12:48 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id 9so8534076ljv.5
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Jun 2020 16:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=gi4SpPPFpWyMF5JDBl6va21NTE97tRQs4frQ/DcUQ5PCHgJpM9URG/0xBpQsmAtB0q
         QuZ7nTu18g38DPdxV7RYL1FVB/Bj1XPTEhoHGt0ZKn5l9YEAuKuM1aCtyQ+pBLMm9iV9
         Rg6mCpFSlLUKE6osdXc6H7zzXIYw8W0pgZBBwl6OdCqZOB/jRnz1xCtl7Q8A/hI5YMLG
         GXrw2vuiOwExUChiPTVQeIUmHbzJ2Ii2AqVm6e9fO/RFsZoGMJPZgozo8iL3fueZjIId
         EpvjBQek6KHExdGYWpT/pQMbs/llkjIzNk0GJkbi70UxydD6itjgchHYoLCfuVsTOEiR
         psfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=tSUsZ5NbT3jJr7j/0a8bv0NcdxGfWSuZZtwqLyvR3K3siOUY9qKSIF6CNRyViHD2Ik
         09kU3vVZdDJQfRfvSqSctuQcXDKibPizaq3Soud75afx7pB+uny8G9UPbZf7oMi9oNNS
         l5UNZ3XincXOglUsA2wznix0o69VWtGgetQ/t7T5NyYgZMb+cZNKBvb18cDIX2oWbUef
         z75+es0QCutdc1yUw5K6AU91EI9CJryaUKGQL07WcyVpJJDyQQCK8o6cZxTKa4OTIfj5
         gdtlFfbV0pFyjXqpPzrMacygQL5x23YpRo4MVH8cQyz5ngBmdxJincHpHFobNK7tJGaI
         a6yg==
X-Gm-Message-State: AOAM531QZKC8CibR6tbA8Qt/Uf9Pg+H7W2jU+E2Y3XYsa67lo1bXN3Ms
        EDVuacFTojPxTb6pPjjK1136bqMQzXO5FDjM9ys=
X-Google-Smtp-Source: ABdhPJyVPX9Ohr7e4xF+Lg8Nehpigpe4IanfXiJc0WfpujDhcPAUaOjJ/Nwik3iOgQimNq5PzqzuYyryDLNYNhi5kX8=
X-Received: by 2002:a2e:571b:: with SMTP id l27mr15860ljb.308.1591571567430;
 Sun, 07 Jun 2020 16:12:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6512:313b:0:0:0:0 with HTTP; Sun, 7 Jun 2020 16:12:46
 -0700 (PDT)
Reply-To: sylviajones046@gmail.com
From:   Sylvia Robinson <lorijrobinson589@gmail.com>
Date:   Mon, 8 Jun 2020 00:12:46 +0100
Message-ID: <CAKXTXJxsf9cN9UdpzqeRq0EboEteQue4S_i0a7KiAvWxfJg53Q@mail.gmail.com>
Subject: =?UTF-8?B?U2l6ZSBnw7ZuZGVyZGnEn2ltIG1lc2FqxLFtxLEgZ8O2cmTDvG4gbcO8Pw==?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


