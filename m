Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 477671901E6
	for <lists+linux-hwmon@lfdr.de>; Tue, 24 Mar 2020 00:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbgCWXeH (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 23 Mar 2020 19:34:07 -0400
Received: from mail-pj1-f74.google.com ([209.85.216.74]:58916 "EHLO
        mail-pj1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgCWXeE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Mar 2020 19:34:04 -0400
Received: by mail-pj1-f74.google.com with SMTP id r42so1079121pjb.8
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2020 16:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=/RImki6aeT4q5vb9Y/WQiMvUYzgD9NDtY/Eh1UmZ8iA=;
        b=O4lRwQYfbO/ukCbwvjFzGUN4nuu1mInpQKXV5eRdJ5SDplvgn9LcJWm6RfdBFN6F9b
         /yKLvHw0uGBfbxttjiFdwHqZ9w0OJcJOYGxMtH1Ddf2OZXEpdxcwqYAkVGUAGntg/z62
         6EfOjsNJF0y5J2g8blj8p9nWe90nvI/wioQwcpoOr+sNNEMJorrCx/iEQYfeGMq0Bstw
         dYhXRL/U9y8ZQqLZ0JHUfoQGREPiJkV2hm4Q8Qpt9B6l1TcOeI5/TZXT0QpqUyw735Qd
         085QzqfH59RWraXUzemmYVcmKB6yxKyAxfm6cEJxkqalP7XX8QriSOcSsOEUFip1GJVY
         Zq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=/RImki6aeT4q5vb9Y/WQiMvUYzgD9NDtY/Eh1UmZ8iA=;
        b=rpj26khDVoGHw4DCYU0NVBq7Pz7P6LJiOfuYJp+ThrSltdgVtfiynmtSdYUG7oAZfU
         i6WwF+vrA4dBJn7gerqPfDxjk26wzQ7yWykDcdPL92lrg3Em0H2d/Yt4y7sZjID3vUHs
         dMjRZYCzljAUJwcJx2lZoB2R+VYBbzhPjHNog2p17QswMwJkooSiofOEgwZ0xzuj/yGo
         CFjKypxuMimTfIpT5GHU2vSV90FfzHxM1P+ZosjY7Wf+bAl7xSSZ+52kOh8vUPFSTo08
         CjDNZY91yj9LJ275LlwKo5MAM02fG09q3diDFk7AJXH7LkAj86EqhdxQZ1wlspa4V6TH
         ELuw==
X-Gm-Message-State: ANhLgQ2zrNqkwZM8pJiSeBXBJf/bdkphBIYAZNSyZ0Y2Q0hCtZyIR1sg
        aXuopeMwzJDsxnMrnkCcniG/h8qAHA==
X-Google-Smtp-Source: ADFU+vuekTP9i4w42Re9frhofj1tKIgwBJ7sai5hL7P0rtEiV2boFrt/rT5lNWcxnH3CEeV3UiBI89FLHA==
X-Received: by 2002:a63:da45:: with SMTP id l5mr23139967pgj.273.1585006441709;
 Mon, 23 Mar 2020 16:34:01 -0700 (PDT)
Date:   Mon, 23 Mar 2020 16:33:51 -0700
Message-Id: <20200323233354.239365-1-kunyi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH linux hwmon-next v2 0/3] SB-TSI hwmon driver v2
From:   Kun Yi <kunyi@google.com>
To:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     Kun Yi <kunyi@google.com>, openbmc@lists.ozlabs.org,
        joel@jms.id.au, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This patchset adds hwmon support for AMD SoC SB-TSI emulated temperature
sensor and related documentation.

v2: rewrote using devm_hwmon_device_register_with_info() API and addressed
    comments received in v1
v1: first version

Kun Yi (3):
  hwmon: (sbtsi) Add basic support for SB-TSI sensors
  hwmon: (sbtsi) Add documentation
  dt-bindings: (hwmon/sbtsi_tmep) Add SB-TSI hwmon driver bindings

 .../devicetree/bindings/hwmon/sbtsi_temp.txt  |  14 +
 Documentation/hwmon/sbtsi_temp.rst            |  40 +++
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/sbtsi_temp.c                    | 261 ++++++++++++++++++
 5 files changed, 326 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/sbtsi_temp.txt
 create mode 100644 Documentation/hwmon/sbtsi_temp.rst
 create mode 100644 drivers/hwmon/sbtsi_temp.c

-- 
2.25.1.696.g5e7596f4ac-goog

